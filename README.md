# OBEU Platform

## Softwares Running on OBEU Platform

The software stack consists of several softwares (OBEU-Components) provided by the partners in the OBEU-project as well as from other Open-Source-projects:

- LinkedPipes
  - `https://github.com/linkedpipes/etl`
  - With FDP-to-RDF-pipeline  
    - `https://github.com/openbudgets/pipeline-fragments/tree/master/FDPtoRDF`
  - Accessible through SSH
    - `http://localhost:8080`
- Alignment
  - `https://github.com/okgreece/Alignment`
  - Running on: `http://apps.openbudgets.eu/alignment`
- Rudolf
  - `https://github.com/openbudgets/rudolf`
  - API running on: `http://apps.openbudgets.eu/api/3/cubes/`
- RDFBrowser
  - `https://github.com/okgreece/RDFBrowser`
- DAM
  - `https://github.com/openbudgets/DAM`
  - Running on: `http://apps.openbudgets.eu/dam/`
- Indigo
  - `https://github.com/okgreece/indigo`
  - Running on: `http://apps.openbudgets.eu/`
- Nginx as Reverse Proxy
  - `https://hub.docker.com/_/nginx/`
- Microsite
  - `https://github.com/openbudgets/microsite`
  - Running on: `https://apps.openbudgets.eu/microsite/`
- OpenSpending-Viewer
  - `https://github.com/openspending/os-viewer`
  - Running on: `http://apps.openbudgets.eu/viewer`
  - Example: `http://apps.openbudgets.eu/viewer/budget-athens-expenditure-2007__5d543?lang=en`
- Silk Linked Data Integration Framework
  - `https://github.com/silk-framework/silk`
- Virtuoso
  - `https://github.com/openlink/virtuoso-opensource`
  - From docker hub `https://hub.docker.com/r/tenforce/virtuoso/`
  - Accessible through SSH
    - Virtuoso Staging: `http://localhost:8890`
    - Virtuoso Production: `http://localhost:8891`

- Dumps-folder for the FDP-to-RDF-pipeline-transformations and other datasets:   
  - `http://apps.openbudgets.eu/dumps`

## Replica of OBEU Platform
It is possible to replicate the components running on OBEU platform to your own platform. The components are managed by using Docker and Docker-Compose, so you need have this two software installed on you server. For detail information about how to install docker and docker-compose, please check https://www.docker.com/.

The docker configuration files are included in the Integration repository, each component has its own folder, and every component is running within a separate docker container.

### Hardware Recommendations
This section gives the hardware specifications of the OBEU platform as a reference for the deployment on your platform.

The current platform is running and tested with the following recommended hardware specifications:
  -  Intel(R) Xeon(R) CPU E5-2660 v3 @ 2.60GHz
  -  35GB RAM
  -  4GB Swap memory
  -  1TB hard disk for storage


### Prepare The Integration
You need to make the integration folder prepared with all the shared volumes, static files placed in the correct path.

#### Clone the Integration Git Repository
You can git clone the repository by the following command:

  `git clone https://github.com/openbudgets/integration`

#### Environment Variables
You can specify the host-specific environment-variables in the `.env` file similar to `env.example` file. Credentials are required for some components, and they are stored in .env file. For example for a local installation the Virtuoso credentials are: `Username: dba, Password: TEST`. Some specific software configurations are list as follows.

