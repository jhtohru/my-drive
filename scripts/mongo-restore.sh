#!/usr/bin/env bash

docker run --rm \
  --name bootstrap-mongodb \
  --net my-docs_default \
  -v $(pwd)/data/mongo:/workspace \
  mongo:8.0.0 \
  mongorestore \
    --username root \
    --password password \
    --authenticationDatabase admin \
    --host docs-mongodb:27017 \
    /workspace
