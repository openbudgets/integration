FROM php:7.0.7-fpm-alpine

# Install PHP 7:
RUN apk add --update git bash curl libmcrypt-dev

RUN docker-php-ext-install pdo_mysql tokenizer mbstring

RUN git config --global url."https://github.com/".insteadOf git@github.com: && \
    git config --global url."https://".insteadOf git://

# Install Composer:
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Add Timezone:
RUN apk add tzdata && cp /usr/share/zoneinfo/Europe/Berlin /etc/localtime && \
    echo "Europe/Berlin" > /etc/timezone

#COPY ./index.php /var/www/rudolf/.

# Copy config file:
COPY ./config/www.conf /usr/local/etc/php-fpm.d/www.conf
COPY ./config/zz-docker.conf /usr/local/etc/php-fpm.d/zz-docker.conf
COPY ./config/php-fpm.conf /usr/local/etc/php-fpm.conf
COPY ./config/php.ini /usr/local/etc/php/php.ini

# Install cronjob for cache refreshing:
COPY ./refreshCache /etc/periodic/hourly/.
COPY ./refreshCache /refreshCache
RUN chmod a+rwx /refreshCache
RUN chmod a+rwx /etc/periodic/hourly/refreshCache

EXPOSE 8890
COPY ./config /config
COPY ./start.sh /start.sh
RUN chmod -R a+rwx /config && chmod a+rwx /start.sh
WORKDIR /

CMD ["/bin/sh", "/start.sh"]


