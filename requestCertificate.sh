#!/usr/bin/env bash
mkdir -p ./volumes/nginx/letsencrypt/www
mkdir -p ./volumes/nginx/letsencrypt/lib
mkdir -p ./volumes/nginx/letsencrypt/etc

docker run -it --rm --name letsencrypt \
    -p 1086:80 \
    -v "$PWD/volumes/nginx/letsencrypt/etc:/etc/letsencrypt" \
    -v "$PWD/volumes/nginx/letsencrypt/lib:/var/lib/letsencrypt" \
    -v "$PWD/volumes/nginx/letsencrypt/www:/var/www" \
    quay.io/letsencrypt/letsencrypt:latest \
    certonly \
    --authenticator webroot \
    --webroot \
    --webroot-path /var/www/eis-openbudgets.iais.fraunhofer.de \
    --agree-tos \
    --renew-by-default \
    -d eis-openbudgets.iais.fraunhofer.de \
    -m mlukasch@gmail.com \
# Production:
#    --server https://acme-staging.api.letsencrypt.org/directory \
#
# Staging:
    --server https://acme-staging.api.letsencrypt.org/directory \
    --debug \
    --standalone-supported-challenges http-01 \
    --verbose
