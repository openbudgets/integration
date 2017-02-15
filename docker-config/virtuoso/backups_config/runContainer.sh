#!/usr/bin/env bash
#docker build -t virtuoso_img .
docker run --name virtuoso_test \
    -p 8890:8890 -p 1111:1111 \
    -e DBA_PASSWORD=obeutest \
    -e SPARQL_UPDATE=true \
    -e DEFAULT_GRAPH=http://localhost:8890/test \
    -v $pwd/data:/data \
    -d openbudgets/virtuoso:7.2.4
