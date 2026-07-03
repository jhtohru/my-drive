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
	"gorm.io/gorm/logger"
)

const (
	NodeTypeFile   = "file"
	NodeTypeFolder = "folder"
)

type Node struct {
	ID        uuid.UUID `json:"id"`
	Type      string    `json:"type"`
	Title     string    `json:"title"`
	Data      []byte    `json:"data"`
	CreatedAt time.Time `json:"created_at"`
	UpdatedAt time.Time `json:"updated_at"`
}

func NodeTypeIsValid(nt string) bool {
	return nt == NodeTypeFile ||
		nt == NodeTypeFolder
}

func NodeTitleIsValid(title string) bool {
	return title != ""
}

type ValidationError struct {
	msg string
}

func (verr *ValidationError) Error() string {
	return verr.msg
}

type CreateNodeRequest struct {
	Type           string
	ParentFolderID *uuid.UUID
	OwnerID        uuid.UUID
	Title          string
	Data           []byte
}

// TODO: Should I use point or value receiver?
func (req CreateNodeRequest) Validate() *ValidationError {
	if !NodeTypeIsValid(req.Type) {
		return &ValidationError{"invalid node type"}
	}
	if !NodeTitleIsValid(req.Title) {
		return &ValidationError{"invalid title"}
	}
	if req.Type == NodeTypeFolder && len(req.Data) != 0 {
		return &ValidationError{"invalid data for a folder-typed node"}
	}
	return nil
}

type GetNodeRequest struct {
	UserID uuid.UUID
	NodeID uuid.UUID
}

func (req GetNodeRequest) Validate() error {
	return nil
}

type ListHomeFolderContentsRequest struct {
	UserID uuid.UUID
}

func (req ListHomeFolderContentsRequest) Validate() error {
	return nil
}

type ListSharedFolderContentsRequest struct {
	UserID uuid.UUID
}

func (req ListSharedFolderContentsRequest) Validate() error {
	return nil
}

type ListFolderContentsRequest struct {
	UserID   uuid.UUID
	FolderID uuid.UUID
}

func (req ListFolderContentsRequest) Validate() error {
	return nil
}

type ListNodeSharesRequest struct {
	UserID uuid.UUID
	NodeID uuid.UUID
}

func (req ListNodeSharesRequest) Validate() error {
	return nil
}

type User struct {
	ID       uuid.UUID `json:"id"`
	Username string    `json:"username"`
}

type UpdateNodeRequest struct {
	UserID uuid.UUID
	NodeID uuid.UUID
	Title  string
	Data   []byte
}

func (req UpdateNodeRequest) Validate() error {
	return nil
}

type DeleteNodeRequest struct {
	UserID uuid.UUID
	NodeID uuid.UUID
}

func (req DeleteNodeRequest) Validate() error {
	return nil
}

const (
	AccessRoleViewer = "viewer"
	AccessRoleEditor = "editor"
)

type NodeShare struct {
	NodeID     uuid.UUID
	AccessRole string
	ShareeID   uuid.UUID
}

type ShareNodeRequest struct {
	UserID     uuid.UUID
	NodeID     uuid.UUID
	AccessRole string
	ShareeID   uuid.UUID
}

func (req ShareNodeRequest) Validate() error {
	return nil
}

type UpdateNodeShareRequest struct {
	UserID     uuid.UUID
	NodeID     uuid.UUID
	ShareeID   uuid.UUID
	AccessRole string
}

func (req UpdateNodeShareRequest) Validate() error {
	return nil
}

type UnshareNodeRequest struct {
	UserID   uuid.UUID
	NodeID   uuid.UUID
	ShareeID uuid.UUID
}

type MoveNodeRequest struct {
	UserID              uuid.UUID
	NodeID              uuid.UUID
	DestinationFolderID uuid.UUID
}

// TODO: Should I return *Node or Node; []*Node or []Node?
// TODO: Implement pagination on list endpoints.
type FileSystemService interface {
}

