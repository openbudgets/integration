#Sending a POST to trigger the pipeline:
#URL =
#http://[your LinkedPipes server]/resources/executions?pipeline=http://[your LinkedPipes server]/resources/pipelines/created-[pipeline timestamp]

INPUT_FILE=$PWD/datapackage.jsonld
INPUT_PIPELINE=created-1467031005380
INPUT_LP_DOMAIN=http://localhost:8080
echo "INPUT_FILE=$INPUT_FILE"
echo "INPUT_PIPELINE=$INPUT_PIPELINE"
echo "INPUT_LP_DOMAIN=$INPUT_LP_DOMAIN"
echo "curl -i -X POST -H \"Content-Type: multipart/form-data\" -F \"input=@$INPUT_FILE\" \"$INPUT_LP_DOMAIN/resources/executions?pipeline=$INPUT_LP_DOMAIN/resources/pipelines/$INPUT_PIPELINE\""
curl -i -X POST -H "Content-Type: multipart/form-data" -F "input=@$INPUT_FILE" "$INPUT_LP_DOMAIN/resources/executions?pipeline=$INPUT_LP_DOMAIN/resources/pipelines/$INPUT_PIPELINE"

# Output:
# INPUT_FILE=/home/maik/obeu_infrastructure2/testfiles/datapackage.jsonld
# INPUT_PIPELINE=created-1467031005380
# INPUT_LP_DOMAIN=http://localhost:8080
# curl -i -X POST -H "Content-Type: multipart/form-data" -F "input=@/home/maik/obeu_infrastructure2/testfiles/datapackage.jsonld" "http://localhost:8080/resources/executions?pipeline=