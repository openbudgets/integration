#!/usr/bin/env bash

echo "If run for the first time, please disable https 443 in nginx.conf."
echo "If the script has successfully run, enable https 443 in nginx.conf again."

mkdir -p ./volumes/nginx/letsencrypt/www
mkdir -p ./volumes/nginx/letsencrypt/lib
mkdir -p ./volumes/nginx/letsencrypt/etc

docker build -t letsencrypt_img ./docker-config/letsencrypt
docker run -it --rm --name letsencrypt \
    -p 1086:80 \
    -v "$PWD/volumes/nginx/letsencrypt/etc:/etc/letsencrypt" \
    -v "$PWD/volumes/nginx/letsencrypt/lib:/var/lib/letsencrypt" \
    -v "$PWD/volumes/nginx/letsencrypt/www:/var/www" \
    letsencrypt_img \
    certonly \
    --authenticator webroot \
    --webroot \
    --webroot-path /var/www \
    --agree-tos \
    --renew-by-default \
    -d eis-openbudgets.iais.fraunhofer.de \
    -d www.eis-openbudgets.iais.fraunhofer.de \
    -m maiklukasch@gmail.com \
    --server https://acme-staging.api.letsencrypt.org/directory \
    --debug \
    --standalone-supported-challenges http-01 \
    --verbose

#docker kill --signal=HUP dockerconfig_nginx_1
