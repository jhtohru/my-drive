package main

import (
	"context"
	"encoding/json"
	"fmt"
	"io"
	"log"
	"net/http"
	"strings"
	"time"

	"github.com/Nerzal/gocloak/v14"
	v1 "github.com/authzed/authzed-go/proto/authzed/api/v1"
	"github.com/authzed/authzed-go/v1"
	"github.com/authzed/grpcutil"
	"github.com/google/uuid"
	"go.mongodb.org/mongo-driver/bson/primitive"
	"go.mongodb.org/mongo-driver/v2/bson"
	"go.mongodb.org/mongo-driver/v2/mongo"
	"go.mongodb.org/mongo-driver/v2/mongo/options"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials/insecure"
)

func main() {
	uri := "mongodb://root:password@localhost:27017"
	clientOptions := options.Client().ApplyURI(uri)
	mongoClient, err := mongo.Connect(clientOptions)
	if err != nil {
		log.Fatalf("Failed to create MongoDB client: %v", err)
	}
	defer func() {
		ctx, cancel := context.WithTimeout(context.Background(), 10*time.Second)
		defer cancel()
		if err := mongoClient.Disconnect(ctx); err != nil {
			log.Fatalf("Failed to disconnect securely: %v", err)
		}
	}()
	coll := mongoClient.Database("my_database").Collection("my_collection")

	keycloak := gocloak.NewClient("http://localhost:8181")

	spiceDB, err := authzed.NewClient(
		"localhost:50051",
		grpc.WithTransportCredentials(insecure.NewCredentials()),
		grpcutil.WithInsecureBearerToken("preshared-key"),
	)
	if err != nil {
		log.Fatalf("Failed to connect to SpiceDB: %s", err)
	}

	mux := http.NewServeMux()
	mdw := authnMiddleware(keycloak)
	mux.Handle("POST /docs", mdw(createDocumentHandler(coll, spiceDB)))
	mux.Handle("GET /docs/{doc_id}", mdw(getDocumentHandler(coll, spiceDB)))
	mux.Handle("GET /docs", mdw(listDocumentHandler(coll, spiceDB)))
	mux.Handle("PUT /docs/{doc_id}", mdw(updateDocumentHandler(coll, spiceDB)))
	mux.Handle("DELETE /docs/{doc_id}", mdw(deleteDocumentHandler(coll, spiceDB)))
	httpServer := &http.Server{
		Addr:    ":8000",
		Handler: mux,
	}
	log.Printf("listening on %s\n", httpServer.Addr)
	if err := httpServer.ListenAndServe(); err != nil && err != http.ErrServerClosed {
		log.Printf("Error listening and serving: %v\n", err)
	}
}

func authnMiddleware(
	keycloak *gocloak.GoCloak,
) func(http.Handler) http.Handler {
	return func(next http.Handler) http.Handler {
		return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
			header := r.Header.Get("Authorization")
			if !strings.HasPrefix(header, "Bearer ") {
				http.Error(w, "missing Authorization header", http.StatusUnauthorized)
				return
			}
			accessToken := strings.TrimSuffix(header, "Bearer ")
			token, claims, err := keycloak.DecodeAccessToken(r.Context(), accessToken, "master")
			if err != nil {
				http.Error(w, "invalid access token", http.StatusUnauthorized)
				return
			}
			if !token.Valid {
				http.Error(w, "token is invalid or expired", http.StatusUnauthorized)
				return
			}
			sub, err := claims.GetSubject()
			if err != nil {
				// TODO: handle err
			}
			// TODO: ensure sub is always a valid uuid.UUID
			usrID := uuid.MustParse(sub)
			ctx := contextWithUserID(r.Context(), usrID)
			r = r.Clone(ctx)
			next.ServeHTTP(w, r)
		})
	}
}

type document struct {
	ID        primitive.Binary `bson:"_id"`
	Title     string           `bson:"title"`
	Contents  string           `bson:"contents"`
	CreatedAt time.Time        `bson:"created_at"`
	UpdatedAt time.Time        `bson:"updated_at"`
}

