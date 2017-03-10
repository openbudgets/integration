#!/bin/sh
set -e

set_file_permissions(){
    chmod -R 777 /var/www/rudolf/storage
    chown -R www-data:www-data /var/www/rudolf
}

startRudolf() {
    echo "Starting Rudolf"
    cd /var/www/rudolf
    set_file_permissions
    php-fpm
}

refreshCache() {
    echo "Refreshing Cache in Rudolf..."
    set_file_permissions
    cd /
    nohup /bin/sh /refreshCache >>/dev/null 2>>/dev/null &
    set_file_permissions
}

## Execute:
crond
refreshCache && startRudolf
