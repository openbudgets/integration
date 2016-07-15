#!/usr/bin/env bash
git pull origin
cd ./docker-config
docker-compose -f dev.yml stop && docker-compose -f dev.yml rm -f && docker-compose -f dev.yml build
sh ../removeLocks.sh
docker-compose -f dev.yml up