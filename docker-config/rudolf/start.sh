#!/bin/sh
set -e

# Clone git repo:
rm -rf /var/www/rudolf
cd /var/www && git clone https://github.com/openbudgets/rudolf.git

# Install Rudolf: Run Composer
cd /var/www/rudolf && composer install --no-scripts

# Copy config files:
cp /config/sparql.php /var/www/rudolf/config/sparql.php

# Set permissions:
chown -R www-data:www-data /var/www
chmod oag+rwx -R /var/www
php artisan cache:clear
php-fpm || tail -f