var (
	ErrNotFound        = errors.New("not found")
	ErrForbiddenAccess = errors.New("forbidden access")
	ErrNotFolder       = errors.New("node is not a folder")
)

type FSS struct {
	spiceDB *authzed.Client
	mongo   *mongo.Collection
}

func (fss *FSS) CreateNode(ctx context.Context, req *CreateNodeRequest) (*Node, error) {
	// TODO: Should I qualify errors?
	if err := req.Validate(); err != nil {
		return nil, err
	}

	now := time.Now()
	node := &Node{
		ID:        uuid.New(),
		Type:      req.Type,
		Title:     req.Title,
		Data:      req.Data,
		CreatedAt: now,
		UpdatedAt: now,
	}
	// Using user id for the home directory id to avoid managing user data outside keycloak:
	var parID uuid.UUID
	if req.ParentFolderID != nil {
		parID = *req.ParentFolderID
	} else {
		parID = req.OwnerID
	}

	_, err := fss.spiceDB.WriteRelationships(ctx, &v1.WriteRelationshipsRequest{
		Updates: []*v1.RelationshipUpdate{
			{
				Operation: v1.RelationshipUpdate_OPERATION_CREATE,
				Relationship: &v1.Relationship{
					Resource: &v1.ObjectReference{
						ObjectType: "node",
						ObjectId:   node.ID.String(),
					},
					Relation: "owner",
					Subject: &v1.SubjectReference{Object: &v1.ObjectReference{
						ObjectType: "user",
						ObjectId:   req.OwnerID.String(),
					}},
				},
			},
			{
				Operation: v1.RelationshipUpdate_OPERATION_CREATE,
				Relationship: &v1.Relationship{
					Resource: &v1.ObjectReference{
						ObjectType: "node",
						ObjectId:   node.ID.String(),
					},
					Relation: "parent",
					Subject: &v1.SubjectReference{
						Object: &v1.ObjectReference{
							ObjectType: "node",
							ObjectId:   parID.String(),
						},
					},
				},
			},
		},
	})
	if err != nil {
		return nil, err
	}

	if _, err := fss.mongo.InsertOne(ctx, nodeToMongo(node)); err != nil {
		if _, err := fss.spiceDB.WriteRelationships(ctx, &v1.WriteRelationshipsRequest{
			Updates: []*v1.RelationshipUpdate{
				{
					Operation: v1.RelationshipUpdate_OPERATION_DELETE,
					Relationship: &v1.Relationship{
						Resource: &v1.ObjectReference{
							ObjectType: "node",
							ObjectId:   node.ID.String(),
						},
						Relation: "owner",
						Subject: &v1.SubjectReference{Object: &v1.ObjectReference{
							ObjectType: "user",
							ObjectId:   req.OwnerID.String(),
						}},
					},
				},
				{
					Operation: v1.RelationshipUpdate_OPERATION_DELETE,
					Relationship: &v1.Relationship{
						Resource: &v1.ObjectReference{
							ObjectType: "node",
							ObjectId:   node.ID.String(),
						},
						Relation: "parent",
						Subject: &v1.SubjectReference{Object: &v1.ObjectReference{
							ObjectType: "node",
							ObjectId:   req.OwnerID.String(),
						}},
					},
				},
			},
		}); err != nil {
			return nil, err
		}
		return nil, err
	}

	return node, nil
}

func (fss *FSS) GetNode(ctx context.Context, req *GetNodeRequest) (*Node, error) {
	if err := req.Validate(); err != nil {
		return nil, err
	}

	node, err := fss.findNode(ctx, req.NodeID)
	if err != nil {
		if errors.Is(err, mongo.ErrNoDocuments) {
			return nil, ErrNotFound
		}
		return nil, err
	}

	if err := fss.checkPermission(ctx, "node", req.NodeID, "view", "user", req.UserID); err != nil {
		return nil, err
	}

	return node, nil
}

