package main

import (
	"context"
	"errors"
	"fmt"
	"log"
	"net"
	"os"
	"time"

	"buf.build/go/protovalidate"
	protovalidate_middleware "github.com/grpc-ecosystem/go-grpc-middleware/v2/interceptors/protovalidate"
	"go.mongodb.org/mongo-driver/v2/mongo"
	"go.mongodb.org/mongo-driver/v2/mongo/options"
	"golang.org/x/sync/errgroup"
	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"

	fsgrpc "github.com/jhtohru/my-drive/filesystem/gen/go/filesystem/v1"
	"github.com/jhtohru/my-drive/filesystem/internal/filesystem"
)

func main() {
	if err := run(context.Background()); err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}
}

func run(ctx context.Context) error {
	mongoEp := mustGetenv("MONGO_ENDPOINT")
	mongoDBName := mustGetenv("MONGO_DATABASE")
	usersColName := mustGetenv("MONGO_USERS_COLUMN")
	serverAddr := mustGetenv("GRPC_SERVER_ADDRESS")
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

	validator, err := protovalidate.New()
	if err != nil {
		return errors.New("failed to create protovalidate validator")
	}
	grpcServer := grpc.NewServer(
		grpc.UnaryInterceptor(protovalidate_middleware.UnaryServerInterceptor(validator)),
	)
	reflection.Register(grpcServer)
	svr := filesystem.NewGRPCServer(
		mongoClient,
		mongoDBName,
		usersColName,
	)
	fsgrpc.RegisterFileSystemServiceServer(grpcServer, svr)

	errorGroup, ctx := errgroup.WithContext(ctx)

	errorGroup.Go(func() error {
		config := net.ListenConfig{}
		lis, err := config.Listen(ctx, "tcp", serverAddr)
		if err != nil {
			return fmt.Errorf("failed to listen on address %q: %w", serverAddr, err)
		}
		log.Printf("listening on %s\n", lis.Addr())
		if err := grpcServer.Serve(lis); err != nil {
			return fmt.Errorf("failed to serve grpc service: %w", err)
		}

		return nil
	})

	errorGroup.Go(func() error {
		<-ctx.Done()
		grpcServer.GracefulStop()
		return ctx.Err()
	})

	return errorGroup.Wait()
}

func mustGetenv(key string) string {
	val, ok := os.LookupEnv(key)
	if !ok {
		panic(fmt.Sprintf("env var %s is not set", key))
	}
	return val
}
