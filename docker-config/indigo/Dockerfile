FROM debian:jessie

RUN apt-get -y update
RUN apt-get install -y nodejs nodejs-legacy npm curl wget git

RUN npm cache clean -f && \
    npm install npm@latest -g && \
    npm install -g n && \
    npm install -g typescript webpack && \
    npm install -g typings && \
    npm link typescript && \
    typings install dt~es6-promise dt~es6-collections --global --save

RUN git config --global url."https://github.com/".insteadOf git@github.com: && \
    git config --global url."https://".insteadOf git://

RUN git clone https://github.com/okgreece/indigo.git /app
COPY ./package.json /app/package.json
COPY ./main.browser.ts /app/src/main.browser.ts
RUN cd /app && npm install && \
    typings install && \
    typings install dt~core-js --save --global


COPY ./start.sh /start.sh
CMD ["/bin/sh", "/start.sh"]
