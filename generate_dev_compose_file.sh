#!/usr/bin/env bash
# Script for creating Docker-compose-file: ./docker-config/dev-generated.yml
# Always work on Template-File: ./docker-config/dev-template.yml
# And generate the compose-file afterwards.

# Pass Argument: IMAGE_TAG for Docker-Images
# Default value: Empty String for no IMAGE_TAG for Docker-Images
if [ -z "$1" ]
  then
    echo "No argument to script passed: Generating dev-generated.yml with no IMAGE_TAG"
    export IMAGE_TAG=""
  else
     echo "Argument to script passed: Generating dev-generated.yml with IMAGE_TAG: $1"
    export IMAGE_TAG=":$1"
fi
envsubst '${IMAGE_TAG}' < docker-config/dev-template.yml > ./docker-config/dev-generated.yml