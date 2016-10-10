#!/bin/sh
set -e

# Clone git repo:
downloadRudolf() {
    echo "Downloading Rudolf-Repository"
    rm -rf /var/www/rudolf
    cd /var/www && git clone https://github.com/openbudgets/rudolf.git
    cp /config/sparql.php /var/www/rudolf/config/sparql.php
    chown -R www-data:www-data /var/www
    chmod oag+rwx -R /var/www
}

updateRudolf() {
    echo "Updating Rudolf from remote Git-repo"
    cd /var/www/rudolf && git pull origin master
}

installRudolf() {
    echo "Installing Rudolf"
    cd /var/www/rudolf && composer install --no-scripts
}

startRudolf() {
    echo "Starting Rudolf"
    php artisan cache:clear
    php-fpm
}

## Execute:

[ -f /var/www/rudolf/server.php ] && updateRudolf || downloadRudolf

installRudolf && startRudolf