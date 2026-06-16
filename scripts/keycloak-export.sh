#!/usr/bin/env bash

docker run --rm \
  --name keycloak-export \
	--net my-docs_default \
  -v $(pwd)/data/keycloak:/workspace \
  quay.io/keycloak/keycloak:26.6.3 \
  export \
  --dir /workspace \
  --realm master \
  --db mysql \
  --db-url-host keycloak-mysql \
  --db-url-port 3306 \
  --db-schema keycloak \
  --db-username keycloak \
  --db-password password
  