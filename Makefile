.PHONY: init-data
init-data:
	./scripts/spicedb-schema-write.sh
	./scripts/spicedb-backup-restore.sh
	./scripts/mongo-restore.sh
	./scripts/keycloak-import.sh