##### Docker
You need to replace the variables with domain `http://apps.openbudgets.eu` in [`integration/docker-config/prod.yml`](https://github.com/openbudgets/integration/blob/master/docker-config/prod.yml) to `your_domain_name`.

##### Rudolf
The configuration files of Rudolf are in [`docker-config/rudolf/config`](https://github.com/openbudgets/integration/tree/master/docker-config/rudolf/config) folder. You need to adapt the following settings:

- php.ini
  - `memory_limit = 2048M` in case some request requires large memory.

##### Indigo
You need to set the following environment variables of Indigo in file [`docker-config/indigo/environment.ts`](https://github.com/openbudgets/integration/blob/master/docker-config/indigo/environment.ts).

- Rudolf api
  - `apiUrl: 'your_domain_name/'`
- DAM URL
  - `DAMUrl: 'your_domain_name/dam'`
- OpenCPU URL
  - `openCpuEndpoint: 'your_domain_name/ocpu'`

You also have to modify the Dockerfile [`docker-config/indigo/Dockerfile`](https://github.com/openbudgets/integration/blob/master/docker-config/indigo/Dockerfile) by removing the hashtag(#) in line 55 `#COPY ./layout.ts /app/src/app/components/layout.ts` to use the link in your own server.

##### OS-Packager
You need to adapt the OBEU specific files in folder [`os-packager/obeu_specific`](https://github.com/openbudgets/integration/tree/master/docker-config/os-packager/obeu_specific). You need to replace the link to static files, like `https://apps.openbudgets.eu/svg/packager_black.svg` to `your_domain_name/packager_black.svg` in the following files:

- default.json
- footer.html

In order to upload dataset properly, you need to register in os-spending. Please contact us for the registration!

##### OS-Viewer
You need to change the following settings:

- `docker-config/os-viewer/obeu_specific/index.js`
  - `$scope.datamineUrl = 'your_domain_name/cube/analytics/' + dataMinePath;`
- change static file links from `https://apps.openbudgets.eu/` to `your_domain_name`
  - `docker-config/os-viewer/prod_config/themes/default.json`
  
In order to view dataset properly, you need to register in os-spending. Please contact us for the registration!

##### DAM
You need to change the following variables in [`docker-config/damapp/.env`](https://github.com/openbudgets/integration/blob/master/docker-config/damapp/.env)
- Replace `http://eis-openbudgets.iais.fraunhofer.de/` and `http://apps.openbudgets.eu/` with `your_domain_name`.

##### Alignment, KPI and RDFBrowser
You need to change the following settings in ```.env``` file on the root directory

- replace domain name `https://apps.openbudgets.eu/` with `your_domain_name`and `http://data.openbudgets.eu` with `your_data_domain_name`
```
#GLOBAL: Contains variables used by all containers
APP_DOMAIN=https://apps.openbudgets.eu
DATA_DOMAIN=http://data.openbudgets.eu
```

##### Virtuoso
The staging version of Virtuoso is used by default. You need to adapt the following setttings in [`docker-config/virtuoso/staging/virtuoso.ini`](https://github.com/openbudgets/integration/blob/master/docker-config/virtuoso/staging/virtuoso.ini)

- `ResultSetMaxRows = 500000;`
  - set the maximum number of rows in the return result
- `MaxQueryMem = 16G;`
  - set the maximum allowed memory consumption by query

#### Initialize Shared Volumes
You can use the provided bash shell script to initialize the share volumes in the integration folder.

`sh ./initVolumes.sh`

### Prepare Domain Name
We use Nginx as a proxy server which runs in one docker container. You need to change the domain name according to your own case and HTTPS credential is needed in order to use HTTPS.

#### Nginx Server Configuration
The included domain name and subdomains are configured in `docker-config/nginx/conf/nginx.conf`, and all the included configuration files within `docker-config/nginx/conf/nginx.conf` are located in `docker-config/nginx/conf/includes`. You only need the following files:

- http_server_eis_obeu.conf
  - You define your own domain name in this file with the following line
    - `server_name your_domain_name;`
  - It should listen on port `80`
    - `listen 80;`
  - You can define all the included components as in `Include Apps` section.
- https_server_eis_obeu.conf
  - You define domain name in this file with the following line:
    - `server_name your_domain_name;`
  - It should listen on port `443`
    - `listen 443 ssl;`
- http_server_data_obeu.conf
  - You define domain name in this file as
    - `server_name your_domain_name;`
  - It should listen on port `80`
    - `listen 80;`

#### Subdomains
Triple store is running under subdomain `data.openbudgets.eu`. It is configured in file `docker-config/nginx/conf/includes/http_server_data_obeu.conf`, and `RDFBrowser` and `VirtuosoStaging` are running under this subdomain. You need to change`poroxy_set_header` to `Host data.your_domain_name;` in [`docker-config/nginx/conf/includes/locations/rdfbrowser.conf`](https://github.com/openbudgets/integration/blob/master/docker-config/nginx/conf/includes/locations/rdfbrowser.conf)

#### HTTPS
There are some shell scripts provided to generate https credentials and ssl keys by using `letsencrypt` services running within docker container. You need to adapt the settings in `letsEncryptProductionCert` file with your own domain name. You have to change the line `-d microsite-obeu.iais.fraunhofer.de` to `your_domain_name` in file [`letsencrypt/letsEncryptProductionCert`](https://github.com/openbudgets/integration/blob/master/letsencrypt/letsEncryptProductionCert). Afterwards you can generate credentials by using the following command in folder [`letsencrypt`](https://github.com/openbudgets/integration/tree/master/letsencrypt):

`sh letsEncryptProductionCert`

Then the credentials should already be generated to the shared volumes generated during initializing of the folders.


### Running Docker Containers
After the environment variables is set up, then you can update from Integration git repository and (re-)starting Docker containers by provided bash shell script with the following command:

`sh ./refresh_and_restart_prod.sh`


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
