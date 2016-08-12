#!/usr/bin/env bash
git pull origin
OBEU_WORKDIR=$PWD
chmod -R a+rx ./docker-config
chmod -R a+rx ./refreshAndRestartProd.sh
chmod -R a+rx ./seeComposeLogs.sh
cd ./docker-config && \
    docker-compose stop && \
    docker-compose rm -f && \
    docker-compose build
cd $OBEU_WORKDIR && \
    /bin/sh removeFusekiLocks.sh
docker-compose up -d
