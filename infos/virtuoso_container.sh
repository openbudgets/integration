docker run -v $PWD/../volumes/virtuosoStagingOld/data:/data \
	-v $PWD/../volumes/virtuosoStagingOld/upload:/upload \
	-v $PWD/../volumes/nginx/dumps:/dumps \
	-v $PWD/virtuoso/virtuoso.ini:/data/virtuoso.ini \
	-e "  =TEST" \
	-e "SPARQL_UPDATE=true" \
	-p "8895:8890" \
	-p "1115:1111" \
	-ti openbudgets/virtuoso_staging:0.0.6 /bin/sh

docker run -v $PWD/../volumes/virtuoso_production/data:/data \
	-v $PWD/../volumes/virtuosoStaging/data:/newdata \
	-v $PWD/../volumes/nginx/dumps:/dumps \
	-v $PWD/virtuoso/virtuoso.ini:/data/virtuoso.ini \
	-e "DBA_PASSWORD=TEST" \
	-e "SPARQL_UPDATE=false" \
	-p "8895:8890" \
	-p "1115:1111" \
	-ti www /bin/sh



    virtuoso_production:
        image: openbudgets/virtuoso_production
        build: ./virtuoso
        volumes:
            - ../volumes/virtuosoProduction/data:/data
            - ../volumes/virtuosoStaging/data:/newdata
            - ./virtuoso/production/startVirtuoso.sh:/startVirtuoso.sh
            - ./virtuoso/virtuoso.ini:/data/virtuoso.ini
        environment:
            - DBA_PASSWORD=$VIRTUOSO_PROD_PW
            - SPARQL_UPDATE=false
            #- DEFAULT_GRAPH=te
        ports:
            - "8891:8890"
            - "1112:1111"
    virtuoso_staging_old:
        image: openbudgets/virtuoso_staging:0.0.6
        volumes:
            - ../volumes/virtuosoStagingOld/data:/data
            - ../volumes/virtuosoStagingOld/upload:/upload
            - ../volumes/nginx/dumps:/dumps
            - ./virtuoso/virtuoso.ini:/data/virtuoso.ini
        environment:
            - DBA_PASSWORD=$VIRTUOSO_STAG_PW
            - SPARQL_UPDATE=true
            #- DEFAULT_GRAPH=te
        ports:
            - "8893:8890"
            - "1113:1111"