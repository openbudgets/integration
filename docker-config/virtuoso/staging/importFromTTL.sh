#!/usr/bin/env bash
# see: http://virtuoso.openlinksw.com/dataspace/doc/dav/wiki/Main/VirtBulkRDFLoader
# 1st argument: IMPORT_FOLDER within the container for example /dumps points to http://eis-openbudgets.iais.fraunhofer.de/dumps
# 2nd argument: DBA_PASSWORD
set -e

clear_delete_file(){
    cd /upload
    : > ./delete_graphs.txt
}

populate_delete_file(){
    cd /upload
    find . -name "*.ttl.graph" | xargs -I"{}" cat "{}" >> ./delete_graphs.txt
}

clear_isql_file(){
    cd /upload
    : > tmp.isql
}

populate_isql_file_with_deletes(){
    cd /upload
    echo "log_enable(3,1);" >> tmp.isql
    while read -r LINE; do
        echo "SPARQL CLEAR GRAPH $LINE;" >> tmp.isql
    done < ./delete_graphs.txt
}

populate_isql_file_with_imports(){
    cd /upload
    . /setEnv
    echo "Importing started from /upload"
    echo "DELETE FROM DB.DBA.load_list;" > tmp.isql
    echo "ld_dir_all('/upload', '*.ttl', NULL);" >> tmp.isql
    echo "select * from DB.DBA.load_list;" >> tmp.isql
    echo "rdf_loader_run();" >> tmp.isql
}

execute_isql(){
    /usr/local/virtuoso-opensource/bin/isql-v 1111 dba "$DBA_PASSWORD" tmp.isql
}

clear_upload_dir(){
    cd /upload && find . -name "*.ttl" | xargs -I"{}" rm "{}"
    cd /upload && find . -name "*.ttl.graph" | xargs -I"{}" rm "{}"
}

clear_delete_file
clear_isql_file

# Delete Graphs:
populate_delete_file
populate_isql_file_with_deletes

# Import Datasets:
populate_isql_file_with_imports

execute_isql
clear_upload_dir