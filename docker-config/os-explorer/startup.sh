#!/bin/sh
set -e

cd /app
node_modules/.bin/gulp

rm /www || true
ln -s `pwd` /www
chmod a+rwx /www
ls -la /www/

echo '{"baseUrl":""}' > /www/config.json

nginx
