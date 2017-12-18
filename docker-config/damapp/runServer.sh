#!/usr/bin/env bash
cd $APP_DIR && \
    source ./env/bin/activate && \
    source ./.env

mkdir ./sample-data && cd ./sample-data
wget http://wenxion.net/OBEU/aggregate.json && cd ../
nohup redis-server > /var/log/redis.log 2>&1 &
cd $APP_DIR && nohup python3 worker.py > /var/log/worker.log 2>&1 &
cd $APP_DIR && python3 manage.py runserver --host 0.0.0.0
