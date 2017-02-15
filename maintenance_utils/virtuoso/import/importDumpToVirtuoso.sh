#!/usr/bin/env bash

# Please configure the Dump folder where the datasets are located for the import to Virtuoso
# in the script /importDump.sh

# Create graph-files for each ttl-file:
echo "Creating graph-files for each ttl-file...."
docker exec dockerconfig_triple_store_staging_1 /bin/sh /createGraphFiles.sh
echo "Created graph-files for each ttl-file"

# Upload to Virtuoso:
echo "Upload to Virtuoso..."
. ../../../env
docker exec dockerconfig_virtuoso_staging_1 /bin/sh /importDump.sh $VIRTUOSO_STAG_PW
echo "Uploaded to Virtuoso."
