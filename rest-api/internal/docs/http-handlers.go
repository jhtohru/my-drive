package docs

import (
	"context"
	"encoding/json"
	"fmt"
	"io"
	"log/slog"
	"net/http"
	"strings"
	"time"

	"github.com/Nerzal/gocloak/v14"
	v1 "github.com/authzed/authzed-go/proto/authzed/api/v1"
	"github.com/authzed/authzed-go/v1"
	"github.com/google/uuid"
	"go.mongodb.org/mongo-driver/bson/primitive"
	"go.mongodb.org/mongo-driver/v2/bson"
	"go.mongodb.org/mongo-driver/v2/mongo"
)

type Document struct {
	ID        uuid.UUID `json:"id"`
	Title     string    `json:"title"`
	Contents  string    `json:"contents"`
	CreatedAt time.Time `json:"created_at"`
	UpdatedAt time.Time `json:"updated_at"`
}

func authnMiddleware(
	keycloak *gocloak.GoCloak,
) func(http.Handler) http.Handler {
	return func(next http.Handler) http.Handler {
		return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
			header := r.Header.Get("Authorization")
			if !strings.HasPrefix(header, "Bearer ") {
				encodeError(w, "missing Authorization header", http.StatusUnauthorized)
				return
			}
			accessToken := strings.TrimSuffix(header, "Bearer ")
			token, claims, err := keycloak.DecodeAccessToken(r.Context(), accessToken, "master")
			if err != nil {
				encodeError(w, "invalid access token", http.StatusUnauthorized)
				return
			}
			if !token.Valid {
				encodeError(w, "token is invalid or expired", http.StatusUnauthorized)
				return
			}
			sub, err := claims.GetSubject()
			if err != nil {
				panic("missing access token subject")
			}
			usrID := uuid.MustParse(sub)
			ctx := contextWithUserID(r.Context(), usrID)
			r = r.Clone(ctx)
			next.ServeHTTP(w, r)
		})
	}
}

type request struct {
	Title    string `json:"title"`
	Contents string `json:"contents"`
}

func (req request) Validate() string {
	if req.Title == "" {
		return "missing document title"
	}
	return ""
}

func createDocumentHandler(
	logger *slog.Logger,
	spiceDB *authzed.Client,
	mongoCol *mongo.Collection,
) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		req, err := decode[request](r)
		if err != nil {
			encodeMalformedRequestBodyError(w)
			return
		}
		if problem := req.Validate(); problem != "" {
			encodeInvalidRequestError(w, problem)
			return
		}

		docID := uuid.New()
		usrID := mustUserIDFromContext(r.Context())
		now := time.Now()
		doc := &Document{
			ID:        docID,
			Title:     req.Title,
			Contents:  req.Contents,
			CreatedAt: now,
			UpdatedAt: now,
		}

		if err := createRelationship(spiceDB, r.Context(), docID, "owner", usrID); err != nil {
			logger.Error("creating permission in spicedb", slog.Any("error", err))
			encodeUnexpectedError(w)
			return
		}
		if _, err := mongoCol.InsertOne(r.Context(), documentToMongo(doc)); err != nil {
			logger.Error("inserting a document into mongo", slog.Any("error", err))
			encodeUnexpectedError(w)
			if err := deleteRelationship(spiceDB, r.Context(), docID, "owner", usrID); err != nil {
				logger.Error("rolling back permission creation in spicedb", slog.Any("error", err))
			}
			return
		}

		if err := encode(w, doc, http.StatusCreated); err != nil {
			logger.Error("encoding document to json", slog.Any("error", err))
		}
	})
}

func getDocumentHandler(
	logger *slog.Logger,
	spiceDB *authzed.Client,
	mongoCol *mongo.Collection,
) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		docID, err := uuid.Parse(r.PathValue("doc_id"))
		if err != nil {
			encodeMalformedDocIDError(w)
			return
		}

		usrID := mustUserIDFromContext(r.Context())
		ok, err := checkPermission(spiceDB, r.Context(), docID, "read", usrID)
		if err != nil {
			logger.Error("checking permission", slog.Any("error", err))
			encodeUnexpectedError(w)
			return
		}
		if !ok {
			encodeDocumentNotFoundError(w)
			return
		}

		filter := bson.M{"_id": uuidToMongoID(docID)}
		var mDoc mongoDocument
		err = mongoCol.FindOne(r.Context(), filter).Decode(&mDoc)
		if err != nil {
			logger.Error("finding a document in mongo", slog.Any("error", err))
			encodeUnexpectedError(w)
			return
		}

		doc := mustMongoToDocument(&mDoc)
		if err := encode(w, doc, http.StatusOK); err != nil {
			logger.Error("encoding document to json", slog.Any("error", err))
		}
	})
}

