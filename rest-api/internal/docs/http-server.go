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

	mch := NewMiddlewareChain(
		authnMiddleware(keycloak),
		corsMiddleware,
	)
	mux.Handle("OPTIONS /docs", corsMiddleware(http.HandlerFunc(nopHandler)))
	mux.Handle("OPTIONS /docs/{doc_id}", corsMiddleware(http.HandlerFunc(nopHandler)))
	mux.Handle("POST /docs", mch.Then(createDocumentHandler(logger, spiceDB, mongoCol)))
	mux.Handle("GET /docs/{doc_id}", mch.Then(getDocumentHandler(logger, spiceDB, mongoCol)))
	mux.Handle("GET /docs", mch.Then(listDocumentHandler(logger, spiceDB, mongoCol)))
	mux.Handle("PUT /docs/{doc_id}", mch.Then(updateDocumentHandler(logger, spiceDB, mongoCol)))
	mux.Handle("DELETE /docs/{doc_id}", mch.Then(deleteDocumentHandler(logger, spiceDB, mongoCol)))

	return mux
}
