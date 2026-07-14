#!/usr/bin/env bash

# TODO: test removing -i option
docker exec -i my-drive_spicedb-postgres \
	pg_dump -U spicedb spicedb > $(pwd)/data/postgres/init-spicedb.sql
