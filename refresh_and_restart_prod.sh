#!/usr/bin/env /bin/sh

git pull origin master
export COMPOSE_HTTP_TIMEOUT=200
export GOMAXPROCS=4
OBEU_WORKDIR=$PWD

# -- build: Only rebuilding Images that have changed
    # -- build: Only rebuilding Images that have changed
cd $OBEU_WORKDIR/docker-config && \
docker-compose -f prod.yml up --build -d --remove-orphans
