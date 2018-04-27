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
RUN git clone https://github.com/openbudgets/os-packager.git app && \
    cd /app && git checkout describe_from_file && \
    cd /app && git checkout 2dfe88ab683cbf718d68986cf9fbe9098766303d

COPY ./obeu_specific/styles.less /app/app/front/styles/styles.less

RUN cd app && npm install
RUN cd app && npm run build
RUN cd app && node node_modules/gulp/bin/gulp.js
RUN apk del build-dependencies
RUN rm -rf /var/cache/apk/*

ENV OS_PACKAGER_BASE_PATH=packager 

COPY ./settings.json /app/settings.json
COPY ./obeu_specific/header.html /app/app/views/partials/header.html
COPY ./obeu_specific/default.json /app/app/config/themes/default.json
COPY ./obeu_specific/footer.html /app/app/views/partials/footer.html
COPY ./obeu_specific/theme.css /app/app/views/partials/theme.css
COPY ./obeu_specific/openbudgets-logo.ico /app/app/public/favicon.ico
COPY ./startup.sh /startup.sh

EXPOSE 8000 

RUN chmod a+x /startup.sh
CMD /startup.sh
