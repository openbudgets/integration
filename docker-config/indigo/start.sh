#!/usr/bin/env bash
cd /app
ng build
ng serve --host 0.0.0.0 --disableHostCheck=true --port 80 

