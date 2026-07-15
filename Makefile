ifneq ($(wildcard .env),)
    include .env
    export $(shell sed 's/=.*//' .env)
endif

.PHONY: start-local-frontend
start-local-frontend:
	$(MAKE) -C react-frontend/ start-local

.PHONY: start-local-rest-api
start-local-rest-api:
	$(MAKE) -C rest-api/ start-local

.PHONY: start-local-filesystem
start-local-filesystem:
	$(MAKE) -C filesystem/ start-local

.PHONY: spin-up-local-env
spin-up-local-env:
	docker compose down -v --remove-orphans && \
	docker compose up -d --wait

.PHONY: dump-init-data
dump-init-data: dump-casdoor-data dump-mongo-data dump-spicedb-data

.PHONY: dump-casdoor-data
dump-casdoor-data:
	scripts/casdoor-pgdump.sh

.PHONY: dump-mongo-data
dump-mongo-data:
	scripts/mongo-dump.sh

.PHONY: dump-spicedb-data
dump-spicedb-data:
	scripts/spicedb-pgdump.sh
