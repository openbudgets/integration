#!/bin/sh
set -e
startRudolf() {
    echo "Starting Rudolf"
    cd /var/www/rudolf
    chmod a+rwx -R /var/www/rudolf
    chown -R www-data:www-data /var/www/rudolf
    php-fpm
}

refreshCache() {
    echo "Refreshing Cache in Rudolf..."
    cd /
    nohup /bin/sh /refreshCache >>/dev/null 2>>/dev/null &
}

## Execute:
crond
refreshCache && startRudolf
