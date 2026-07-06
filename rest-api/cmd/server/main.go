package main

import (
	"context"
	"fmt"
	"log"
	"log/slog"
	"net/http"
	"os"
	"os/signal"
	"sync"
	"time"

	"github.com/Nerzal/gocloak/v14"
	"github.com/authzed/authzed-go/v1"
	"github.com/authzed/grpcutil"
	"go.mongodb.org/mongo-driver/v2/mongo"
	"go.mongodb.org/mongo-driver/v2/mongo/options"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials/insecure"

	"github.com/jhtohru/my-drive/rest-api/internal/docs"
)

func main() {
	if err := run(context.Background()); err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}
}

func mustGetenv(key string) string {
	val, ok := os.LookupEnv(key)
	if !ok {
		panic(fmt.Sprintf("env var %s is not set", key))
	}
	return val
}

func run(ctx context.Context) error {
	mongoEp := mustGetenv("MONGO_ENDPOINT")
	mongoDB := mustGetenv("MONGO_DATABASE")
	mongoDocsCol := mustGetenv("MONGO_DOCUMENTS_COLUMN")
	keycloakEp := mustGetenv("KEYCLOAK_ENDPOINT")
	spiceDBEp := mustGetenv("SPICEDB_ENDPOINT")
	spiceDBPresharedKey := mustGetenv("SPICEDB_PRESHARED_KEY")
	serverAddr := mustGetenv("SERVER_ADDRESS")

	clientOptions := options.Client().ApplyURI(mongoEp)
	mongoClient, err := mongo.Connect(clientOptions)
	if err != nil {
		log.Fatalf("Failed to create MongoDB client: %v", err)
	}
	defer func() {
		ctx, cancel := context.WithTimeout(ctx, 10*time.Second)
		defer cancel()
		if err := mongoClient.Disconnect(ctx); err != nil {
			log.Fatalf("Failed to disconnect securely: %v", err)
		}
	}()
	mongoCol := mongoClient.Database(mongoDB).Collection(mongoDocsCol)

	keycloak := gocloak.NewClient(keycloakEp)

	spiceDB, err := authzed.NewClient(
		spiceDBEp,
		grpc.WithTransportCredentials(insecure.NewCredentials()),
		grpcutil.WithInsecureBearerToken(spiceDBPresharedKey),
	)
	if err != nil {
		log.Fatalf("Failed to connect to SpiceDB: %s", err)
	}

	logHandler := slog.NewTextHandler(os.Stdout, &slog.HandlerOptions{AddSource: true})
	logger := slog.New(logHandler)

	srv := docs.NewServer(logger, keycloak, mongoCol, spiceDB)
	httpServer := &http.Server{
		Addr:    serverAddr,
		Handler: srv,
	}
	go func() {
		log.Printf("listening on %s\n", httpServer.Addr)
		if err := httpServer.ListenAndServe(); err != nil && err != http.ErrServerClosed {
			log.Printf("Error listening and serving: %v\n", err)
		}
	}()
	ctx, cancel := signal.NotifyContext(ctx, os.Interrupt)
	defer cancel()
	var wg sync.WaitGroup
	wg.Add(1)
	go func() {
		defer wg.Done()
		<-ctx.Done()
		shutdownCtx := context.Background()
		shutdownCtx, cancel := context.WithTimeout(shutdownCtx, 10*time.Second)
		defer cancel()
		if err := httpServer.Shutdown(shutdownCtx); err != nil {
			log.Printf("Error shutting down the http server: %v\n", err)
		}
	}()
	wg.Wait()

	return nil
}
