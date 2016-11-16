FROM laradock/php-fpm

RUN apt-get update -y && apt-get install -y git curl

RUN git config --global url."https://github.com/".insteadOf git@github.com: && \
    git config --global url."https://".insteadOf git://

# Install Composer:
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY ./config/php.ini /usr/local/etc/php/

# Install app:
ENV APP_DIR /var/www/html
WORKDIR $APP_DIR
RUN git clone https://github.com/okgreece/RDFBrowser.git $APP_DIR
COPY ./.env $APP_DIR/.env
RUN composer install
RUN php artisan key:generate
RUN chmod -R a+rwx $APP_DIR

EXPOSE 8000
#COPY ./start.sh /start.sh
COPY ./.env /.env
#CMD ["/bin/sh", "/start.sh"]



