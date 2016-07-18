#!/usr/bin/env bash

# Start cron
cp /syncTriplestores /etc/periodic/15min/syncTriplestores

# Start Fuseki
find . -name *.lock | xargs -i rm {}
cd $FUSEKI_HOME && sh ./fuseki-server --config=/config.ttl --set tdb:fileMode=direct