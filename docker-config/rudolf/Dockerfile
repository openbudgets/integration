FROM php:7.0.7-fpm-alpine

# Install PHP 7:
RUN apk update && \
    apk add --update curl git

RUN git config --global url."https://github.com/".insteadOf git@github.com: && \
    git config --global url."https://".insteadOf git://

# Install Composer:
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Rudolf:
RUN cd /var/www && git clone https://github.com/openbudgets/rudolf.git

RUN chown www-data:www-data -R /var/www
RUN chmod og+rwx -R /var/www

# Run Composer:
RUN cd /var/www/rudolf && composer install --no-scripts

COPY ./index.php /var/www/rudolf/.

# Copy config file:
COPY ./sparql.php /rudolf/config/sparql.php

EXPOSE 9000


