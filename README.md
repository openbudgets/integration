The OBEU-stack

OBEU-Components:
- LinkedPipes
- Fuseki Triplestore (Staging & Production)
- nginx as Reverse Proxy
- Rudolf querying the Staging triplestore
- OS-Viewer backed up by Rudolf

Requirements for the installation environment:
- Git
- Docker 
- Docker-compose

(1) Local Installation:
    - Clone the repo
    - Create Volume Folders via executing: sh ./initVolumes.sh
    - Start Docker containers via docker-compose:
        cd ./docker-config && docker-compose -f dev.yml up

    Exposed components in a local OBEU installation:
    - LinkedPipes: http://localhost:8080
    - Fuseki Staging: http://localhost:33030
    - Fuseki Production: http://localhost:43030
    - OS-Viewer: http://localhost/viewer
    - Rudolf: http://localhost/api/3/cubes

    Endpoint for executing the FDP-2-RDF-pipeline here with the pipeline-ID "created-1468495715437":
    curl -i -X POST -H "Content-Type: multipart/form-data" -F "input=@$PWD/datapackage.jsonld" "http://localhost:8080/resources/executions?pipeline=$PARAM_LP_DOMAIN/resources/pipelines/created-1468495715437"

(2) Server Installation:
    - Clone the repo
    - Create Volume Folders via executing: sh ./initVolumes.sh
    - Define environment variables for: DNS_HOST_1, DNS_HOST_2
    - Start Docker containers via docker-compose:
        cd ./docker-config && docker-compose up

    Exposed Components on the FhG server:

    (a) Only accessible via SSH:
    - LinkedPipes: http://localhost:8080
    - Fuseki Staging: http://localhost:33030
    - Fuseki Production: http://localhost:43030
    - OS-Viewer: http://localhost/viewer

    (b) Public accessible via http:
    - Rudolf: http://eis-openbudgets.iais.fraunhofer.de/api/3/cubes
    - OS-Viewer: http://eis-openbudgets.iais.fraunhofer.de/viewer

Appendix

How To import the FDP-2-RDF-Pipeline:
https://github.com/openbudgets/pipeline-fragments/tree/master/FDPtoRDF

