#!/usr/bin/env bash
cd ./docker-config/vocol/
docker build -t vocol .
docker run -p 8899:80 -d --restart="always" vocol