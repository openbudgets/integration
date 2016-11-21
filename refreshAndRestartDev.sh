#!/usr/bin/env bash
git pull origin master
export COMPOSE_HTTP_TIMEOUT=200
OBEU_WORKDIR=$PWD
. $OBEU_WORKDIR/setEnv
cd $OBEU_WORKDIR/volumes && \
    find . -name *.lock | xargs -I "{}" rm {}
cd $OBEU_WORKDIR/volumes && \
    find . -name *.trx | xargs -I "{}" rm {}
cd $OBEU_WORKDIR/docker-config && \
    docker-compose -f dev.yml stop && \
    docker-compose -f dev.yml rm -f && \
    docker-compose -f dev.yml build
cd $OBEU_WORKDIR/volumes && \
    find . -name *.lock | xargs -i rm {}
cd $OBEU_WORKDIR/volumes && \
    find . -name *.trx | xargs -i rm {}
cd $OBEU_WORKDIR/docker-config && \
    docker-compose -f dev.yml up
