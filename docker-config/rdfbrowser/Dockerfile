FROM php:7.0.7-fpm-alpine

# Install PHP 7:
RUN apk add --update libmcrypt-dev curl git bash

RUN docker-php-ext-install pdo_mysql tokenizer mbstring

RUN git config --global url."https://github.com/".insteadOf git@github.com: && \
    git config --global url."https://".insteadOf git://

# Install Composer:
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Add Timezone:
RUN apk add tzdata && cp /usr/share/zoneinfo/Europe/Berlin /etc/localtime && \
    echo "Europe/Berlin" > /etc/timezone

# Copy config file:
COPY ./config/www.conf /usr/local/etc/php-fpm.d/www.conf
COPY ./config/zz-docker.conf /usr/local/etc/php-fpm.d/zz-docker.conf
COPY ./config/php-fpm.conf /usr/local/etc/php-fpm.conf
COPY ./config/php.ini /usr/local/etc/php/php.ini

# Install app:
ENV APP_DIR /var/www/RDFBrowser
WORKDIR $APP_DIR
RUN git clone https://github.com/okgreece/RDFBrowser.git $APP_DIR
COPY ./.env $APP_DIR/.env
RUN composer install
RUN php artisan key:generate
RUN chmod -R a+rwx $APP_DIR

EXPOSE 8000
COPY ./start.sh /start.sh
#COPY ./.env /.env
CMD ["/bin/sh", "/start.sh"]



