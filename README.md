The OBEU-stack

OBEU-Components:
- LinkedPipes
- Fuseki Triplestore (Staging & Production)
- nginx as Reverse Proxy
- Rudolf querying the Staging triplestore
- OS-Viewer backed up by Rudolf

Requirements for the installation environment:
- Git
- Docker (running on Linux recommended)
- Docker-compose

(1) Local Installation:
    
    - Clone the repo
    - Create Volume Folders via executing: sh ./initVolumes.sh
    - Update from Git-repo & (re-)starting Docker containers via Shell-Script in Project folder:
        sh ./refreshAndRestartDev.sh
    
    Exposed components in a local OBEU installation:
        - LinkedPipes: http://localhost:8080
        - Fuseki Staging: http://localhost:33030
        - Fuseki Production: http://localhost:43030
        - OS-Viewer: http://localhost/viewer
        - Rudolf: http://localhost/api/3/cubes
        - Dump of the FDP-2-RDF-Pipeline: http://localhost/dumps
    Remark: If you running Docker within a VirtualBox via docker-machine, use the IP-Adress of the docker-machine (mostly this is: 192.168.99.100 but you can find out via docker-machine ip) instead of localhost here.
    
    Endpoint for executing the FDP-2-RDF-pipeline here with the pipeline-ID "created-1468495715437":
        curl -i -X POST -H "Content-Type: multipart/form-data" -F "input=@$PWD/datapackage.jsonld" "http://localhost:8080/resources/executions?pipeline=$PARAM_LP_DOMAIN/resources/pipelines/created-1468495715437"
    Remark: To find out the pipeline id, click on "Copy Pipeline IRI" on the pipeline overview in LinkedPipes Frontend (8080)

(2) Server Installation:
    
    - Clone the repo
    - Create Volume Folders via executing: sh ./initVolumes.sh
    - Define environment variables for: DNS_HOST_1, DNS_HOST_2
    - Update from Git-repo & (re-)starting Docker containers via Shell-Script in Project folder:
        sh ./refreshAndRestartProd.sh

    Exposed Components on the FhG server:

    (a) Only accessible via SSH:
    - LinkedPipes: http://localhost:8080
    - Fuseki Staging: http://localhost:33030
    - Fuseki Production: http://localhost:43030
    - OS-Viewer: http://localhost/viewer

    (b) Public accessible via http:
    - Rudolf: http://eis-openbudgets.iais.fraunhofer.de/api/3/cubes
    - OS-Viewer: http://eis-openbudgets.iais.fraunhofer.de/viewer
    - Dump of the FDP-2-RDF-Pipeline: http://eis-openbudgets.iais.fraunhofer.de/dumps

Appendix

    How To import the FDP-2-RDF-Pipeline on LinkedPipes-Frontend (8080):
        https://github.com/openbudgets/pipeline-fragments/tree/master/FDPtoRDF
        Upload Pipeline from URL: https://raw.githubusercontent.com/openbudgets/pipeline-fragments/master/FDPtoRDF/FDPtoRDF.jsonld
    
    How to configure the TripleStore-Component in the FDP-2-RDF-Pipeline on LinkedPipes-Frontend (8080):
        (a) Select Repository: Fuseki
        (b) Graph store protocol endpoint: http://triple_store_staging:3030/fuseki/data
        (c) Target Graph IRI: http://data.openbudgets.eu/fdp-datasets
        (d) No authentication

    How To configure Files-to-Scp-Component for a local OBEU-stack-installation on LinkedPipes-Frontend (8080):
        (a) Host-address: sshserver
        (b) User-name & Password: root
        (c) Target Directory: /dumps

