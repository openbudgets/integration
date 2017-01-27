#!/usr/bin/env bash
# see: http://virtuoso.openlinksw.com/dataspace/doc/dav/wiki/Main/VirtBulkRDFLoader
# 1st argument: IMPORT_FOLDER within http://eis-openbudgets.iais.fraunhofer/dumps
# 2nd argument: DBA_PASSWORD

import_dump(){
    echo "Importing started from /dumps/$IMPORT_FOLDER"
    IMPORT_FOLDER=$1
    DBA_PASSWORD=$2
    echo "DELETE FROM DB.DBA.load_list;" > tmp.isql
    echo "ld_dir_all('/dumps/$IMPORT_FOLDER', '*.trig',NULL);" >> tmp.isql
    echo "select * from DB.DBA.load_list;" >> tmp.isql
    echo "rdf_loader_run();" >> tmp.isql
    /usr/local/virtuoso-opensource/bin/isql-v 1111 dba $DBA_PASSWORD tmp.isql
    rm tmp.isql
}

IMPORT_FOLDER=$1
DBA_PASSWORD=$2

if [ -z "$IMPORT_FOLDER" ] || [ -z "$DBA_PASSWORD" ]
  then
    echo "Aborted. Arguments needed for: IMPORT_FOLDER $IMPORT_FOLDER and DBA_PASSWORD $DBA_PASSWORD"
  else
    import_dump $IMPORT_FOLDER $DBA_PASSWORD
fi
