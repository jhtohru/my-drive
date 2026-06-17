package docs

import (
	"log/slog"
	"net/http"

	"github.com/Nerzal/gocloak/v14"
	"github.com/authzed/authzed-go/v1"
	"go.mongodb.org/mongo-driver/v2/mongo"
)

func NewServer(
	logger *slog.Logger,
	keycloak *gocloak.GoCloak,
	mongoCol *mongo.Collection,
	spiceDB *authzed.Client,
) http.Handler {
	mux := http.NewServeMux()

	mdw := authnMiddleware(keycloak)
	mux.Handle("POST /docs", mdw(createDocumentHandler(logger, spiceDB, mongoCol)))
	mux.Handle("GET /docs/{doc_id}", mdw(getDocumentHandler(logger, spiceDB, mongoCol)))
	mux.Handle("GET /docs", mdw(listDocumentHandler(logger, spiceDB, mongoCol)))
	mux.Handle("PUT /docs/{doc_id}", mdw(updateDocumentHandler(logger, spiceDB, mongoCol)))
	mux.Handle("DELETE /docs/{doc_id}", mdw(deleteDocumentHandler(logger, spiceDB, mongoCol)))

	return mux
}
