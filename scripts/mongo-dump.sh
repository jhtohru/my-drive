#!/usr/bin/env bash

docker exec my-drive_mongo \
	mongodump \
  --username=${MONGO_USERNAME} \
  --password=${MONGO_PASSWORD} \
  --db=${MONGO_DATABASE} \
  --authenticationDatabase=admin \
  --archive=/backup/mongo_backup.dump
