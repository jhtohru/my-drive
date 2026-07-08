package filesystem

import (
	"context"
	"errors"
	"time"

	"github.com/google/uuid"
	"go.mongodb.org/mongo-driver/bson/primitive"
	"go.mongodb.org/mongo-driver/v2/bson"
	"go.mongodb.org/mongo-driver/v2/mongo"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"google.golang.org/protobuf/types/known/timestamppb"

	fsgrpc "github.com/jhtohru/my-drive/filesystem/gen/go/filesystem/v1"
)

type GRPCServer struct {
	fsgrpc.UnimplementedFileSystemServiceServer
	mongo                                   *mongo.Client
	mongoDBName, usersColName, nodesColName string
}

func NewGRPCServer(
	mongoClient *mongo.Client,
	mongoDBName string,
	usersColName string,
) *GRPCServer {
	return &GRPCServer{
		mongo:        mongoClient,
		mongoDBName:  mongoDBName,
		usersColName: usersColName,
	}
}

func (svr *GRPCServer) CreateUser(
	ctx context.Context,
	req *fsgrpc.CreateUserRequest,
) (*fsgrpc.CreateUserResponse, error) {
	ok, err := svr.userExists(ctx, req.GetId())
	if err != nil {
		return nil, err
	}
	if ok {
		return nil, status.Errorf(codes.AlreadyExists, "user already exists")
	}

	// TODO: create home folder

	userID := req.GetId()
	user := mongoUser{
		ID:        idToBinary(userID),
		CreatedAt: time.Now(),
	}
	if _, err := svr.mongoUsers().InsertOne(ctx, user); err != nil {
		return nil, err
	}

	return &fsgrpc.CreateUserResponse{User: &fsgrpc.User{
		Id:        userID,
		CreatedAt: timestamppb.New(user.CreatedAt),
	}}, nil
}

func (svr *GRPCServer) userExists(
	ctx context.Context,
	id string,
) (bool, error) {
	filter := bson.M{"_id": idToBinary(id)}
	err := svr.mongoUsers().FindOne(ctx, filter).Err()
	if err != nil {
		if errors.Is(err, mongo.ErrNoDocuments) {
			return false, nil
		}
		return false, err
	}
	return true, nil
}

type mongoUser struct {
	ID           primitive.Binary `bson:"_id"`
	HomeFolderID primitive.Binary `bson:"home_folder_id"`
	CreatedAt    time.Time        `bson:"created_at"`
}

func (svr *GRPCServer) mongoUsers() *mongo.Collection {
	return svr.mongoDB().Collection(svr.usersColName)
}

func (svr *GRPCServer) mongoNodes() *mongo.Collection {
	return svr.mongoDB().Collection(svr.nodesColName)
}

func (svr *GRPCServer) mongoDB() *mongo.Database {
	return svr.mongo.Database(svr.mongoDBName)
}

func idToBinary(id string) primitive.Binary {
	uid := uuid.MustParse(id)
	return primitive.Binary{
		Subtype: 0x04,
		Data:    uid[:],
	}
}
