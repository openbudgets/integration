#!/usr/bin/env bash

# Start Fuseki
find . -name *.lock | xargs -i rm {}
cd $FUSEKI_HOME && sh ./fuseki-server --config=/config.ttl

#cd $FUSEKI_HOME && sh ./fusekistaging-server --update --loc=/data /fusekistaging