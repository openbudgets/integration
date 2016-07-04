#!/usr/bin/env bash
ls {*.rdf,*.ttl} | xargs -i s-put http://localhost:43030/fuseki/data default {}
# Pattern: s-put http://localhost:43030/<dataset>/data <named_graph> <ttl-file>