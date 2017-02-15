docker run -v $PWD/../volumes/virtuosoStagingOld/data:/data \
	-v $PWD/../volumes/virtuosoStagingOld/upload:/upload \
	-v $PWD/../volumes/nginx/dumps:/dumps \
	-v $PWD/virtuoso/virtuoso.ini:/data/virtuoso.ini \
	-e "  =TEST" \
	-e "SPARQL_UPDATE=true" \
	-p "8895:8890" \
	-p "1115:1111" \
	-ti openbudgets/virtuoso_staging:0.0.6 /bin/sh