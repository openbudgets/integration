#!/usr/bin/env bash
set -e

generate_compose_yml(){
    python3 ./generate_docker_compose_files.py
}

upload_images(){
    cd $PWD/docker-config && \
        docker-compose -f docker-compose-generated.yml build && \
        docker-compose -f docker-compose-generated.yml push
}

# PUSH-Workflow:
git checkout master
git pull origin master
generate_compose_yml
upload_images