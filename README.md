Integration of all OBEU components via Docker:

Requirements:
- Docker 
- Docker-compose

Steps for testing locally:
- Clone the repo
-  Create Volume Folders via executing: sh ./initVolumes.sh
- Start Docker containers via: cd ./docker-config && docker-compose up

Exposed Components:
- Fuseki (Staging): http://localhost:80/fuseki/data
    Is mapped to Sparql-Query: DESCRIBE <http://triple_store_staging:3030/fuseki/data> 
- Fuseki (Production): http://localhost:43030/
- LinkedPipes Frontend: http://localhost:28080/    
- Rudolf: http://localhost:80/rudolf
    
