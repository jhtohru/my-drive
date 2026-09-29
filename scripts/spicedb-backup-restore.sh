#!/usr/bin/env bash

docker run --rm \
	--name spicedb-export \
	--net my-drive_default \
	-v $(pwd)/data/spicedb:/workspace \
	-e ZED_ENDPOINT="spicedb:50051" \
    -e ZED_TOKEN="preshared-key" \
	-e ZED_INSECURE="true" \
	authzed/zed:v1.1.1-debug \
	backup restore /workspace/backup.bin
