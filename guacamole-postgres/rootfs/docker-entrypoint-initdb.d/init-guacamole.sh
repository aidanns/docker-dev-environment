#!/bin/bash

set -e

cat /create-guacamole-db.sql | psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" -
