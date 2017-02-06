#!/usr/bin/env bash
# see: http://virtuoso.openlinksw.com/dataspace/doc/dav/wiki/Main/VirtBulkRDFLoader
# 1st argument: IMPORT_FOLDER within the container for example /dumps points to http://eis-openbudgets.iais.fraunhofer.de/dumps
# 2nd argument: DBA_PASSWORD
set -e

import_dump(){
    . /setEnv
    echo "Importing started from /upload"
    echo "DELETE FROM DB.DBA.load_list;" > tmp.isql
    echo "ld_dir_all('/upload', '*.ttl', NULL);" >> tmp.isql
    echo "select * from DB.DBA.load_list;" >> tmp.isql
    echo "rdf_loader_run();" >> tmp.isql
    /usr/local/virtuoso-opensource/bin/isql-v 1111 dba "$DBA_PASSWORD" tmp.isql
    rm tmp.isql
    cd /upload && find . -name "*.ttl" | xargs -I"{}" rm "{}"
}

import_dump