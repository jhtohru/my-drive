mongorestore \
  --username=${MONGO_INITDB_ROOT_USERNAME} \
  --password=${MONGO_INITDB_ROOT_PASSWORD} \
	--authenticationDatabase=admin \
  --archive=/backup/mongo_backup.dump
