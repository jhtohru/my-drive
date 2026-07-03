package filesystem

import (
	"context"
	"errors"
	"io"
	"log/slog"
	"time"

	v1 "github.com/authzed/authzed-go/proto/authzed/api/v1"
	"github.com/authzed/authzed-go/v1"
	"github.com/google/uuid"
	"go.mongodb.org/mongo-driver/bson/primitive"
	"go.mongodb.org/mongo-driver/v2/bson"
	"go.mongodb.org/mongo-driver/v2/mongo"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"google.golang.org/protobuf/types/known/timestamppb"

	fsgrpc "github.com/jhtohru/my-docs/filesystem/gen/go/filesystem/v1"
)

type UserService interface {
	UserExists(ctx context.Context, id uuid.UUID) (bool, error)
}

// TODO: check the name
type FileSystemServer struct {
	fsgrpc.UnimplementedFileSystemServiceServer
	slog          *slog.Logger
	spiceDB       *authzed.Client
	mongoDB       *mongo.Database
	mongoUsersCol *mongo.Collection
	mongoNodesCol *mongo.Collection
}

func (fss *FileSystemServer) CreateUser(
	ctx context.Context,
	req *fsgrpc.CreateUserRequest,
) (*fsgrpc.CreateUserResponse, error) {
	userID := req.GetId()
	var user mongoUser
	filter := bson.M{"_id": idToBinary(userID)}
	err := fss.mongoUsersCol.FindOne(ctx, filter).Decode(&user)
	if err != nil && !errors.Is(err, mongo.ErrNoDocuments) {
		return nil, status.Errorf(codes.AlreadyExists, "user already exists")
	}

	homeFolderID := uuid.New().String()

	mongoSession, err := fss.mongoDB.Client().StartSession()
	if err != nil {
		return nil, err
	}
	defer mongoSession.EndSession(ctx)

	_, err = fss.spiceDB.WriteRelationships(ctx, &v1.WriteRelationshipsRequest{
		Updates: []*v1.RelationshipUpdate{{
			Operation: v1.RelationshipUpdate_OPERATION_CREATE,
			Relationship: &v1.Relationship{
				Resource: &v1.ObjectReference{
					ObjectType: "node",
					ObjectId:   homeFolderID,
				},
				Relation: "owner",
				Subject: &v1.SubjectReference{Object: &v1.ObjectReference{
					ObjectType: "user",
					ObjectId:   userID,
				}},
			},
		}},
	})
	if err != nil {
		return nil, err
	}

	now := time.Now()
	user.ID = idToBinary(userID)
	user.HomeFolderID = idToBinary(homeFolderID)
	user.CreatedAt = now
	homeFolder := mongoNode{
		ID:        idToBinary(homeFolderID),
		Type:      nodeTypeFolder,
		CreatedAt: now,
		UpdatedAt: now,
	}

	_, err = mongoSession.WithTransaction(ctx, func(ctx context.Context) (any, error) {
		if _, err := fss.mongoUsersCol.InsertOne(ctx, user); err != nil {
			return nil, err
		}
		if _, err := fss.mongoNodesCol.InsertOne(ctx, homeFolder); err != nil {
			return nil, err
		}
		return nil, nil
	})
	if err != nil {
		if _, err := fss.spiceDB.WriteRelationships(ctx, &v1.WriteRelationshipsRequest{
			Updates: []*v1.RelationshipUpdate{{
				Operation: v1.RelationshipUpdate_OPERATION_DELETE,
				Relationship: &v1.Relationship{
					Resource: &v1.ObjectReference{
						ObjectType: "node",
						ObjectId:   homeFolderID,
					},
					Relation: "owner",
					Subject: &v1.SubjectReference{Object: &v1.ObjectReference{
						ObjectType: "user",
						ObjectId:   userID,
					}},
				},
			}},
		}); err != nil {
			// TODO: handle data inconsistency
			return nil, err
		}
		return nil, err
	}

	return &fsgrpc.CreateUserResponse{User: &fsgrpc.User{
		Id:           userID,
		HomeFolderId: homeFolderID,
	}}, nil
}

