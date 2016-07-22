#!/usr/bin/env bash
# Parameters:
PARAM_FILE=$PWD/datapackage.jsonld
PARAM_PIPELINE=created-1468495715437
PARAM_LP_DOMAIN=http://localhost:8080

echo "PARAM_FILE=$INPUT_FILE"
echo "PARAM_PIPELINE=$INPUT_PIPELINE"
echo "PARAM_LP_DOMAIN=$INPUT_LP_DOMAIN"
echo "curl -i -X POST -H \"Content-Type: multipart/form-data\" -F \"input=@$PARAM_FILE\" \"$PARAM_LP_DOMAIN/resources/executions?pipeline=$PARAM_LP_DOMAIN/resources/pipelines/$PARAM_PIPELINE\""

# Sending POST to LinkedPipes:
curl -i -X POST -H "Content-Type: multipart/form-data" -F "input=@$PWD/datapackage.jsonld" "http://localhost:8080/resources/executions?pipeline=http://localhost:8080/resources/pipelines/created-1469178804520"