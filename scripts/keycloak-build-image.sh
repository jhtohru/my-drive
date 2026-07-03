#!/usr/bin/env bash

docker build \
	--tag my-drive/keycloak \
	--no-cache \
	$(pwd)/keycloak/
