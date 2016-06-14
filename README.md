Integration of all OBEU components via Docker:

(1) Clone the repo
(2) Create Volume Folders via executing: sh ./initVolumes.sh
(3) Start Docker containers via: cd ./docker-config && docker-compose up

Exposed Components:
- Fuseki (Staging): http://localhost:80/fuseki/data
    Is mapped to Sparql-Query: DESCRIBE <http://triple_store_staging:3030/fuseki/data> 
- Fuseki (Production): http://localhost:43030/
- LinkedPipes Frontend: http://localhost:28080/    
- Rudolf: http://localhost:80/rudolf
    
