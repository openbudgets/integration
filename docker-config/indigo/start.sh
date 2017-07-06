#!/usr/bin/env bash
cd /app
ng serve --host 0.0.0.0 --disableHostCheck=true --port 80 --proxy=proxy.conf.json

