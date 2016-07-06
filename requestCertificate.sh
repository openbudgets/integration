#!/usr/bin/env bash
mkdir -p ./volumes/nginx/letsencrypt/www
mkdir -p ./volumes/nginx/letsencrypt/lib
mkdir -p ./volumes/nginx/letsencrypt/etc

docker run -it --rm --name letsencrypt \
    -p 1086:80 \
    -v "$PWD/volumes/nginx/letsencrypt/etc:/etc/letsencrypt" \
    -v "$PWD/volumes/nginx/letsencrypt/lib:/var/lib/letsencrypt" \
    -v "$PWD/volumes/nginx/letsencrypt/www:/var/www" \
    quay.io/letsencrypt/letsencrypt:latest auth \
    --authenticator webroot \
    --webroot-path /var/www \
    --renew-by-default \
    --server https://acme-v01.api.letsencrypt.org/directory \
    -d eis-openbudgets.iais.fraunhofer.de

#    --server https://acme-staging.api.letsencrypt.org/directory \
#    --debug \
#    --renew-by-default \
#    --standalone-supported-challenges http-01 \
#    --verbose \
#    -d my.example.co