func (fss *FSS) ListHomeFolderContents(ctx context.Context, req *ListHomeFolderContentsRequest) ([]*Node, error) {
	if err := req.Validate(); err != nil {
		return nil, err
	}

	return fss.lookupNodes(ctx, "parent", "node", req.UserID)
}

func (fss *FSS) ListSharedFolderContents(ctx context.Context, req *ListSharedFolderContentsRequest) ([]*Node, error) {
	if err := req.Validate(); err != nil {
		return nil, err
	}

	return fss.lookupNodes(ctx, "sharee", "user", req.UserID)
}

func (fss *FSS) ListFolderContents(ctx context.Context, req *ListFolderContentsRequest) ([]*Node, error) {
	if err := req.Validate(); err != nil {
		return nil, err
	}

	folder, err := fss.findNode(ctx, req.FolderID)
	if err != nil {
		return nil, err
	}

	if folder.Type != NodeTypeFolder {
		return nil, ErrNotFolder
	}

	if err := fss.checkPermission(ctx, "node", req.FolderID, "view", "user", req.UserID); err != nil {
		return nil, err
	}

	return fss.lookupNodes(ctx, "parent", "node", req.FolderID)
}

func (fss *FSS) ListNodeShares(ctx context.Context, req *ListNodeSharesRequest) ([]*User, error) {
	if err := req.Validate(); err != nil {
		return nil, err
	}

	if err := fss.checkPermission(ctx, "node", req.NodeID, "list-shares", "user", req.UserID); err != nil {
		return nil, err
	}

	users, err := fss.lookupUsers(ctx, "sharee", "node", req.NodeID)
	if err != nil {
		return nil, err
	}

	return users, nil
}

func (fss *FSS) UpdateNode(ctx context.Context, req *UpdateNodeRequest) (*Node, error) {
	if err := req.Validate(); err != nil {
		return nil, err
	}

	if err := fss.checkPermission(ctx, "node", req.NodeID, "update", "user", req.UserID); err != nil {
		return nil, err
	}

	filter := bson.M{"_id": uuidToMongoID(req.NodeID)}
	now := time.Now()
	update := bson.M{
		"$set": bson.M{
			"title":      req.Title,
			"data":       req.Data,
			"updated_at": now,
		},
	}
	var mNode mongoNode
	if err := fss.mongo.FindOneAndUpdate(ctx, filter, update).Decode(&mNode); err != nil {
		return nil, err
	}

	mNode.Title = req.Title
	mNode.Data = req.Data
	mNode.UpdatedAt = now
	node := mustNodeFromMongo(&mNode)

	return node, nil
}

func (fss *FSS) DeleteNode(ctx context.Context, req *DeleteNodeRequest) (*Node, error) {
	if err := req.Validate(); err != nil {
		return nil, err
	}

	if err := fss.checkPermission(ctx, "node", req.NodeID, "delete", "user", req.UserID); err != nil {
		return nil, err
	}

	// TODO: start background job to recusiverly do the following:
	// If node is a file

	filter := bson.M{"_id": uuidToMongoID(req.NodeID)}
	var mNode mongoNode
	if err := fss.mongo.FindOneAndDelete(ctx, filter).Decode(&mNode); err != nil {
		return nil, err
	}

	update := bson.M{
		"$set": bson.M{
			"deleted":    true,
			"updated_at": time.Now(),
		},
	}
	if _, err := fss.mongo.UpdateOne(ctx, filter, update); err != nil {
		return nil, err
	}

	var mNode mongoNode
	if err := fss.mongo.FindOneAndUpdate(ctx, filter, update).Decode(&mNode); err != nil {
		return nil, err
	}

	filter := bson.M{"_id": uuidToMongoID(docID)}
	var mDoc mongoDocument
	if err := mongoCol.FindOneAndDelete(r.Context(), filter).Decode(&mDoc); err != nil {
		logger.Error("finding and deleting a mongo document", slog.Any("error", err))
		encodeUnexpectedError(w)
		if err := createRelationship(spiceDB, r.Context(), docID, "owner", usrID); err != nil {
			logger.Error("rolling back relationship deletion from spicedb", slog.Any("error", err))
		}
		return
	}

	doc := mustMongoToDocument(&mDoc)
	return nil, nil
}

