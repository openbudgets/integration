#!/bin/sh
set -e

startRudolf() {
    echo "Starting Rudolf"
    cd /var/www/rudolf
    php-fpm -R
}

refreshCache() {
    echo "Refreshing Cache in Rudolf..."
    cd /
    nohup /bin/sh /refreshCache >>/dev/null 2>>/dev/null &
}

## Execute:
crond
refreshCache && startRudolf