func createDocumentHandler(
	coll *mongo.Collection,
	spiceDB *authzed.Client,
) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		var req struct {
			Title    string `json:"title"`
			Contents string `jsin:"contents"`
		}
		if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
			http.Error(w, "malformed request body", http.StatusBadRequest)
			return
		}
		if req.Title == "" {
			http.Error(w, "missing document title", http.StatusUnprocessableEntity)
			return
		}

		// TODO: check if transactions are needed here

		docID := uuid.New()
		usrID := userIDFromContext(r.Context())
		_, err := spiceDB.WriteRelationships(r.Context(), &v1.WriteRelationshipsRequest{
			Updates: []*v1.RelationshipUpdate{{
				Operation: v1.RelationshipUpdate_OPERATION_CREATE,
				Relationship: &v1.Relationship{
					Resource: &v1.ObjectReference{
						ObjectType: "document",
						ObjectId:   docID.String(),
					},
					Relation: "owner",
					Subject: &v1.SubjectReference{Object: &v1.ObjectReference{
						ObjectType: "user",
						ObjectId:   usrID.String(),
					}},
				},
			}},
		})
		if err != nil {
			// TODO: log err
			http.Error(w, "unexpected error", http.StatusInternalServerError)
			return
		}

		now := time.Now()
		doc := document{
			ID: primitive.Binary{
				Subtype: 0x04,
				Data:    docID[:],
			},
			Title:     req.Title,
			Contents:  req.Contents,
			CreatedAt: now,
			UpdatedAt: now,
		}
		_, err = coll.InsertOne(r.Context(), doc)
		if err != nil {
			// TODO: log err
			http.Error(w, "unexpected error", http.StatusInternalServerError)
			return
		}

		payload := struct {
			ID uuid.UUID `json:"id"`
		}{ID: docID}
		w.WriteHeader(http.StatusCreated)
		w.Header().Set("Content-Type", "application/json")
		if err := json.NewEncoder(w).Encode(payload); err != nil {
			// TODO: log err
			// TODO: handle err
		}
	})
}

func getDocumentHandler(
	coll *mongo.Collection,
	spiceDB *authzed.Client,
) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		docID, err := uuid.Parse(r.PathValue("doc_id"))
		if err != nil {
			http.Error(w, "malformed doc_id path parameter", http.StatusBadRequest)
			return
		}

		binID := primitive.Binary{
			Subtype: 0x04,
			Data:    docID[:],
		}
		filter := bson.M{"_id": binID}
		opts := options.FindOne().SetProjection(bson.M{"_id": 1})
		var result bson.M
		err = coll.FindOne(r.Context(), filter, opts).Decode(&result)
		if err != nil {
			if err == mongo.ErrNoDocuments {
				http.Error(w, "forbidden read", http.StatusForbidden)
				return
			}
			// TODO: log err
			http.Error(w, "unexpected error", http.StatusInternalServerError)
			return
		}

		usrID := userIDFromContext(r.Context())
		resp, err := spiceDB.CheckPermission(r.Context(), &v1.CheckPermissionRequest{
			Resource: &v1.ObjectReference{
				ObjectType: "document",
				ObjectId:   docID.String(),
			},
			Permission: "read",
			Subject: &v1.SubjectReference{Object: &v1.ObjectReference{
				ObjectType: "user",
				ObjectId:   usrID.String(),
			}},
		})
		if err != nil {
			// TODO: log err
			http.Error(w, "unexpected error", http.StatusInternalServerError)
			return
		}
		if resp.Permissionship != v1.CheckPermissionResponse_PERMISSIONSHIP_HAS_PERMISSION {
			http.Error(w, "document not found", http.StatusNotFound)
			return
		}

		var doc document
		err = coll.FindOne(r.Context(), filter).Decode(&doc)
		if err != nil {
			// TODO: log err
			http.Error(w, "unexpected error", http.StatusInternalServerError)
			return
		}

		payload := struct {
			ID        uuid.UUID `json:"id"`
			Title     string    `json:"title"`
			Contents  string    `json:"contents"`
			CreatedAt time.Time `json:"created_at"`
			UpdatedAt time.Time `json:"updated_at"`
		}{
			ID:        docID,
			Title:     doc.Title,
			Contents:  doc.Contents,
			CreatedAt: doc.CreatedAt,
			UpdatedAt: doc.UpdatedAt,
		}
		w.Header().Set("Content-Type", "application/json")
		if err := json.NewEncoder(w).Encode(payload); err != nil {
			// TODO: log err
			// TODO: handle err
		}
	})
}

