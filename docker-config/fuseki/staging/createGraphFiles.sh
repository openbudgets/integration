#!/usr/bin/env bash
# Creates graph-files containing the grap-name for dataset-file:
# https://github.com/openbudgets/platform/issues/19

DUMPS_DIR="/dumps"
QUERY="PREFIX qb:   <http://purl.org/linked-data/cube#>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>

SELECT ?graph
WHERE {
  VALUES (?class             ?order) {
         (qb:DataSet         1)
         (skos:ConceptScheme 2)
  }
  ?graph a ?class .
}
ORDER BY ?order
LIMIT 1"

#QUERY="SELECT ?dataset WHERE { ?dataset a <http://purl.org/linked-data/cube#DataSet> . } LIMIT 1"

# Change into the dumps directory provided as the first argument of the script
cd $DUMPS_DIR

# Generate a *.graph file for each *.ttl file.
#find * -type f -name "*.ttl" | xargs -I@ /bin/sh -c  "arq --results CSV --data \"@\" \"$QUERY\" | grep 'http:.*' | tee @.graph | cat"
TTL_FILES=$(find * -type f -name "*.ttl")
for TTL_FILE in ${TTL_FILES}
do
    GREP_RESULT=$(arq --results CSV --data ${TTL_FILE} "$QUERY" | grep 'http:.*')
    if [ -z "${GREP_RESULT}" ]
    then
        echo "$(date) No graphname found for ttl-file: ${TTL_FILE}" | tee -a "/var/log/ttl_graph_names.log" | cat
    else
        echo "${GREP_RESULT}" | tee "${TTL_FILE}.graph" | cat
    fi
done
