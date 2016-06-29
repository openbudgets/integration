# Script for Sending a POST to trigger the pipeline execution:

# Tutorial by Marek: https://github.com/openbudgets/pipeline-fragments/tree/master/FDPtoRDF

# LinkedPipes-URL for triggering the pipeline execution =
# http://[your LinkedPipes server]/resources/executions?pipeline=http://[your LinkedPipes server]/resources/pipelines/created-[pipeline timestamp]

# Parameters:
PARAM_FILE=$PWD/datapackage.jsonld
PARAM_PIPELINE=created-1467031005380
PARAM_LP_DOMAIN=http://localhost:8080

echo "PARAM_FILE=$INPUT_FILE"
echo "PARAM_PIPELINE=$INPUT_PIPELINE"
echo "PARAM_LP_DOMAIN=$INPUT_LP_DOMAIN"
echo "curl -i -X POST -H \"Content-Type: multipart/form-data\" -F \"input=@$PARAM_FILE\" \"$PARAM_LP_DOMAIN/resources/executions?pipeline=$PARAM_LP_DOMAIN/resources/pipelines/$PARAM_PIPELINE\""

# Sending POST to LinkedPipes:
curl -i -X POST -H "Content-Type: multipart/form-data" -F "input=@$PARAM_FILE" "$PARAM_LP_DOMAIN/resources/executions?pipeline=$PARAM_LP_DOMAIN/resources/pipelines/$PARAM_PIPELINE"

# echo output:
# PARAM_FILE=/home/maik/obeu_infrastructure2/testfiles/datapackage.jsonld
# PARAM_PIPELINE=created-1467031005380
# PARAM_LP_DOMAIN=http://localhost:8080
# curl -i -X POST -H "Content-Type: multipart/form-data" -F "input=@$PWD/datapackage.jsonld" "http://localhost:8080/resources/executions?pipeline=http://localhost:8080/resources/pipelines/created-1467031005380"