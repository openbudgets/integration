#!/usr/bin/env bash
set -e
cd ./docker-config
docker login -u "$DOCKER_USER" -p "$DOCKER_PASS"
docker-compose -f docker-compose.yml build --pull
docker-compose -f docker-compose.yml push