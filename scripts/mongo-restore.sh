#!/usr/bin/env bash

docker run \
  --rm \
  --name bootstrap-mongodb \
  --net my-drive_default \
  -v $(pwd)/data/mongo:/workspace \
  mongo:8.0.0 \
  mongorestore \
    --username root \
    --password password \
    --authenticationDatabase admin \
    --host mongo:27017 \
    /workspace
