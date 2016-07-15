#!/usr/bin/env bash
git pull origin
cd ./docker-config
docker-compose stop && docker-compose rm -f && docker-compose build
sh ../removeLocks.sh
docker-compose up -d
