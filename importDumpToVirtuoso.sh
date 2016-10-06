#!/usr/bin/env bash
# Create graph-files for each ttl-file:
echo "Creating graph-files for each ttl-file...."
docker exec dockerconfig_triple_store_staging_1 /bin/sh /createGraphFiles.sh
echo "Created graph-files for each ttl-file"

# Upload to Virtuoso:
echo "Upload to Virtuoso..."
. ./setEnv
docker exec dockerconfig_virtuoso_staging_1 /bin/sh /importDump.sh $VIRTUOSO_STAG_PW
echo "Uploaded to Virtuoso."
