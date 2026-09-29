#!/usr/bin/env bash

docker run \
  -u "$(id -u):$(id -g)" \
  -v $(pwd)/data:/workspace \
  -w /workspace \
  --net my-drive_default \
  --rm \
  mongo:8.0.0 \
  mongodump \
    --username root \
    --password password \
    --authenticationDatabase admin \
    --host mongo:27017 \
    --db my-drive \
    --collection document \
    --out ./mongo/
