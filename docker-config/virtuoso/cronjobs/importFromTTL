#!/usr/bin/env bash
# see: http://virtuoso.openlinksw.com/dataspace/doc/dav/wiki/Main/VirtBulkRDFLoader
# 1st argument: IMPORT_FOLDER within the container for example /dumps points to http://eis-openbudgets.iais.fraunhofer.de/dumps
# 2nd argument: DBA_PASSWORD
set -e

clear_delete_file(){
    cd /upload
    : > ./delete_graphs_ttl.txt
}

populate_delete_file(){
    cd /upload
    find . -name "*.ttl.graph" | while read filename; do (cat "$filename";echo) >> ./delete_graphs_ttl.txt; done
}

clear_isql_file(){
    cd /upload
    : > tmp_ttl.isql
}

populate_isql_file_with_deletes(){
    cd /upload
    echo "log_enable(3,1);" >> tmp_ttl.isql
    while read -r LINE; do
        echo "SPARQL CLEAR GRAPH <$LINE>;" >> tmp_ttl.isql
    done < ./delete_graphs_ttl.txt
}

populate_isql_file_with_imports(){
    cd /upload
    . /setEnv
    echo "Importing started from /upload"
    echo "DELETE FROM DB.DBA.load_list;" >> tmp_ttl.isql
    echo "ld_dir_all('/upload', '*.ttl', NULL);" >> tmp_ttl.isql
    echo "select * from DB.DBA.load_list;" >> tmp_ttl.isql
    echo "rdf_loader_run();" >> tmp_ttl.isql
}

execute_isql(){
    /usr/local/virtuoso-opensource/bin/isql-v 1111 dba "$DBA_PASSWORD" tmp_ttl.isql
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