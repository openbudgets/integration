FROM gliderlabs/alpine:3.4 

RUN apk add --update python git nodejs
RUN apk add --update --virtual=build-dependencies ca-certificates build-base
RUN update-ca-certificates
RUN cd $(npm root -g)/npm \
 && npm install fs-extra -g \
 && sed -i -e s/graceful-fs/fs-extra/ -e s/fs\.rename/fs.move/ ./lib/utils/rename.js
RUN npm install npm@latest -g
RUN npm --version
RUN git clone http://github.com/openspending/os-packager.git app && \
    cd /app && git checkout 8cb647bd6c707f76dfdf40411be94ef48a7de644 

RUN cd app && npm update && rm -rf node_modules && npm install -g
RUN cd app && node node_modules/gulp/bin/gulp.js
RUN apk del build-dependencies
RUN rm -rf /var/cache/apk/*

ENV OS_PACKAGER_BASE_PATH=packager 

COPY ./settings.json /app/settings.json
COPY ./index.js /app/app/config/index.js
COPY ./header.html /app/app/views/partials/header.html
COPY ./startup.sh /startup.sh

EXPOSE 8000 

RUN chmod a+x /startup.sh
CMD /startup.sh
