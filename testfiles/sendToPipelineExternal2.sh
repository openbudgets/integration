#!/usr/bin/env bash
curl -i -X POST -H "Content-Type: multipart/form-data" -F "input=@datapackage.jsonld" http://eis-openbudgets.iais.fraunhofer.de/linkedpipes/execute/fdp2rdf