func (fss *FileSystemServer) CreateNode(
	ctx context.Context,
	req *fsgrpc.CreateNodeRequest,
) (*fsgrpc.CreateNodeResponse, error) {
	var mNode mongoNode
	filter := bson.M{"_id": idToBinary(req.GetParentFolderId())}
	if err := fss.mongoNodesCol.FindOne(ctx, filter).Decode(&mNode); err != nil {
		if errors.Is(err, mongo.ErrNoDocuments) {
			return nil, status.Errorf(codes.FailedPrecondition, "parent folder not found")
		}
		return nil, err
	}

	if mNode.Type != nodeTypeFolder {
		return nil, status.Errorf(codes.FailedPrecondition, "parent is not a folder")
	}

	// TODO: check if user exists

	// TODO: check if parent node both exists and is a folder
	// TODO: check if there is data for a folder node (make data optional on proto?)
	now := timestamppb.New(time.Now().Truncate(time.Millisecond))
	node := &fsgrpc.Node{
		Id:             uuid.New().String(),
		Type:           req.Type,
		ParentFolderId: req.ParentFolderId,
		OwnerId:        req.OwnerId,
		Title:          req.Title,
		Data:           req.Data,
		CreatedAt:      now,
		UpdatedAt:      now,
	}

	_, err := fss.spiceDB.WriteRelationships(ctx, &v1.WriteRelationshipsRequest{
		Updates: []*v1.RelationshipUpdate{
			{
				Operation: v1.RelationshipUpdate_OPERATION_CREATE,
				Relationship: &v1.Relationship{
					Resource: &v1.ObjectReference{
						ObjectType: "node",
						ObjectId:   node.Id,
					},
					Relation: "owner",
					Subject: &v1.SubjectReference{Object: &v1.ObjectReference{
						ObjectType: "user",
						ObjectId:   node.OwnerId,
					}},
				},
			},
			{
				Operation: v1.RelationshipUpdate_OPERATION_CREATE,
				Relationship: &v1.Relationship{
					Resource: &v1.ObjectReference{
						ObjectType: "node",
						ObjectId:   node.Id,
					},
					Relation: "parent",
					Subject: &v1.SubjectReference{
						Object: &v1.ObjectReference{
							ObjectType: "node",
							ObjectId:   node.ParentFolderId,
						},
					},
				},
			},
		},
	})
	if err != nil {
		return nil, err
	}

	if _, err := fss.mongoNodesCol.InsertOne(ctx, grpcToMongo(node)); err != nil {
		if _, err := fss.spiceDB.WriteRelationships(ctx, &v1.WriteRelationshipsRequest{
			Updates: []*v1.RelationshipUpdate{
				{
					Operation: v1.RelationshipUpdate_OPERATION_DELETE,
					Relationship: &v1.Relationship{
						Resource: &v1.ObjectReference{
							ObjectType: "node",
							ObjectId:   node.Id,
						},
						Relation: "owner",
						Subject: &v1.SubjectReference{Object: &v1.ObjectReference{
							ObjectType: "user",
							ObjectId:   node.OwnerId,
						}},
					},
				},
				{
					Operation: v1.RelationshipUpdate_OPERATION_DELETE,
					Relationship: &v1.Relationship{
						Resource: &v1.ObjectReference{
							ObjectType: "node",
							ObjectId:   node.Id,
						},
						Relation: "parent",
						Subject: &v1.SubjectReference{Object: &v1.ObjectReference{
							ObjectType: "node",
							ObjectId:   node.OwnerId,
						}},
					},
				},
			},
		}); err != nil {
			return nil, err
		}
		return nil, err
	}

	return &fsgrpc.CreateNodeResponse{Node: node}, nil
}

func (fss *FileSystemServer) GetNode(
	ctx context.Context,
	req *fsgrpc.GetNodeRequest,
) (*fsgrpc.GetNodeResponse, error) {
	nodes, err := fss.getNodes(ctx, []string{req.GetId()})
	if err != nil {
		return nil, err
	}
	return &fsgrpc.GetNodeResponse{Node: nodes[0]}, nil
}

