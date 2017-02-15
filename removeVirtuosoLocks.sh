#!/usr/bin/env bash
cd ./volumes && find . -name *.lck | xargs -i rm {}
cd ./volumes && find . -name *.trx | xargs -i rm {}