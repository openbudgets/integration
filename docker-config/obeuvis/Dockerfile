FROM gliderlabs/alpine:3.4 

RUN apk add --update python git nodejs
RUN apk add --update --virtual=build-dependencies ca-certificates build-base
RUN update-ca-certificates
RUN cd $(npm root -g)/npm \
 && npm install fs-extra \
 && sed -i -e s/graceful-fs/fs-extra/ -e s/fs\.rename/fs.move/ ./lib/utils/rename.js
RUN npm install npm@latest -g
RUN npm --version
RUN git config --global url.https://github.com/.insteadOf git://github.com/
RUN git clone https://github.com/openbudgets/budget-vis.git app && \
    cd /app && git checkout master && \
    cd /app && git checkout bd6ba619f03e28c448a349e2a0f180852851a741
RUN cd /app && npm install
RUN cd /app && npm run build

EXPOSE 4000

ADD ./startServer.sh /startServer.sh
RUN chmod a+x /startServer.sh
CMD /bin/sh /startServer.sh
