#!/usr/bin/env bash
git pull origin
OBEU_WORKDIR=$PWD
cd $OBEU_WORKDIR/volumes && \
    find . -name *.lock | xargs -I "{}" rm {}
cd $OBEU_WORKDIR/docker-config && \
    docker-compose -f dev.yml stop && \
    docker-compose -f dev.yml rm -f && \
    docker-compose -f dev.yml build && \
    sh $OBEU_WORKDIR/removeFusekiLocks.sh && \
    docker-compose -f dev.yml up
