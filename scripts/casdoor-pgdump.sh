#!/usr/bin/env bash

# TODO: test removing -i option
docker exec -i my-drive_casdoor-postgres \
	pg_dump -U casdoor casdoor > $(pwd)/data/postgres/init-casdoor.sql