func (fss *FSS) ShareNode(ctx context.Context, req *ShareNodeRequest) (*NodeShare, error) {
	if err := req.Validate(); err != nil {
		return nil, err
	}

	if err := fss.checkPermission(ctx, "node", req.NodeID, "share", "user", req.UserID); err != nil {
		return nil, err
	}

	_, err := fss.spiceDB.WriteRelationships(ctx, &v1.WriteRelationshipsRequest{
		Updates: []*v1.RelationshipUpdate{{
			Operation: v1.RelationshipUpdate_OPERATION_CREATE,
			Relationship: &v1.Relationship{
				Resource: &v1.ObjectReference{
					ObjectType: "node",
					ObjectId:   req.NodeID.String(),
				},
				Relation: req.AccessRole,
				Subject: &v1.SubjectReference{Object: &v1.ObjectReference{
					ObjectType: "user",
					ObjectId:   req.ShareeID.String(),
				}},
			},
		}},
	})
	if err != nil {
		// TODO: handle conflicting error
		return nil, err
	}

	return nil, nil
}

func (fss *FSS) UpdateNodeShare(ctx context.Context, req *UpdateNodeShareRequest) ([]*NodeShare, error) {
	if err := req.Validate(); err != nil {
		return nil, err
	}

	if err := fss.checkPermission(ctx, "node", req.NodeID, "update-share", "user", req.UserID); err != nil {
		return nil, err
	}

	// TODO: parallelize the following calls
	viewers, err := fss.lookupUsers(ctx, "viewer", "node", req.NodeID)
	if err != nil {
		return nil, err
	}
	editors, err := fss.lookupUsers(ctx, "viewer", "node", req.NodeID)
	if err != nil {
		return nil, err
	}
	shares := make([]*NodeShare, 0, len(viewers)+len(editors))
	for _, usr := range viewers {
		shares = append(shares, &NodeShare{
			NodeID:     req.NodeID,
			AccessRole: AccessRoleViewer,
			ShareeID:   usr.ID,
		})
	}
	for _, usr := range editors {
		shares = append(shares, &NodeShare{
			NodeID:     req.NodeID,
			AccessRole: AccessRoleEditor,
			ShareeID:   usr.ID,
		})
	}

	// TODO: sort shares?

	return shares, nil
}

func (fss *FSS) UnshareNode(ctx context.Context, req *UnshareNodeRequest) (*NodeShare, error) {
	return nil, nil
}

func (fss *FSS) MoveNode(ctx context.Context, req *MoveNodeRequest) error {
	return nil
}

func (fss *FSS) checkPermission(
	ctx context.Context,
	rscType string,
	rscID uuid.UUID,
	perm string,
	sbjType string,
	sbjID uuid.UUID,
) error {
	resp, err := fss.spiceDB.CheckPermission(ctx, &v1.CheckPermissionRequest{
		Resource: &v1.ObjectReference{
			ObjectType: rscType,
			ObjectId:   rscID.String(),
		},
		Permission: perm,
		Subject: &v1.SubjectReference{Object: &v1.ObjectReference{
			ObjectType: sbjType,
			ObjectId:   sbjID.String(),
		}},
	})
	if err != nil {
		return err
	}
	if resp.Permissionship != v1.CheckPermissionResponse_PERMISSIONSHIP_HAS_PERMISSION {
		return ErrForbiddenAccess
	}

	return nil
}

