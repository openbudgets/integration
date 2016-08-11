#!/usr/bin/env bash
docker build -t dam .
docker run -p "5000:5000" -v $PWD/../../volumes/dam/app:/DAM -ti dam
