#!/usr/bin/env bash

# Set permissions:
chown -R www-data:www-data /var/www
chmod oag+rwx -R /var/www
php artisan cache:clear
php-fpm