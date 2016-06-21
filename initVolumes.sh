#!/usr/bin/env bash
# Linkedpipes:
mkdir -p volumes/linkedpipes/data
mkdir -p volumes/linkedpipes/data/lp/etl/pipelines
mkdir -p volumes/linkedpipes/supervisor/log
# nginx:
mkdir -p volumes/nginx/log
# tripleStoreStaging:
mkdir -p volumes/tripleStoreStaging/data
mkdir -p volumes/tripleStoreStaging/log
# fuseki:
mkdir -p volumes/tripleStoreProduction/data
mkdir -p volumes/tripleStoreProduction/log
# Rudolf:
mkdir -p volumes/rudolf/log



#chmod -R ug+rwx volumes