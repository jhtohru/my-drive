#!/usr/bin/env bash

docker run --rm \
  --name bootstrap-mongodb \
  --net my-docs_default \
  -v $(pwd)/data/mongo:/workspace \
  mongo:8.0.0 \
  mongodump \
    --username root \
    --password password \
    --authenticationDatabase admin \
    --host docs-mongodb:27017 \
    --db my_docs \
    --collection document \
    --out /workspace
