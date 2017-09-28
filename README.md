# OBEU Platform

## Softwares Running on OBEU Platform

The software stack consists of several softwares (OBEU-Components) provided by the partners in the OBEU-project as well as from other Open-Source-projects:

- LinkedPipes
  - https://github.com/linkedpipes/etl
  - With FDP-to-RDF-pipeline  
    - https://github.com/openbudgets/pipeline-fragments/tree/master/FDPtoRDF
  - Accessible through SSH
    - http://localhost:8080
- Alignment
  - https://github.com/okgreece/Alignment
  - Running on: http://apps.openbudgets.eu/alignment
- Rudolf
  - https://github.com/openbudgets/rudolf
  - API running on: http://apps.openbudgets.eu/api/3/cubes/
- RDFBrowser
  - https://github.com/okgreece/RDFBrowser
- DAM
  - https://github.com/openbudgets/DAM
- Indigo
  - https://github.com/okgreece/indigo
  - Running on: http://apps.openbudgets.eu/
- Nginx as Reverse Proxy
  - https://hub.docker.com/_/nginx/
- Microsite
  - https://github.com/openbudgets/microsite
- OpenSpending-Admin
  - https://github.com/openspending/os-admin
- OpenSpending-Viewer
  - https://github.com/openspending/os-viewer
  - Running on: http://apps.openbudgets.eu/viewer
  - Example: http://apps.openbudgets.eu/viewer/budget-athens-expenditure-2007__5d543?lang=en
- Silk Linked Data Integration Framework
  - https://github.com/silk-framework/silk
- Virtuoso
  - https://github.com/openlink/virtuoso-opensource
  - From docker hub https://hub.docker.com/r/tenforce/virtuoso/
  - Accessible through SSH
    - Virtuoso Staging: http://localhost:8890
    - Virtuoso Production: http://localhost:8891

- Dumps-folder for the FDP-to-RDF-pipeline-transformations and other datasets:   
  - http://apps.openbudgets.eu/dumps

## Replica of OBEU Platform
It is possible to replicate the components running on OBEU platform to your own platform. The components are managed by using Docker and Docker-Compose, so you need have this two software installed on you server. For detail information about how to install docker and docker-compose, please check https://www.docker.com/.

The docker configuration files are included in the Integration repository, each component has its own folder, and every component is running within a separate docker container.

### Prepare The Integration
You need to make the integration folder prepared with all the shared volumes, static files placed in the correct path.

#### Clone the Integration Git Repository
You can git clone the repository by the following command:

  `git clone https://github.com/openbudgets/integration`

#### Initialize Shared Volumes
You can use the provided bash shell script to initialize the share volumes in the integration folder.

`sh ./initVolumes.sh`

#### Environment Variables
You can specify the host-specific environment-variables in the `.env` file similar to `env.example` file.

Some components require credentials in order to use them such as Virtuoso. Credentials are stored in env.example. For example for a local installation the Virtuoso credentials are:

`Username: dba, Password: TEST`


#### Running Docker Containers

Update from Integration git repository and (re-)starting Docker containers by provided bash shell script with the following command:

`sh ./refresh_and_restart_prod.sh`

### Prepare Domain Name
We use Nginx as a proxy server which runs in one docker container. You need to change the domain name and HTTPS credentials in order to use HTTPS.

#### Subdomains

#### HTTPS
There are some shell scripts provided to generate https credentials and ssl keys by using `letsencrypt` services running within docker container. You need to adapt the settings in `letsEncryptProductionCert` file with your own domain name, afterwards you can generate credentials by using the following command:

`sh letsEncryptProductionCert`

Then the credentials should already be generated to the shared volumes generated during initializing of the folders.

## Local Test
(1) Local Installation:

    - Create & Initialize Volume Folders: sh ./initVolumes.sh
    - Add the following Aliase for localhost in your /etc/host-file:
           * local.align
           * local.dam
           * local.data
           * local.micro
      For example your /etc/host-file may look like this:
      127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4 local.align local.dam local.data local.micro
    - Start applications (incl. update from remote repo): sh ./refresh_and_restart_dev.sh

    Since the Virtuoso-Staging-DB will be empty, you will have to import datasets for seeing the results in the Viewer, Explorer.

    Exposed components in a local OBEU installation:
        - LinkedPipes: http://localhost:8080
        - Virtuoso Staging: http://localhost:8890
        - Virtuoso Production: http://localhost:8891
        - OS-Viewer: http://localhost/viewer
        - Rudolf: http://localhost/api/3/cubes
        - Dump of the FDP-2-RDF-Pipeline: http://localhost/dumps
        - DAM: http://local.dam
        - Mirosite: http://local.micro
        - Alignment: http://local.align

    Remark: If you running Docker within a VirtualBox via docker-machine, use the IP-Adress of the docker-machine (mostly this is: 192.168.99.100 but you can find out via docker-machine ip) instead of localhost here.


## Appendix

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

There is a Google Doc with more specifics how to establish a new subdomain via CNAME and how to modify nginx.conf.