func (fss *FileSystemServer) ListFolderContents(
	ctx context.Context,
	req *fsgrpc.ListFolderContentsRequest,
) (*fsgrpc.ListFolderContentsResponse, error) {
	var mNode mongoNode
	filter := bson.M{"_id": idToBinary(req.GetFolderId())}
	if err := fss.mongoNodesCol.FindOne(ctx, filter).Decode(&mNode); err != nil {
		if errors.Is(err, mongo.ErrNoDocuments) {
			return nil, status.Errorf(codes.NotFound, "node not found")
		}
		return nil, err
	}
	if mNode.Type != nodeTypeFolder {
		return nil, status.Errorf(codes.FailedPrecondition, "node is not a folder")
	}

	stream, err := fss.spiceDB.LookupResources(ctx, &v1.LookupResourcesRequest{
		ResourceObjectType: "node",
		Permission:         "parent",
		Subject: &v1.SubjectReference{Object: &v1.ObjectReference{
			ObjectType: "node",
			ObjectId:   req.GetFolderId(),
		}},
	})
	if err != nil {
		return nil, err
	}
	var nodeIDs []string
	for {
		resp, err := stream.Recv()
		if err != nil {
			if errors.Is(err, io.EOF) {
				break
			}
			return nil, err
		}
		nodeIDs = append(nodeIDs, resp.ResourceObjectId)
	}

	filter = bson.M{"_id": bson.M{"$in": idsToBinaries(nodeIDs)}}
	cursor, err := fss.mongoNodesCol.Find(ctx, filter)
	if err != nil {
		return nil, err
	}
	var mNodes []*mongoNode // TODO: Does setting the slice size here help?
	if err := cursor.All(ctx, &mNodes); err != nil {
		return nil, err
	}

	var nodes []*fsgrpc.Node
	for _, mNode := range mNodes {
		node := mustGRPCFromMongo(mNode)
		node.ParentFolderId = req.GetFolderId()
		// TODO: paralelize following call to SpiceDB
		stream, err := fss.spiceDB.LookupSubjects(ctx, &v1.LookupSubjectsRequest{
			Resource: &v1.ObjectReference{
				ObjectType: "node",
				ObjectId:   node.Id,
			},
			Permission:        "owner",
			SubjectObjectType: "user",
		})
		if err != nil {
			return nil, err
		}
		resp, err := stream.Recv()
		if err != nil {
			return nil, err
		}
		node.OwnerId = resp.Subject.SubjectObjectId

		nodes = append(nodes, node)
	}

	// TODO: sort results?

	return &fsgrpc.ListFolderContentsResponse{Nodes: nodes}, nil
}

func (fss *FileSystemServer) ListNodesSharedWithUser(
	ctx context.Context,
	req *fsgrpc.ListNodesSharedWithUserRequest,
) (*fsgrpc.ListNodesSharedWithUserResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method ListNodesSharedWithUser not implemented")
}

func (fss *FileSystemServer) UpdateNode(
	ctx context.Context,
	req *fsgrpc.UpdateNodeRequest,
) (*fsgrpc.UpdateNodeResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method UpdateNode not implemented")
}

func (fss *FileSystemServer) DeleteNode(
	ctx context.Context,
	req *fsgrpc.DeleteNodeRequest,
) (*fsgrpc.DeleteNodeResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method DeleteNode not implemented")
}

func (fss *FileSystemServer) ShareNode(
	ctx context.Context,
	req *fsgrpc.ShareNodeRequest,
) (*fsgrpc.ShareNodeResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method ShareNode not implemented")
}

func (fss *FileSystemServer) ListNodeShares(
	ctx context.Context,
	req *fsgrpc.ListNodeSharesRequest,
) (*fsgrpc.ListNodeSharesResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method ListNodeShares not implemented")
}

func (fss *FileSystemServer) UpdateNodeShare(
	ctx context.Context,
	req *fsgrpc.UpdateNodeShareRequest,
) (*fsgrpc.UpdateNodeShareResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method UpdateNodeShare not implemented")
}

func (fss *FileSystemServer) UnshareNode(
	ctx context.Context,
	req *fsgrpc.UnshareNodeRequest,
) (*fsgrpc.UnshareNodeResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method UnshareNode not implemented")
}

func (fss *FileSystemServer) MoveNode(
	ctx context.Context,
	req *fsgrpc.MoveNodeRequest,
) (*fsgrpc.MoveNodeResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method MoveNode not implemented")
}

