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
    cd /app && \
    git checkout cutting-edge && \
    git checkout e0a810125b0fe51f10cebe288fe95651d2b3659f
WORKDIR /app

RUN cd /app && rm -rf node_modules dist && \
#    npm uninstall --save-dev angular-cli && \
#    npm install --save-dev @angular/cli && \
    npm install

# COPY config files:
#COPY ./index.html /app/src/index.html
#RUN rm /app/src/index.html
COPY ./environment.ts /app/src/environments/environment.ts
#COPY ./proxy.conf.json /app/proxy.conf.json

COPY ./start.sh /start.sh
RUN chmod a+x /start.sh
CMD ["/bin/sh", "/start.sh"]
