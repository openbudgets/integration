FROM node:7.1

RUN apt-get -y update
RUN apt-get install -y npm git wget curl \
    zlib1g-dev libicu-dev g++ libmcrypt-dev
RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl

RUN npm install -g angular-cli

RUN git config --global url."https://github.com/".insteadOf git@github.com: && \
    git config --global url."https://".insteadOf git://

RUN git clone https://github.com/okgreece/indigo.git /app && \
    cd /app && git checkout bde1fa6000e399aa177219a7df7876dbdcd01891
WORKDIR /app

# COPY config files:
COPY ./index.html /app/src/index.html
# COPY ./tsconfig.json /app/tsconfig.json
COPY ./package.json /app/package.json
COPY ./environment.ts /app/src/environments/environment.ts

RUN npm install

RUN echo "ng serve --host 0.0.0.0" > /start.sh
#RUN echo "npm start" > /start.sh
CMD ["/bin/sh", "/start.sh"]