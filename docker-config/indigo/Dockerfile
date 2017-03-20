FROM node:7.1

RUN apt-get -y update
RUN apt-get install -y npm git wget curl

RUN npm install -g @angular/cli@latest

RUN git config --global url."https://github.com/".insteadOf git@github.com: && \
    git config --global url."https://".insteadOf git://

RUN git clone https://github.com/okgreece/indigo.git /app && \
    cd /app && git checkout bde1fa6000e399aa177219a7df7876dbdcd01891
WORKDIR /app

RUN cd /app && npm install --save-dev @angular/cli@latest && npm i webpack --save-dev

# COPY config files:
#COPY ./index.html /app/src/index.html
COPY ./environment.ts /app/src/environments/environment.ts
COPY ./angular-cli.json /app/angular-cli.json

RUN npm install

Run npm install --save-dev @angular/cli@latest

COPY ./start.sh /start.sh
CMD ["/bin/sh", "/start.sh"]