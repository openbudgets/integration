FROM php:7.0.7-fpm-alpine

# Install PHP 7:
RUN apk add --update git libmcrypt-dev curl bash

RUN docker-php-ext-install pdo_mysql mbstring tokenizer

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

EXPOSE 8870

# Clone git repo:
RUN cd /var/www && git clone https://github.com/okgreece/RDFBrowser.git && \
    cd ./RDFBrowser && composer install && \
    cp ./setup/database.sqlite ./storage/database.sqlite && \
    chown -R www-data:www-data /var/www && \
    chmod oag+rwx -R /var/www

RUN cp /var/www/RDFBrowser/setup/.htaccess /var/www/.htaccess

CMD ["php-fpm"]