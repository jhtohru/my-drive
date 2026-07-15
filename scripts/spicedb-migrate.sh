#!/usr/bin/env bash

docker exec my-drive_spicedb \
  /usr/local/bin/spicedb datastore migrate head
