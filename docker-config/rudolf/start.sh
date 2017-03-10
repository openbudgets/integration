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
    chmod a+rwx -R /var/www/rudolf
    chown -R www-data:www-data /var/www/rudolf
    cd /
    nohup /bin/sh /refreshCache >>/dev/null 2>>/dev/null &
    chmod a+rwx -R /var/www/rudolf
    chown -R www-data:www-data /var/www/rudolf
}

## Execute:
crond
refreshCache && startRudolf
