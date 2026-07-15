#!/usr/bin/env bash

docker exec my-drive_mongo \
	mongorestore \
  --username=${MONGO_USERNAME} \
  --password=${MONGO_PASSWORD} \
	--authenticationDatabase=admin \
  --archive=/backup/mongo_backup.dump
