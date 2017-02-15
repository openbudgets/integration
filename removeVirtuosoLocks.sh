#!/usr/bin/env bash
cd ./volumes && find . -name *.lck | xargs -i rm {} && \
    find . -name *.trx | xargs -i rm {}