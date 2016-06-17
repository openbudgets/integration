#!/usr/bin/env bash
# Needs apache-fuseki/bin folder in the PATH:

# Load some RDF data into the default graph of the server:
s-put http://localhost:33030/ontology/data default test.ttl
s-put http://localhost:43030/resource/data default test.ttl


# Get it back:
s-get http://localhost:33030/ontology/data default
s-get http://localhost:33030/resource/data default

# Query it with SPARQL using the .../query endpoint.
s-query --service http://localhost:33030/fuseki/query 'SELECT * {?s ?p ?o}'

# Sparql-Query: DESCRIBE <http://localhost:33030/fuseki/data>
# --> Url encoded:
http://localhost:33030/fuseki/query?query=DESCRIBE%20%3Chttp%3A%2F%2Flocalhost%3A33030%2Ffuseki%2Fdata%3E
curl http://localhost:33030/fuseki/query?query=DESCRIBE%20%3Chttp%3A%2F%2Flocalhost%3A33030%2Ffuseki%2Fdata%3E

# How it should be with url rewriting:
curl -L http://localhost/resources/data
curl -L http://localhost/ontology/data
curl -L http://eis-openbudgets.iais.fraunhofer.de/resources/data
curl -L http://eis-openbudgets.iais.fraunhofer.de/ontology/data

# Update it with SPARQL using the .../update endpoint.
s-update --service http://localhost:33030/fuseki/update 'CLEAR DEFAULT'


# Server URI scheme
# This details the service URIs for Fuseki:
    http://*host*/dataset/query -- the SPARQL query endpoint.
    http://*host*/dataset/update -- the SPARQL Update language endpoint.
    http://*host*/dataset/data -- the SPARQL Graph Store Protocol endpoint.
    http://*host*/dataset/upload -- the file upload endpoint.


