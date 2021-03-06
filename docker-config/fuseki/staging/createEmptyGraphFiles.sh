#!/usr/bin/env bash

DUMPS_DIR="$PWD"

# Change into the dumps directory provided as the first argument of the script
cd $DUMPS_DIR

# Generate a *.graph file for each *.ttl file.
TTL_FILES=$(find * -type f -name "*.ttl")
for TTL_FILE in ${TTL_FILES}
do
    touch "$TTL_FILE.graph"
done