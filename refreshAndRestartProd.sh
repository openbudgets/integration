#!/usr/bin/env bash
git pull origin
OBEU_WORKDIR=$PWD
source $OBEU_WORKDIR/setEnv.sh
cd $OBEU_WORKDIR/docker-config && \
    docker-compose stop && \
    docker-compose rm -f && \
    docker-compose build
cd $OBEU_WORKDIR/volumes && \
    find . -name *.lock | xargs -i rm {}
cd $OBEU_WORKDIR/docker-config && \
    docker-compose up -d
