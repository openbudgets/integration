#!/usr/bin/env bash
# Creates graph-files containing the grap-name for dataset-file:
# https://github.com/openbudgets/platform/issues/19

DUMPS_DIR="/dumps"
QUERY="SELECT ?dataset WHERE { ?dataset a <http://purl.org/linked-data/cube#DataSet> . } LIMIT 1"

# Change into the dumps directory provided as the first argument of the script
cd $DUMPS_DIR

# Generate a *.graph file for each *.ttl file.
find * -type f -name "*.ttl" | xargs -I@ /bin/sh -c  "arq --results CSV --data \"@\" \"$QUERY\" | grep 'http:.*' | tee @.graph | cat"

