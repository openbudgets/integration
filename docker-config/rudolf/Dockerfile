FROM php:7.0.7-fpm-alpine

# Install PHP 7:
RUN apk add --update bash libmcrypt-dev git curl

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
COPY ./config/php.ini /usr/local/etc/php/php.ini
COPY ./config/php-fpm.conf /usr/local/etc/php-fpm.conf

# Install Rudolf:
RUN cd /var/www && git clone https://github.com/openbudgets/rudolf.git rudolf && \
    cd ./rudolf && \
    git checkout e2f8c13c58aef46be6a78fcc8ce9bc1916e8de56

COPY ./config/sparql.php /var/www/rudolf/config/sparql.php

RUN chown -R www-data:www-data /var/www && \
    chmod oag+rwx -R /var/www

RUN cd /var/www/rudolf && composer install --no-scripts && \
    chmod -R a+rwx .

# Add edge repository:
# RUN echo "http://dl-6.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
# RUN apk add --update moreutils

# Install cronjob for cache refreshing:
COPY ./refreshCache /refreshCache
RUN chmod a+rwx /refreshCache

# Running refresh of Cache takes 5 mins:
RUN (crontab -l ; echo "*/30    *   *   *   *   /refreshCache" ; echo)| crontab -

EXPOSE 8990
COPY ./start.sh /start.sh
RUN chmod a+rwx /start.sh
WORKDIR /

CMD ["/bin/sh", "/start.sh"]


