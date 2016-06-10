#!/usr/bin/env bash
# Linkedpipes:
mkdir -p volumes/linkedpipes/data
mkdir -p volumes/linkedpipes/data/lp/etl/pipelines
mkdir -p volumes/linkedpipes/supervisor/log
# nginx:
mkdir -p volumes/nginx/log
# tripleStoreStaging:
mkdir -p volumes/tripleStoreStaging/data
mkdir -p volumes/tripleStoreStaging/run
# fuseki:
mkdir -p volumes/tripleStoreProduction/data
mkdir -p volumes/tripleStoreProduction/run
# Rudolf:
mkdir -p volumes/rudolf



#chmod -R ug+rwx volumes