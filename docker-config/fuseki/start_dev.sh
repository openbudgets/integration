#!/usr/bin/env bash
find . -name *.lock | xargs -i rm {}
touch /var/log/cron.log
cd $FUSEKI_HOME && sh ./fuseki-server --config=/config.ttl --set tdb:fileMode=direct