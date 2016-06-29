#!/usr/bin/env bash

PARAM_FILE=$PWD/datapackage.jsonld
PARAM_LP_DOMAIN=http://eis-openbudgets.iais.fraunhofer.de

curl -i -X POST -H "Content-Type: multipart/form-data" -F "input=@$PARAM_FILE" "$PARAM_LP_DOMAIN/linkedpipes/execute/fdp2rdf"

# curl -i -X POST -H "Content-Type: multipart/form-data" -F "input=@$PWD/datapackage.jsonld" "http://eis-openbudgets.iais.fraunhofer.de/linkedpipes/execute/fdp2rdf"