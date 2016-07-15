#!/usr/bin/env bash

STAGING_DIR=/srv2/obeu/integration/volumes/tripleStoreStaging/data
PRODUCTION_DIR=/srv2/obeu/integration/volumes/tripleStoreProduction/data

# Stop Fuseki Production:
docker exec dockerconfig_triple_store_production_1 supervisorctl stop executor

# 1:1 copy of Fuseki-data-directories
rm -rf $PRODUCTION_DIR
mkdir -p $PRODUCTION_DIR
cp -r $STAGING_DIR/* $PRODUCTION_DIR/*
cd $PRODUCTION_DIR && rm *.lock

# Start Fuseki Production:
docker exec dockerconfig_triple_store_production_1 supervisorctl start executor
