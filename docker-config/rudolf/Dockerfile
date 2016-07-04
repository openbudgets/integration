FROM php:7.0.7-fpm-alpine

# Install PHP 7:
RUN apk add --update git curl libmcrypt-dev

RUN docker-php-ext-install mbstring pdo_mysql tokenizer

RUN git config --global url."https://github.com/".insteadOf git@github.com: && \
    git config --global url."https://".insteadOf git://

# Install Composer:
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Rudolf:
RUN cd /var/www && git clone https://github.com/openbudgets/rudolf.git

# Run Composer:
RUN cd /var/www/rudolf && composer install --no-scripts

COPY ./index.php /var/www/rudolf/.

# Copy config file:
COPY ./sparql.php /var/www/rudolf/config/sparql.php
COPY ./www.conf /usr/local/etc/php-fpm.d/www.conf
COPY ./zz-docker.conf /usr/local/etc/php-fpm.d/zz-docker.conf
COPY ./php-fpm.conf /usr/local/etc/php-fpm.conf
COPY ./php.ini /usr/local/etc/php/php.ini
WORKDIR /var/www/rudolf

VOLUME /var/www/rudolf/storage/logs

EXPOSE 8890

COPY ./start.sh /start.sh

CMD ["/bin/sh", "/start.sh"]


