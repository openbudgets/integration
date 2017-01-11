FROM php:7.0.13-apache

RUN echo "deb http://ftp.de.debian.org/debian jessie-backports main" >> /etc/apt/sources.list

RUN apt-get update -y && apt-get install -y git openjdk-8-jdk gettext bash curl mysql-client

RUN echo 'deb http://packages.dotdeb.org jessie all' > /etc/apt/sources.list.d/dotdeb.list
RUN curl http://www.dotdeb.org/dotdeb.gpg | apt-key add -
RUN apt-get update -y && \
    apt-get install -y php7.0-mysql && \
    docker-php-ext-install pdo_mysql

RUN git config --global url."https://github.com/".insteadOf git@github.com: && \
    git config --global url."https://".insteadgit Of git://

# Install Composer:
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install mbstring
RUN docker-php-ext-install mbstring

# Install additional packages:
RUN apt-get install -y php7.0-gd libgd3
# php7.0-gd  php-gd php5-gd

ENV PHP_TIMEZONE Europe/Berlin

# Enable Apache mod_rewrite
RUN a2enmod rewrite

#COPY ./php.ini /usr/local/etc/php/

# Install app:
# Configure Apache Document Root
#ENV APACHE_DOC_ROOT /var/www/alignment/public/
ENV APACHE_DOC_ROOT /var/www/
ENV APP_DIR /var/www/alignment
WORKDIR $APP_DIR
RUN chmod -R a+rwx $APP_DIR
RUN git clone https://github.com/okgreece/Alignment.git $APP_DIR
COPY ./.env $APP_DIR/.env

RUN composer install
RUN php artisan key:generate
RUN chmod -R a+rwx $APP_DIR

EXPOSE 80
COPY ./wait-for-it.sh /wait-for-it.sh
COPY ./start.sh /start.sh
COPY ./initDB.sh $APP_DIR/initDB.sh
RUN chmod a+x /wait-for-it.sh && \
    chmod a+x /start.sh && \
    chmod a+x $APP_DIR/initDB.sh
CMD ["bash", "-x", "/wait-for-it.sh", "alignmentmysql:3306", "--" , "/bin/sh /start.sh"]
