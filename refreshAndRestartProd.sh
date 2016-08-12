#!/usr/bin/env bash
git pull origin
chmod -R a+rx ./docker-config
chmod -R a+rx ./refreshAndRestartProd.sh
chmod -R a+rx ./seeComposeLogs.sh
cd ./docker-config
docker-compose stop && docker-compose rm -f && docker-compose build
sh ../removeFusekiLocks.sh
docker-compose up -d
