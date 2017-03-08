FROM eboraas/laravel:stretch

RUN echo "deb http://ftp.de.debian.org/debian jessie-backports main" >> /etc/apt/sources.list

RUN apt-get -y update && apt-get install -y git gettext bash curl mysql-client
RUN apt install -y -t jessie-backports openjdk-8-jre-headless openjdk-8-jdk-headless openjdk-8-jdk ca-certificates-java

RUN git config --global url."https://github.com/".insteadOf git@github.com: && \
    git config --global url."https://".insteadgit Of git://

ENV PHP_TIMEZONE Europe/Berlin

# Install app:
# Configure Apache Document Root
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
