#!/usr/bin/env bash
docker build -t indigo .
docker run -v $PWD/../../volumes/indigo/app:/app indigo

docker run -v $PWD/../../volumes/indigo/app:/app -ti indigo /bin/sh