func listDocumentHandler(
	coll *mongo.Collection,
	spiceDB *authzed.Client,
) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		usrID := userIDFromContext(r.Context())
		stream, err := spiceDB.LookupResources(r.Context(), &v1.LookupResourcesRequest{
			ResourceObjectType: "document",
			Permission:         "read",
			Subject: &v1.SubjectReference{Object: &v1.ObjectReference{
				ObjectType: "user",
				ObjectId:   usrID.String(),
			}},
		})
		if err != nil {
			// TODO: log err
			fmt.Printf("unexpected error: SpiceDB.LookupResources: %s\n", err) // TODO: remove this line
			http.Error(w, "unexpected error", http.StatusInternalServerError)
			return
		}
		var docIDs []primitive.Binary
		for {
			resp, err := stream.Recv()
			if err == io.EOF {
				break
			}
			id := uuid.MustParse(resp.ResourceObjectId)
			docIDs = append(docIDs, primitive.Binary{
				Subtype: 0x04,
				Data:    id[:],
			})
		}

		filter := bson.M{"_id": bson.M{"$in": docIDs}}
		opts := options.Find().SetProjection(bson.M{
			"_id":        1,
			"title":      1,
			"created_at": 1,
			"updated_at": 1,
		})
		cursor, err := coll.Find(r.Context(), filter, opts)
		if err != nil {
			// TODO: log err
			fmt.Printf("unexpected error: MongoDB.Find: %s\n", err) // TODO: remove this line
			http.Error(w, "unexpected error", http.StatusInternalServerError)
			return
		}
		type model struct {
			ID        primitive.Binary `bson:"_id"`
			Title     string           `bson:"title"`
			CreatedAt time.Time        `bson:"created_at"`
			UpdatedAt time.Time        `bson:"updated_at"`
		}
		var models []model
		if err := cursor.All(r.Context(), &models); err != nil {
			// TODO: log err
			fmt.Printf("unexpected error: MongoDBCursor.All: %s\n", err) // TODO: remove this line
			http.Error(w, "unexpected error", http.StatusInternalServerError)
			return
		}

		type out struct {
			ID        uuid.UUID `json:"id"`
			Title     string    `json:"title"`
			CreatedAt time.Time `json:"created_at"`
			UpdatedAt time.Time `json:"updated_at"`
		}
		docs := make([]out, 0, len(models))
		for _, m := range models {
			docs = append(docs, out{
				ID:        uuid.UUID(m.ID.Data),
				Title:     m.Title,
				CreatedAt: m.CreatedAt,
				UpdatedAt: m.UpdatedAt,
			})
		}
		w.Header().Set("Content-Type", "application/json")
		if err := json.NewEncoder(w).Encode(docs); err != nil {
			// TODO: log err
			// TODO: handle err
		}
	})
}

