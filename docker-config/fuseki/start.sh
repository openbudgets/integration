#!/usr/bin/env bash
find . -name *.lock | xargs -i rm {}
touch /var/log/cron.log
cd $FUSEKI_HOME && sh ./fuseki-server --config=/config.ttl
#cd $FUSEKI_HOME && sh ./fusekistaging-server --update --loc=/data /fusekistaging