func listDocumentHandler(
	logger *slog.Logger,
	spiceDB *authzed.Client,
	mongoCol *mongo.Collection,
) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		usrID := mustUserIDFromContext(r.Context())
		stream, err := spiceDB.LookupResources(r.Context(), &v1.LookupResourcesRequest{
			ResourceObjectType: "document",
			Permission:         "read",
			Subject: &v1.SubjectReference{Object: &v1.ObjectReference{
				ObjectType: "user",
				ObjectId:   usrID.String(),
			}},
		})
		if err != nil {
			logger.Error("failed to lookup user's documents on spicedb", slog.Any("error", err))
			encodeUnexpectedError(w)
			return
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
		cursor, err := mongoCol.Find(r.Context(), filter)
		if err != nil {
			logger.Error("failed to find documents on mongo", slog.Any("error", err))
			encodeUnexpectedError(w)
			return
		}
		var mDocs []mongoDocument
		if err := cursor.All(r.Context(), &mDocs); err != nil {
			logger.Error("failed to read documents from mongo", slog.Any("error", err))
			encodeUnexpectedError(w)
			return
		}

		docs := make([]Document, 0, len(mDocs))
		for _, mDoc := range mDocs {
			docs = append(docs, *mustMongoToDocument(&mDoc))
		}
		if err := encode(w, docs, http.StatusOK); err != nil {
			logger.Error("encoding document to json", slog.Any("error", err))
		}
	})
}

func updateDocumentHandler(
	logger *slog.Logger,
	spiceDB *authzed.Client,
	mongoCol *mongo.Collection,
) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		docID, err := uuid.Parse(r.PathValue("doc_id"))
		if err != nil {
			encodeMalformedDocIDError(w)
			return
		}
		req, err := decode[request](r)
		if err != nil {
			encodeMalformedRequestBodyError(w)
			return
		}
		if problem := req.Validate(); problem != "" {
			encodeInvalidRequestError(w, problem)
			return
		}
		usrID := mustUserIDFromContext(r.Context())

		ok, err := checkPermission(spiceDB, r.Context(), docID, "write", usrID)
		if err != nil {
			logger.Error("checking permission", slog.Any("error", err))
			encodeUnexpectedError(w)
			return
		}
		if !ok {
			encodeDocumentNotFoundError(w)
			return
		}

		filter := bson.M{"_id": uuidToMongoID(docID)}
		now := time.Now()
		update := bson.M{
			"$set": bson.M{
				"title":      req.Title,
				"contents":   req.Contents,
				"updated_at": now,
			},
		}
		var mDoc mongoDocument
		if err := mongoCol.FindOneAndUpdate(r.Context(), filter, update).Decode(&mDoc); err != nil {
			logger.Error("finding and updating a document in mongo", slog.Any("error", err))
			encodeUnexpectedError(w)
			return
		}

		mDoc.Title = req.Title
		mDoc.Contents = req.Contents
		mDoc.UpdatedAt = now
		doc := mustMongoToDocument(&mDoc)
		if err := encode(w, doc, http.StatusOK); err != nil {
			logger.Error("encoding document to json", slog.Any("error", err))
		}
	})
}

func deleteDocumentHandler(
	logger *slog.Logger,
	spiceDB *authzed.Client,
	mongoCol *mongo.Collection,
) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		docID, err := uuid.Parse(r.PathValue("doc_id"))
		if err != nil {
			encodeMalformedDocIDError(w)
			return
		}
		usrID := mustUserIDFromContext(r.Context())

		ok, err := checkPermission(spiceDB, r.Context(), docID, "delete", usrID)
		if err != nil {
			logger.Error("checking permission", slog.Any("error", err))
			encodeUnexpectedError(w)
			return
		}
		if !ok {
			encodeDocumentNotFoundError(w)
			return
		}

		if err := deleteRelationship(spiceDB, r.Context(), docID, "owner", usrID); err != nil {
			logger.Error("deleting relationship from spicedb", slog.Any("error", err))
			encodeUnexpectedError(w)
			return
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
		if err := encode(w, doc, http.StatusOK); err != nil {
			logger.Error("encoding document to json", slog.Any("error", err))
		}
	})
}

func createRelationship(
	spiceDB *authzed.Client,
	ctx context.Context,
	docID uuid.UUID,
	relation string,
	usrID uuid.UUID,
) error {
	_, err := spiceDB.WriteRelationships(ctx, &v1.WriteRelationshipsRequest{
		Updates: []*v1.RelationshipUpdate{{
			Operation: v1.RelationshipUpdate_OPERATION_CREATE,
			Relationship: &v1.Relationship{
				Resource: &v1.ObjectReference{
					ObjectType: "document",
					ObjectId:   docID.String(),
				},
				Relation: relation,
				Subject: &v1.SubjectReference{Object: &v1.ObjectReference{
					ObjectType: "user",
					ObjectId:   usrID.String(),
				}},
			},
		}},
	})
	return err
}

