#!/usr/bin/env bash

# Add cronjob:
cp /cronjobs/syncTriplestores /etc/periodic/hourly/syncTriplestores

# Start Fuseki
find . -name *.lock | xargs -i rm {}
cd $FUSEKI_HOME && sh ./fuseki-server --update --config=/config.ttl --set tdb:fileMode=direct