#!/usr/bin/env bash
git pull origin
OBEU_WORKDIR=$PWD
cd ./docker-config && \
    docker-compose stop && \
    docker-compose rm -f && \
    docker-compose build
cd $OBEU_WORKDIR/volumes && \
    find . -name *.lock | sudo xargs -i rm {}
docker-compose up -d
