FROM node:7.1

RUN apt-get -y update
RUN apt-get install -y npm git wget curl

RUN npm install -g angular-cli

RUN git config --global url."https://github.com/".insteadOf git@github.com: && \
    git config --global url."https://".insteadOf git://

RUN git clone https://github.com/okgreece/indigo.git /app && \
    cd /app && git checkout 64e378e46d1393f731c32ca6152cebaed509a81c
WORKDIR /app

# COPY config files:
COPY ./index.html /app/src/index.html
# COPY ./tsconfig.json /app/tsconfig.json
COPY ./package.json /app/package.json
COPY ./environment.ts /app/src/environments/environment.ts

RUN npm install

COPY ./start.sh /start.sh
CMD ["/bin/sh", "/start.sh"]