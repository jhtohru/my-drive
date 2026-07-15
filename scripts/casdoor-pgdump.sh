#!/usr/bin/env bash

docker exec my-drive_casdoor-postgres \
	pg_dump \
		-U casdoor \
		casdoor \
		> $(pwd)/data/casdoor/init.sql
