FROM debian:jessie

RUN apt-get -y update
RUN apt-get install -y nodejs nodejs-legacy npm curl wget git

RUN npm cache clean -f && \
    npm install npm@latest -g && \
    npm install -g n && \
    n 7.0.0

RUN git config --global url."https://github.com/".insteadOf git@github.com: && \
    git config --global url."https://".insteadOf git://

RUN git clone https://github.com/okgreece/indigo.git /app
WORkDIR /app
RUN npm install && npm build

RUN echo "npm start" > /start.sh
CMD ["/bin/sh", "/start.sh"]