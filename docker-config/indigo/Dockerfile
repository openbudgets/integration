FROM node:7.1

RUN apt-get -y update
RUN apt-get install -y npm git wget curl

RUN npm uninstall -g angular-cli
RUN npm uninstall -g @angular/cli
RUN npm cache clean
RUN npm install -g @angular/cli@latest

RUN git config --global url."https://github.com/".insteadOf git@github.com: && \
    git config --global url."https://".insteadOf git://

RUN git clone https://github.com/okgreece/indigo.git /app && \
    cd /app && git checkout 0cfab1de27ce8d4aee53f284fccc51202cb7d8e5 
WORKDIR /app

RUN cd /app && rm -rf node_modules dist && \
    npm uninstall --save-dev angular-cli && \
    npm install --save-dev @angular/cli && \
    npm install

# COPY config files:
COPY ./index.html /app/src/index.html
#RUN rm /app/src/index.html
COPY ./environment.ts /app/src/environments/environment.ts
COPY ./angular-cli.json /app/angular-cli.json

COPY ./start.sh /start.sh
RUN chmod a+x /start.sh
CMD ["/bin/sh", "/start.sh"]
