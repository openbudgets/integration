#!/usr/bin/env bash
cd $APP_DIR && \
    source ./.env && \
    source ./env/bin/activate
nohup redis-server > /var/log/redis.log 2>&1 &
nohup python3 worker.py > /var/log/worker.log 2>&1 &
python3 manage.py runserver --host 0.0.0.0