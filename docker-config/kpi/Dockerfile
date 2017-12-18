FROM php:7.0.13-apache

RUN echo "deb http://ftp.de.debian.org/debian jessie-backports main" >> /etc/apt/sources.list

RUN apt-get -y update && apt-get install -y git gettext bash curl zip unzip

RUN echo 'deb http://packages.dotdeb.org jessie all' > /etc/apt/sources.list.d/dotdeb.list
RUN curl http://www.dotdeb.org/dotdeb.gpg | apt-key add -
RUN apt-get update -y && \
    apt-get install -y php7.0-sqlite3 libsqlite3-dev libsqlite3-0 && \
    docker-php-ext-install pdo_sqlite

RUN git config --global url."https://github.com/".insteadOf git@github.com: && \
    git config --global url."https://".insteadOf git://

# Install Composer:
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Enable mbstring && install
# RUN docker-php-ext-configure mbstring --enable-mbstring && docker-php-ext-install mbstring

# Install additional packages:
RUN apt-get update -y && apt-get install -y libgd3 php5-gd libapache2-mod-php7.0 \
    php7.0-xml php7.0-json php7.0-xsl php7.0-redis php7.0-mcrypt \
    php7.0-imagick php7.0-common php7.0-zip php7.0-mbstring
RUN phpenmod gd
RUN apt-get upgrade -y

# Enable Apache mod_rewrite
RUN a2enmod rewrite
RUN a2enmod php7.0
RUN a2enmod proxy
RUN a2enmod proxy_http
RUN a2enmod actions

ENV PHP_TIMEZONE Europe/Berlin

# Install app:
# Configure Apache Document Root
ENV APACHE_DOC_ROOT /var/www/KPIs/public/
ENV APP_DIR /var/www/KPIs
WORKDIR $APP_DIR

ADD https://api.github.com/repos/okgreece/KPIs/git/refs/heads/master /version.json
RUN rm -r $APP_DIR
RUN git clone https://github.com/okgreece/KPIs.git $APP_DIR/

RUN mkdir -p /root/.composer
COPY ./prod/apache2.conf /etc/apache2/apache2.conf

RUN mkdir -p /var/www/database
RUN composer install
RUN touch /var/www/database/database.sqlite
COPY ./.env $APP_DIR/.env
COPY ./kpi.conf /etc/apache2/sites-available/kpi.conf
RUN a2ensite kpi.conf && service apache2 start
RUN php artisan key:generate
RUN php artisan migrate --seed --force
RUN php artisan l5-swagger:generate
RUN chmod -R a+rwx $APP_DIR
RUN ln -s /var/www/KPIs/public /var/www/html/kpi
EXPOSE 80
COPY ./start.sh /start.sh
#COPY ./.env /.env
CMD ["/bin/sh", "/start.sh"]
