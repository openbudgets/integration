#!/usr/bin/env bash
# 1st argument: DBA_PASSWORD
echo "ld_dir_all('/dumps', '*.ttl')" > tmp.isql
/usr/local/virtuoso-opensource/bin/isql-v 1111 dba $1 tmp.isql
rm tmp.isql