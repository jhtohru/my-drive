#!/usr/bin/env bash

mkdir -p ./data/spicedb

docker run \
  -u "$(id -u):$(id -g)" \
  -v $(pwd)/data/spicedb:/workspace \
  -w /workspace \
  -e ZED_ENDPOINT="spicedb:50051" \
  -e ZED_TOKEN="preshared-key" \
  -e ZED_INSECURE="true" \
  --net my-drive_default \
  --rm \
  authzed/zed:v1.1.1 \
  backup create backup.bin
