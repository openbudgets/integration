FROM php:7.0.13-apache

RUN echo "deb http://ftp.de.debian.org/debian jessie-backports main" >> /etc/apt/sources.list

RUN apt-get -y update && apt-get install -y git gettext bash curl mysql-client zlib1g-dev libicu-dev g++ libmcrypt-dev
RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl
RUN apt install -y -t jessie-backports openjdk-8-jre-headless openjdk-8-jdk-headless openjdk-8-jdk ca-certificates-java


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
RUN apt-get purge php7.0-gd
RUN apt-get install -y libgd3 php7.0-gd libapache2-mod-php7.0 \
    php7.0-xml php7.0-json php7.0-xsl php7.0-redis php7.0-mcrypt \
    php7.0-imagick php7.0-common php7.0-zip
RUN phpenmod gd
RUN apt-get upgrade -y
# php7.0-gd  php-gd php5-gd

ENV PHP_TIMEZONE Europe/Berlin

# Enable Apache mod_rewrite
RUN a2enmod rewrite
RUN a2enmod php7.0
RUN a2enmod proxy
RUN a2enmod proxy_http

#COPY ./php.ini /usr/local/etc/php/

# Install app:
# Configure Apache Document Root
#ENV APACHE_DOC_ROOT /var/www/alignment/public/
ENV APACHE_DOC_ROOT /var/www/alignment/public/
ENV APP_DIR /var/www/alignment
WORKDIR $APP_DIR
RUN chmod -R a+rwx $APP_DIR
RUN git clone https://github.com/okgreece/Alignment.git $APP_DIR && \
    cd $APP_DIR && git checkout f998b73d702b30e0d9cd3917793482eaec550ac2
COPY ./.env $APP_DIR/.env

RUN composer install
RUN php artisan key:generate
RUN chmod -R a+rwx $APP_DIR

COPY ./.htaccess ./var/www/alignment/public/.htaccess

EXPOSE 80
COPY ./wait-for-it.sh /wait-for-it.sh
COPY ./start.sh /start.sh
COPY ./initDB.sh $APP_DIR/initDB.sh
RUN chmod a+x /wait-for-it.sh && \
    chmod a+x /start.sh && \
    chmod a+x $APP_DIR/initDB.sh
CMD ["bash", "-x", "/wait-for-it.sh", "alignmentmysql:3306", "--" , "/bin/sh /start.sh"]
