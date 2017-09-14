#!/usr/bin/env bash
docker build -t align .
docker run -ti align /bin/sh