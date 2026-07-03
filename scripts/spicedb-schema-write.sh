#!/usr/bin/env bash

docker run --rm \
	--net my-drive_default \
	-v $(pwd)/schema.zed:/workspace/schema.zed \
	-e ZED_ENDPOINT="spicedb:50051" \
    -e ZED_TOKEN="preshared-key" \
	-e ZED_INSECURE="true" \
	authzed/zed:v1.1.1 \
	schema write /workspace/schema.zed
