FROM php:7.0.7-alpine

# Install PHP 7:
RUN apk update && \
    apk add --update curl git

RUN git config --global url."https://github.com/".insteadOf git@github.com: && \
    git config --global url."https://".insteadOf git://

# Install Composer:
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Rudolf:
RUN git clone https://github.com/openbudgets/rudolf.git

# Run Composer:
RUN cd rudolf && composer install --no-scripts

# Copy config file:
COPY ./sparql.php /rudolf/config/sparql.php

# Ports:
EXPOSE 8890

#COPY ./start.sh /start.sh
#CMD ["/bin/sh", "/start.sh"]
