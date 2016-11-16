FROM php:7.0.13-apache

RUN apt-get update -y && apt-get install -y git curl

RUN git config --global url."https://github.com/".insteadOf git@github.com: && \
    git config --global url."https://".insteadOf git://

# Install Composer:
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install mbstring
RUN docker-php-ext-install mbstring

ENV PHP_TIMEZONE Europe/Berlin

# Enable Apache mod_rewrite
RUN a2enmod rewrite

COPY ./php.ini /usr/local/etc/php/

# Install app:
# Configure Apache Document Root
ENV APACHE_DOC_ROOT /var/www/RDFBrowser/public/
ENV APP_DIR /var/www/RDFBrowser
WORKDIR $APP_DIR
RUN git clone https://github.com/okgreece/RDFBrowser.git $APP_DIR
COPY ./.env $APP_DIR/.env
RUN composer install
RUN php artisan key:generate
RUN chmod -R a+rwx $APP_DIR

COPY ./database.sqlite /database.sqlite

EXPOSE 80
COPY ./start.sh /start.sh
COPY ./.env /.env
CMD ["/bin/sh", "/start.sh"]



