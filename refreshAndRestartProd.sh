#!/usr/bin/env bash
git pull origin master
export COMPOSE_HTTP_TIMEOUT=200
export GOMAXPROCS=4
OBEU_WORKDIR=$PWD
. $OBEU_WORKDIR/setEnv

# -- build: Only rebuilding Images that have changed
cd $OBEU_WORKDIR/docker-config && \
    docker-compose -f docker-compose-generated.yml pull && \
    docker-compose -f docker-compose-generated.yml up -d --build