func updateDocumentHandler(
	coll *mongo.Collection,
	spiceDB *authzed.Client,
) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		docID, err := uuid.Parse(r.PathValue("doc_id"))
		if err != nil {
			http.Error(w, "malformed doc_id path parameter", http.StatusBadRequest)
			return
		}

		var req struct {
			Title    string `json:"title"`
			Contents string `jsin:"contents"`
		}
		if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
			http.Error(w, "malformed request body", http.StatusBadRequest)
			return
		}
		if req.Title == "" {
			http.Error(w, "missing document title", http.StatusUnprocessableEntity)
			return
		}

		binID := primitive.Binary{
			Subtype: 0x04,
			Data:    docID[:],
		}
		filter := bson.M{"_id": binID}
		var doc document
		err = coll.FindOne(r.Context(), filter).Decode(&doc)
		if err != nil {
			if err == mongo.ErrNoDocuments {
				http.Error(w, "document not found", http.StatusNotFound)
				return
			}
			// TODO: log err
			http.Error(w, "unexpected error", http.StatusInternalServerError)
			return
		}

		usrID := userIDFromContext(r.Context())
		resp, err := spiceDB.CheckPermission(r.Context(), &v1.CheckPermissionRequest{
			Resource: &v1.ObjectReference{
				ObjectType: "document",
				ObjectId:   docID.String(),
			},
			Permission: "write",
			Subject: &v1.SubjectReference{Object: &v1.ObjectReference{
				ObjectType: "user",
				ObjectId:   usrID.String(),
			}},
		})
		if err != nil {
			// TODO: log err
			http.Error(w, "unexpected error", http.StatusInternalServerError)
			return
		}
		if resp.Permissionship != v1.CheckPermissionResponse_PERMISSIONSHIP_HAS_PERMISSION {
			http.Error(w, "forbidden updation", http.StatusNotFound)
			return
		}

		doc.Title = req.Title
		doc.Contents = req.Contents
		doc.UpdatedAt = time.Now()

		update := bson.M{
			"$set": bson.M{
				"title":      req.Title,
				"contents":   req.Contents,
				"updated_at": time.Now(),
			},
		}
		_, err = coll.UpdateOne(r.Context(), filter, update)
		if err != nil {
			// TODO: log err
			http.Error(w, "unexpected error", http.StatusInternalServerError)
			return
		}
	})
}

func deleteDocumentHandler(
	coll *mongo.Collection,
	spiceDB *authzed.Client,
) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		docID, err := uuid.Parse(r.PathValue("doc_id"))
		if err != nil {
			http.Error(w, "malformed doc_id path parameter", http.StatusBadRequest)
			return
		}
		usrID := userIDFromContext(r.Context())

		binID := primitive.Binary{
			Subtype: 0x04,
			Data:    docID[:],
		}
		filter := bson.M{"_id": binID}
		opts := options.FindOne().SetProjection(bson.M{"_id": 1})
		var result bson.M
		err = coll.FindOne(r.Context(), filter, opts).Decode(&result)
		if err != nil {
			if err == mongo.ErrNoDocuments {
				http.Error(w, "document not found", http.StatusNotFound)
				return
			}
			// TODO: log err
			http.Error(w, "unexpected error", http.StatusInternalServerError)
			return
		}

		resp, err := spiceDB.CheckPermission(r.Context(), &v1.CheckPermissionRequest{
			Resource: &v1.ObjectReference{
				ObjectType: "document",
				ObjectId:   docID.String(),
			},
			Permission: "delete",
			Subject: &v1.SubjectReference{Object: &v1.ObjectReference{
				ObjectType: "user",
				ObjectId:   usrID.String(),
			}},
		})
		if err != nil {
			// TODO: log err
			http.Error(w, "unexpected error", http.StatusInternalServerError)
			return
		}
		if resp.Permissionship != v1.CheckPermissionResponse_PERMISSIONSHIP_HAS_PERMISSION {
			http.Error(w, "forbidden deletion", http.StatusForbidden)
			return
		}

		_, err = coll.DeleteOne(r.Context(), filter)
		if err != nil {
			// TODO: log err
			http.Error(w, "unexpected error", http.StatusInternalServerError)
			return
		}
	})
}

// TODO: check the following pattern
type reqContextKey string

func contextWithUserID(ctx context.Context, usrID uuid.UUID) context.Context {
	return context.WithValue(ctx, reqContextKey("user_id"), usrID)
}

// TODO: check if returning a string is a better approach (if result is most often used as string).
func userIDFromContext(ctx context.Context) uuid.UUID {
	raw := ctx.Value(reqContextKey("user_id"))
	usrID, ok := raw.(uuid.UUID)
	if !ok {
		panic("context missing user_id")
	}
	return usrID
}
