#!/usr/bin/env bash
git pull origin master
export COMPOSE_HTTP_TIMEOUT=200
OBEU_WORKDIR=$PWD
. $OBEU_WORKDIR/setEnv
cd $OBEU_WORKDIR/docker-config && \
    docker-compose stop && \
    docker-compose rm -f && \
    docker-compose build
cd $OBEU_WORKDIR/volumes && \
    find . -name *.lock | xargs -i rm {}
cd $OBEU_WORKDIR/volumes && \
    find . -name *.trx | xargs -i rm {}
cd $OBEU_WORKDIR/docker-config && \
    docker-compose up -d
