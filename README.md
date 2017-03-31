The OBEU-stack

The OBEU-stack consists of several applications (OBEU-Components) provided by the partners in the OBEU-project as well as from other Open-Source-projects:
- LinkedPipes https://github.com/linkedpipes/etl with the FDP-to-RDF-pipeline https://github.com/openbudgets/pipeline-fragments/tree/master/FDPtoRDF
- Alignment https://github.com/okgreece/Alignment
- Rudolf https://github.com/openbudgets/rudolf
- RDFBrowser https://github.com/okgreece/RDFBrowser
- DAM https://github.com/openbudgets/DAM
- Indigo https://github.com/okgreece/indigo
- nginx as Reverse Proxy https://hub.docker.com/_/nginx/
- Microsite https://github.com/openbudgets/microsite
- OpenSpending-Admin https://github.com/openspending/os-admin
- OpenSpending-Viewer https://github.com/openspending/os-viewer
- OpenSpending-Explorer https://github.com/openspending/os-explorer
- Silk Linked Data Integration Framework https://github.com/silk-framework/silk
- Virtuoso https://hub.docker.com/r/tenforce/virtuoso/ https://github.com/openlink/virtuoso-opensource

Some of the publicly exposed endpoints/frontends:
- Aligment: http://alignment-obeu.iais.fraunhofer.de/
- Viewer: http://eis-openbudgets.iais.fraunhofer.de/viewer/budget-athens-expenditure-2007__5d543?lang=en
- Explorer: http://eis-openbudgets.iais.fraunhofer.de/explorer/
- Indigo: http://eis-openbudgets.iais.fraunhofer.de/indigo/
- Rudolf: http://eis-openbudgets.iais.fraunhofer.de/api/3/cubes/ analogue to OS API as documented here: http://openspending.readthedocs.io/en/master/developers/api/
- Dumps-folder for the FDP-to-RDF-pipeline-transformations and other datasets: http://eis-openbudgets.iais.fraunhofer.de/dumps

(1) Local Installation:
    - Create & Initialize Volume Folders: sh ./initVolumes.sh
    - Add the following Aliase for localhost in your /etc/host-file:
           * local.align
           * local.dam
           * local.data
           * local.micro
      For example your /etc7host-file may look like this:
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
        - DAM: http:/local.dam
        - Mirosite: http://local,micro
        - Alignment: http://local.align
        
    Remark: If you running Docker within a VirtualBox via docker-machine, use the IP-Adress of the docker-machine (mostly this is: 192.168.99.100 but you can find out via docker-machine ip) instead of localhost here.
    
(2) Server Installation:
    - Clone the repo
    - Create Volume Folders via executing: sh ./initVolumes.sh
    - Specify host-specific environment-variables in .env-file (similar to env.example-file)
    - Update from Git-repo & (re-)starting Docker containers via Shell-Script in Project folder:
      sh ./refresh_and_restart_prod.sh

    Exposed Components on the FhG server:

    (a) Only accessible via SSH:
    - LinkedPipes: http://localhost:8080
    - Virtuoso Staging: http://localhost:8890
    - Virtuoso Production: http://localhost:8891
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

There is a Google Doc with more specifics how to establish a new subdomain via CNAME and how to modify nginx.conf.
