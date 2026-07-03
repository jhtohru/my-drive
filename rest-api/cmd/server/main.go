package main

import (
	"context"
	"flag"
	"fmt"
	"log"
	"log/slog"
	"net"
	"net/http"
	"os"
	"os/signal"
	"strconv"
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

var (
	mongoEp             string
	mongoDB             string
	mongoDocsCol        string
	keycloakEp          string
	spiceDBEp           string
	spiceDBPresharedKey string
	serverHost          string
	serverPort          int
)

func run(ctx context.Context) error {
	flag.StringVar(&mongoEp, "mongo-endpoint", "mongodb://root:password@localhost:27017", "Mongo endpoint")
	flag.StringVar(&mongoDB, "mongo-db", "my-drive", "Mongo database name")
	flag.StringVar(&mongoDocsCol, "mongo-docs-col", "document", "documents Mongo colection name")
	flag.StringVar(&keycloakEp, "keycloak-endpoint", "http://localhost:8181", "Keycloak endpoint")
	flag.StringVar(&spiceDBEp, "spicedb-endpoint", "localhost:50051", "SpiceDB endpoint")
	flag.StringVar(&spiceDBPresharedKey, "spicedb-preshared-key", "preshared-key", "SpiceDB preshared key")
	flag.StringVar(&serverHost, "server-host", "", "Server host")
	flag.IntVar(&serverPort, "server-port", 8000, "Server port")
	flag.Parse()

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
		Addr:    net.JoinHostPort(serverHost, strconv.Itoa(serverPort)),
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
