#!/usr/bin/env bash
set -e

DBFILE="mydb.duckdb"

echo "Intializing database"
duckdb "$DBFILE" -c ".read src/01_init.sql"

echo "Staging data"
duckdb "$DBFILE" -c ".read src/02_import.sql"

echo "Creating Dimensions"
duckdb "$DBFILE" -c ".read src/03_dimensions.sql"

echo "Creating Fact Table"
duckdb "$DBFILE" -c ".read src/04_fact.sql"

echo "Exporting Model Table Files"
duckdb "$DBFILE" -c ".read src/05_export.sql"

echo "Done."

