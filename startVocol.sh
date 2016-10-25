#!/usr/bin/env bash
cd ./docker-config/vocol/
docker build -t vocol .
docker run -p 8999:80 -d --name="vocol_instance" --restart="always" vocol