package scratch

import (
	"context"
	"io"
	"log/slog"

	v1 "github.com/authzed/authzed-go/proto/authzed/api/v1"
	"github.com/authzed/authzed-go/v1"
	"github.com/google/uuid"
	"go.mongodb.org/mongo-driver/bson/primitive"
	"gorm.io/gorm/logger"
)

type Foo struct {
	spiceDB *authzed.Client
}

func (foo *Foo) destroy(ctx context.Context, nodeIDs []uuid.UUID) error {
	stream, err := foo.spiceDB.LookupResources(r.Context(), &v1.LookupResourcesRequest{
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
}
