.PHONY: local-dev
local-dev:
	docker compose down -v && \
	docker compose up -d --wait && \
	make load-data

.PHONY: load-data
load-data:
	./scripts/spicedb-backup-restore.sh
	./scripts/mongo-restore.sh
	./scripts/keycloak-import.sh

.PHONY: dump-data
dump-data:
	rm -rf ./data
	mkdir -p ./data
	./scripts/spicedb-backup-create.sh
	./scripts/mongo-dump.sh
	./scripts/keycloak-export.sh
