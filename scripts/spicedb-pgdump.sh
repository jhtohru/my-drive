#!/usr/bin/env bash

docker exec my-drive_spicedb-postgres \
	pg_dump \
		-U spicedb \
		spicedb \
		> $(pwd)/data/spicedb/init.sql
