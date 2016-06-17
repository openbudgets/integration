#!/usr/bin/env bash
# Needs apache-fuseki/bin folder in the PATH:

# Load some RDF data into the default graph of the server:
s-put http://localhost:33030/fuseki/data default test.ttl
s-put http://localhost:33030/fuseki/data2 default test.ttl

# Get it back:
s-get http://localhost:33030/fuseki/data default
s-get http://localhost:33030/fuseki/data default

# Query it with SPARQL using the .../query endpoint.
s-query --service http://localhost:33030/fuseki/query 'SELECT * {?s ?p ?o}'

# Sparql-Query: DESCRIBE <http://localhost:33030/fuseki/data>
# --> Url encoded:
http://localhost:33030/fuseki/query?query=DESCRIBE%20%3Chttp%3A%2F%2Flocalhost%3A33030%2Ffuseki%2Fdata%3E
curl http://localhost:33030/fuseki/query?query=DESCRIBE%20%3Chttp%3A%2F%2Flocalhost%3A33030%2Ffuseki%2Fdata%3E

# How it should be with url rewriting:
curl -L http://localhost/fuseki/data

# Update it with SPARQL using the .../update endpoint.
s-update --service http://localhost:33030/fuseki/update 'CLEAR DEFAULT'


