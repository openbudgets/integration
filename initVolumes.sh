#!/usr/bin/env bash
# Linkedpipes:
mkdir -p volumes/linkedpipes/data
mkdir -p volumes/linkedpipes/log

# nginx:
mkdir -p volumes/nginx/log
mkdir -p volumes/nginx/dumps
# tripleStoreStaging:
mkdir -p volumes/tripleStoreStaging/data
mkdir -p volumes/tripleStoreStaging/log
# fusekistaging:
mkdir -p volumes/tripleStoreProduction/data
mkdir -p volumes/tripleStoreProduction/log
# Rudolf:
mkdir -p volumes/rudolf/log

chmod -R oga+rwx ./volumes
