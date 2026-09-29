#!/usr/bin/env bash

docker run --rm \
  --name keycloak-export \
	--net my-drive_default \
  -v $(pwd)/data:/workspace \
  -w /workspace \
  quay.io/keycloak/keycloak:26.6.3 \
  export \
  --dir ./keycloak/ \
  --realm master \
  --db mysql \
  --db-url-host keycloak-mysql \
  --db-url-port 3306 \
  --db-schema keycloak \
  --db-username keycloak \
  --db-password password
