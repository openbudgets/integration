#!/usr/bin/env bash
cd $FUSEKI_HOME && sh ./fuseki-server --config=/config.ttl --set tdb:fileMode=direct