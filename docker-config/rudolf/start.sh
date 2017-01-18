#!/bin/sh
set -e
startRudolf() {
    echo "Starting Rudolf"
    cd /var/www/rudolf
    php-fpm
}

refreshCache() {
    echo "Refreshing Cache in Rudolf..."
    cd /
    ./refreshCache
}

## Execute:
refreshCache && startRudolf