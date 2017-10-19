#!/usr/bin/env bash
# Microsite:
mkdir -p volumes/microsite/data
[ ! -f volumes/microsite/data/db.sqlite3 ] && cp ./docker-config/microsite/db.sqlite3 ./volumes/microsite/data/db.sqlite3

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
mkdir -p volumes/virtuosoStaging/upload
mkdir -p volumes/virtuosoProduction/data
mkdir -p volumes/virtuosoStagingOld/data
mkdir -p volumes/virtuosoStagingOld/upload

# nginx:
mkdir -p volumes/nginx/log
mkdir -p volumes/nginx/dumps

# OS-viewer:
mkdir -p volumes/osviewer/themes

# tripleStoreStaging:
mkdir -p volumes/tripleStoreStaging/data
mkdir -p volumes/tripleStoreStaging/log
# fusekistaging:
mkdir -p volumes/tripleStoreProduction/data
mkdir -p volumes/tripleStoreProduction/log
# SSHServer:
mkdir -p volumes/sshserver/log
# DAM
mkdir -p volumes/dam/dampostgres

# Silk-Workbench:
mkdir -p volumes/silkworkbench/silk

#RDFBrowser:
mkdir -p volumes/rdfbrowser/logs
mkdir -p volumes/rdfbrowser/database
[ ! -f volumes/rdfbrowser/database/database.sqlite ] && cp ./docker-config/rdfbrowser/database.sqlite ./volumes/rdfbrowser/database/database.sqlite

#KPIs:
mkdir -p volumes/kpi/logs
mkdir -p volumes/kpi/database
mkdir -p volumes/kpi/composer
[ ! -f volumes/kpi/database/database.sqlite ] && cp ./docker-config/kpi/database.sqlite ./volumes/kpi/database/database.sqlite

#opencpu:
mkdir -p volumes/opencpu/scripts

# Alignment MySQL DB:
mkdir -p volumes/alignment/mysql
mkdir -p volumes/alignment/composer

# Alignment
mkdir -p volumes/alignment/storage
mkdir -p volumes/alignment/storage/app/projects
mkdir -p volumes/alignment/storage/app/public/json_serializer
mkdir -p volumes/alignment/storage/logs
mkdir -p volumes/alignment/stappler

chmod -R oga+rwx ./volumes
