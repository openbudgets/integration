#!/usr/bin/env bash
# Script for creating Docker-compose-file: ./docker-config/prod-generated.yml
# Always work on Template-File: ./docker-config/prod-template.yml
# And generate the compose-file afterwards.

# Pass Argument: IMAGE_TAG for Docker-Images
# Default value: Empty String for no IMAGE_TAG for Docker-Images
if [ -z "$1" ]
  then
    echo "No argument to script passed: Generating prod-generated.yml with no IMAGE_TAG"
    export IMAGE_TAG=""
  else
     echo "Argument to script passed: Generating prod-generated.yml with IMAGE_TAG: $1"
    export IMAGE_TAG=":$1"
fi
envsubst '${IMAGE_TAG}' < docker-config/prod-template.yml > ./docker-config/prod-generated.yml