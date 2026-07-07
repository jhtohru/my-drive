ifneq ($(wildcard .env),)
    include .env
    export $(shell sed 's/=.*//' .env)
endif

.PHONY: start-local-frontend
start-local-frontend:
	cd react-frontend && npm run dev

.PHONY: start-local-rest-api
start-local-rest-api:
	cd rest-api && go run cmd/server/main.go

.PHONY: spin-up-local-env
spin-up-local-env:
	docker compose down -v && \
	docker compose up -d --wait && \
	make load-init-data

.PHONY: load-init-data
load-init-data:
	./scripts/spicedb-backup-restore.sh
	./scripts/mongo-restore.sh
	./scripts/keycloak-import.sh

.PHONY: dump-init-data
dump-init-data:
	rm -rf ./data
	mkdir -p ./data
	./scripts/spicedb-backup-create.sh
	./scripts/mongo-dump.sh
	./scripts/keycloak-export.sh
