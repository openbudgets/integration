#!/usr/bin/env bash
docker build -t silk .
mkdir ./silk
docker run -p 9000:9000 -v $PWD/silk:/root/.silk silk