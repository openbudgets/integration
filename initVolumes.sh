#!/usr/bin/env bash
# Linkedpipes:
mkdir -p volumes/linkedpipes/data
mkdir -p volumes/linkedpipes/log

mkdir -p volumes/linkedpipes_1/data
mkdir -p volumes/linkedpipes_1/log

mkdir -p volumes/linkedpipes_2/data
mkdir -p volumes/linkedpipes_2/log

mkdir -p volumes/linkedpipes_3/data
mkdir -p volumes/linkedpipes_3/log

mkdir -p volumes/linkedpipes_4/data
mkdir -p volumes/linkedpipes_4/log

mkdir -p volumes/linkedpipes_5/data
mkdir -p volumes/linkedpipes_5/log

# virtuoso:
mkdir -p volumes/virtuosoStaging/data
mkdir -p volumes/virtuosoProduction/data

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
mkdir -p volumes/rudolf/www
# SSHServer:
mkdir -p volumes/sshserver/log
# DAM
mkdir -p volumes/dam/app

chmod -R oga+rwx ./volumes
