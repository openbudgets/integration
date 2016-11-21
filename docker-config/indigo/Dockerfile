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
RUN cd /app && git checkout 3665b2b4d9ac915587496d7b59f3255eec57da3b
WORKDIR /app
RUN npm install

# COPY config files:
COPY ./index.html /app/src/index.html
COPY ./tsconfig.json /app/tsconfig.json
COPY ./environment.ts /app/src/environments/environment.ts

RUN echo "npm start" > /start.sh
CMD ["/bin/sh", "/start.sh"]