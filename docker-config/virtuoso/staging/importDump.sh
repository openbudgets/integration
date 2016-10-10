#!/usr/bin/env bash
# see: http://virtuoso.openlinksw.com/dataspace/doc/dav/wiki/Main/VirtBulkRDFLoader
# 1st argument: DBA_PASSWORD
echo "DELETE FROM DB.DBA.load_list;" > tmp.isql
echo "ld_dir_all('/dumps', '*.ttl',NULL);" >> tmp.isql
echo "select * from DB.DBA.load_list;" >> tmp.isql
echo "rdf_loader_run();" >> tmp.isql
/usr/local/virtuoso-opensource/bin/isql-v 1111 dba $1 tmp.isql
rm tmp.isql