func (fss *FSS) lookupNodes(ctx context.Context, perm, sbjType string, sbjID uuid.UUID) ([]*Node, error) {
	stream, err := fss.spiceDB.LookupResources(ctx, &v1.LookupResourcesRequest{
		ResourceObjectType: "node",
		Permission:         perm,
		Subject: &v1.SubjectReference{Object: &v1.ObjectReference{
			ObjectType: sbjType,
			ObjectId:   sbjID.String(),
		}},
	})
	if err != nil {
		return nil, err
	}
	docIDs := []primitive.Binary{}
	for {
		resp, err := stream.Recv()
		if err == io.EOF {
			break
		}
		id := uuid.MustParse(resp.ResourceObjectId)
		docIDs = append(docIDs, uuidToMongoID(id))
	}

	filter := bson.M{"_id": bson.M{"$in": docIDs}}
	cursor, err := fss.mongo.Find(ctx, filter)
	if err != nil {
		return nil, err
	}
	var mNodes []mongoNode
	if err := cursor.All(ctx, &mNodes); err != nil {
		return nil, err
	}

	nodes := make([]*Node, 0, len(mNodes))
	for _, mNode := range mNodes {
		nodes = append(nodes, mustNodeFromMongo(&mNode))
	}

	return nodes, nil
}

func (fss *FSS) lookupUsers(ctx context.Context, perm, rscType string, rscID uuid.UUID) ([]*User, error) {
	stream, err := fss.spiceDB.LookupSubjects(ctx, &v1.LookupSubjectsRequest{
		Resource: &v1.ObjectReference{
			ObjectType: rscType,
			ObjectId:   rscID.String(),
		},
		Permission:        perm,
		SubjectObjectType: "user",
	})
	if err != nil {
		return nil, err
	}

	var users []*User
	for {
		resp, err := stream.Recv()
		if err == io.EOF {
			break
		}
		users = append(users, &User{
			ID: uuid.MustParse(resp.Subject.SubjectObjectId),
			// TODO: set Username
		})
	}

	return users, nil
}

func (fss *FSS) findNode(ctx context.Context, nodID uuid.UUID) (*Node, error) {
	filter := bson.M{"_id": uuidToMongoID(nodID)}
	var mNode mongoNode
	if err := fss.mongo.FindOne(ctx, filter).Decode(&mNode); err != nil {
		if errors.Is(err, mongo.ErrNoDocuments) {
			return nil, ErrNotFound
		}
		return nil, err
	}
	node := mustNodeFromMongo(&mNode)

	return node, nil
}

type mongoNode struct {
	ID        primitive.Binary `bson:"_id"`
	Type      string           `bson:"type"`
	Title     string           `bson:"title"`
	Data      []byte           `bson:"data"`
	CreatedAt time.Time        `bson:"created_at"`
	UpdatedAt time.Time        `bson:"updated_at"`
}

func nodeToMongo(node *Node) *mongoNode {
	return &mongoNode{
		ID:        uuidToMongoID(node.ID),
		Title:     node.Title,
		Data:      node.Data,
		CreatedAt: node.CreatedAt,
		UpdatedAt: node.UpdatedAt,
	}
}

func mustNodeFromMongo(mNode *mongoNode) *Node {
	return &Node{
		ID:        mustUUIDFromMongoID(mNode.ID),
		Type:      mNode.Type,
		Title:     mNode.Title,
		Data:      mNode.Data,
		CreatedAt: mNode.CreatedAt,
		UpdatedAt: mNode.UpdatedAt,
	}
}

func uuidToMongoID(id uuid.UUID) primitive.Binary {
	return primitive.Binary{
		Subtype: 0x04,
		Data:    id[:],
	}
}

func mustUUIDFromMongoID(mID primitive.Binary) uuid.UUID {
	id, err := uuid.FromBytes(mID.Data)
	if err != nil {
		panic("mongo id is not a valid uuid")
	}
	return id
}
