#!/usr/bin/env bash

# Set permissions:
chown -R www-data:www-data /var/www
chmod og+rwx -R /var/www
php artisan cache:clear
php-fpm