#!/usr/bin/env bash
git pull origin
cd ./docker-config
docker-compose stop && docker-compose rm -f
sh ../removeLocks.sh
docker-compose up -d
