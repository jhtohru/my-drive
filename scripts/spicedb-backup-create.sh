#!/usr/bin/env bash

mkdir -p ./data/spicedb
rm -f ./data/spicedb/spicedb_backup.bin

docker run \
  -u "$(id -u):$(id -g)" \
  -v $(pwd)/data/spicedb:/workspace \
  -e ZED_ENDPOINT="spicedb:50051" \
  -e ZED_TOKEN="${SPICEDB_PRESHARED_KEY}" \
  -e ZED_INSECURE="true" \
  --net my-drive_default \
  --rm \
  authzed/zed:v1.1.1 \
  backup create /workspace/spicedb_backup.bin
