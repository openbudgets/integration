#!/usr/bin/env bash

echo "Renews the certificate if expiration is close. The certificate needs to be installed previously."

docker build -t letsencrypt_img .
docker run --rm --name letsencrypt \
    -p 1086:80 \
    -v "$PWD/../volumes/nginx/letsencrypt/etc:/etc/letsencrypt" \
    -v "$PWD/../volumes/nginx/letsencrypt/lib:/var/lib/letsencrypt" \
    -v "$PWD/../volumes/nginx/letsencrypt/www:/var/www" \
    letsencrypt_img \
    renew