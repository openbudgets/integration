#!/usr/bin/env bash
ls {*.rdf,*.ttl} | xargs -i s-put http://localhost:33030/fuseki/data default $1