#!/usr/bin/env bash

DUMPS_DIR_BONN="/home/mluk/obeu_infrastructure2/dataset_import/state_2017_01/aragon/dsd"

# Change into the dumps directory provided as the first argument of the script
cd $DUMPS_DIR_BONN

# Generate a *.graph file for each *.ttl file.
TTL_FILES=$(find * -type f -name "*.ttl")
for TTL_FILE in ${TTL_FILES}
do
    touch "$TTL_FILE.graph"
done