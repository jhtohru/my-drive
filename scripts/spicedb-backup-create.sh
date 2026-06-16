#!/usr/bin/env bash

rm -rf data/spicedb/backup.bin

docker run --rm \
	--name spicedb-export \
	--net my-docs_default \
	-v $(pwd)/data/spicedb:/workspace \
	-e ZED_ENDPOINT="spicedb:50051" \
    -e ZED_TOKEN="preshared-key" \
	-e ZED_INSECURE="true" \
	authzed/zed:v1.1.1-debug \
	backup create /workspace/backup.bin