func deleteRelationship(
	spiceDB *authzed.Client,
	ctx context.Context,
	docID uuid.UUID,
	relation string,
	usrID uuid.UUID,
) error {
	_, err := spiceDB.WriteRelationships(ctx, &v1.WriteRelationshipsRequest{
		Updates: []*v1.RelationshipUpdate{{
			Operation: v1.RelationshipUpdate_OPERATION_DELETE,
			Relationship: &v1.Relationship{
				Resource: &v1.ObjectReference{
					ObjectType: "document",
					ObjectId:   docID.String(),
				},
				Relation: relation,
				Subject: &v1.SubjectReference{Object: &v1.ObjectReference{
					ObjectType: "user",
					ObjectId:   usrID.String(),
				}},
			},
		}},
	})
	return err
}

func checkPermission(
	spiceDB *authzed.Client,
	ctx context.Context,
	docID uuid.UUID,
	perm string,
	usrID uuid.UUID,
) (bool, error) {
	resp, err := spiceDB.CheckPermission(ctx, &v1.CheckPermissionRequest{
		Resource: &v1.ObjectReference{
			ObjectType: "document",
			ObjectId:   docID.String(),
		},
		Permission: perm,
		Subject: &v1.SubjectReference{Object: &v1.ObjectReference{
			ObjectType: "user",
			ObjectId:   usrID.String(),
		}},
	})
	if err != nil {
		return false, err
	}
	ok := resp.Permissionship == v1.CheckPermissionResponse_PERMISSIONSHIP_HAS_PERMISSION
	return ok, nil
}

type mongoDocument struct {
	ID        primitive.Binary `bson:"_id"`
	Title     string           `bson:"title"`
	Contents  string           `bson:"contents"`
	CreatedAt time.Time        `bson:"created_at"`
	UpdatedAt time.Time        `bson:"updated_at"`
}

func documentToMongo(doc *Document) *mongoDocument {
	return &mongoDocument{
		ID:        uuidToMongoID(doc.ID),
		Title:     doc.Title,
		Contents:  doc.Contents,
		CreatedAt: doc.CreatedAt,
		UpdatedAt: doc.UpdatedAt,
	}
}

func mustMongoToDocument(mDoc *mongoDocument) *Document {
	return &Document{
		ID:        mustUUIDFromMongoID(mDoc.ID),
		Title:     mDoc.Title,
		Contents:  mDoc.Contents,
		CreatedAt: mDoc.CreatedAt,
		UpdatedAt: mDoc.UpdatedAt,
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

// TODO: check the following pattern
type reqContextKey string

func contextWithUserID(ctx context.Context, usrID uuid.UUID) context.Context {
	return context.WithValue(ctx, reqContextKey("user_id"), usrID)
}

// TODO: check if returning a string is a better approach (if result is most often used as string).
func mustUserIDFromContext(ctx context.Context) uuid.UUID {
	raw := ctx.Value(reqContextKey("user_id"))
	usrID, ok := raw.(uuid.UUID)
	if !ok {
		panic("context missing user_id")
	}
	return usrID
}

// decode decodes a T from r.
func decode[T any](r *http.Request) (T, error) {
	var v T
	if err := json.NewDecoder(r.Body).Decode(&v); err != nil {
		return v, fmt.Errorf("decoding json: %w", err)
	}
	return v, nil
}

// encode setup w, write statusCode as its status code, and write v into its body.
func encode[T any](w http.ResponseWriter, v T, statusCode int) error {
	w.Header().Set("Content-Type", "application/json; charset=utf-8")
	w.WriteHeader(statusCode)
	if err := json.NewEncoder(w).Encode(v); err != nil {
		return fmt.Errorf("encoding json: %w", err)
	}
	return nil
}

func encodeError(w http.ResponseWriter, msg string, statusCode int) error {
	payload := struct {
		Error string `json:"error"`
	}{Error: msg}
	return encode(w, payload, statusCode)
}

func encodeUnexpectedError(w http.ResponseWriter) error {
	return encodeError(w, "unexpected error", http.StatusInternalServerError)
}

func encodeMalformedRequestBodyError(w http.ResponseWriter) error {
	return encodeError(w, "malformed request body", http.StatusBadRequest)
}

func encodeDocumentNotFoundError(w http.ResponseWriter) error {
	return encodeError(w, "document not found", http.StatusNotFound)
}

func encodeMalformedDocIDError(w http.ResponseWriter) error {
	return encodeError(w, "malformed doc_id path parameter", http.StatusBadRequest)
}

func encodeInvalidRequestError(w http.ResponseWriter, problem string) error {
	return encodeError(w, "invalid request: "+problem, http.StatusUnprocessableEntity)
}