func (fss *FileSystemServer) getNodes(
	ctx context.Context,
	ids []string,
) ([]*fsgrpc.Node, error) {
	filter := bson.M{"_id": idsToBinaries(ids)}
	cursor, err := fss.mongoNodesCol.Find(ctx, filter)
	if err != nil {
		return nil, err
	}
	var mNodes []*mongoNode // TODO: Does setting the slice size here help?
	if err := cursor.All(ctx, &mNodes); err != nil {
		return nil, err
	}

	var nodes []*fsgrpc.Node
	for _, mNode := range mNodes {
		node := mustGRPCFromMongo(mNode)
		// TODO: paralelize following calls to SpiceDB
		stream, err := fss.spiceDB.LookupSubjects(ctx, &v1.LookupSubjectsRequest{
			Resource: &v1.ObjectReference{
				ObjectType: "node",
				ObjectId:   node.Id,
			},
			Permission:        "owner",
			SubjectObjectType: "user",
		})
		if err != nil {
			return nil, err
		}
		resp, err := stream.Recv()
		if err != nil {
			return nil, err
		}
		node.OwnerId = resp.Subject.SubjectObjectId

		stream, err = fss.spiceDB.LookupSubjects(ctx, &v1.LookupSubjectsRequest{
			Resource: &v1.ObjectReference{
				ObjectType: "node",
				ObjectId:   node.Id,
			},
			Permission:        "parent",
			SubjectObjectType: "node",
		})
		resp, err = stream.Recv()
		if err != nil {
			return nil, err
		}
		node.ParentFolderId = resp.Subject.SubjectObjectId

		nodes = append(nodes, node)
	}

	return nodes, nil
}

type mongoUser struct {
	ID           primitive.Binary `bson:"_id"`
	HomeFolderID primitive.Binary `bson:"home_folder_id"`
	CreatedAt    time.Time        `bson:"created_at"`
}

type mongoNode struct {
	ID        primitive.Binary `bson:"_id"`
	Type      string           `bson:"type"`
	Title     string           `bson:"title"`
	Data      []byte           `bson:"data"`
	CreatedAt time.Time        `bson:"created_at"`
	UpdatedAt time.Time        `bson:"updated_at"`
}

const (
	nodeTypeFile   = "file"
	nodeTypeFolder = "folder"
)

func grpcToMongo(node *fsgrpc.Node) *mongoNode {
	mNode := &mongoNode{
		ID:        idToBinary(node.GetId()),
		Title:     node.GetTitle(),
		Data:      node.GetData(),
		CreatedAt: node.GetCreatedAt().AsTime(),
		UpdatedAt: node.GetUpdatedAt().AsTime(),
	}
	switch node.Type {
	case fsgrpc.NodeType_NODE_TYPE_FILE:
		mNode.Type = nodeTypeFile
	case fsgrpc.NodeType_NODE_TYPE_FOLDER:
		mNode.Type = nodeTypeFolder
	}
	return mNode
}

func mustGRPCFromMongo(mNode *mongoNode) *fsgrpc.Node {
	node := &fsgrpc.Node{
		Id:        mustIDFromBinary(mNode.ID),
		Title:     mNode.Title,
		Data:      mNode.Data,
		CreatedAt: timestamppb.New(mNode.CreatedAt),
		UpdatedAt: timestamppb.New(mNode.UpdatedAt),
	}
	switch mNode.Type {
	case nodeTypeFile:
		node.Type = fsgrpc.NodeType_NODE_TYPE_FILE
	case nodeTypeFolder:
		node.Type = fsgrpc.NodeType_NODE_TYPE_FOLDER
	}
	return node
}

func idsToBinaries(ids []string) []primitive.Binary {
	bins := make([]primitive.Binary, 0, len(ids))
	for _, id := range ids {
		bins = append(bins, idToBinary(id))
	}
	return bins
}

func idToBinary(id string) primitive.Binary {
	uid := uuid.MustParse(id)
	return primitive.Binary{
		Subtype: 0x04,
		Data:    uid[:],
	}
}

func mustIDFromBinary(mID primitive.Binary) string {
	id, err := uuid.FromBytes(mID.Data)
	if err != nil {
		panic("mongo id is not a valid uuid")
	}
	return id.String()
}
