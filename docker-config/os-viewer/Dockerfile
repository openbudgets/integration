FROM alpine:3.4

RUN apk add --update nodejs python git curl tar
RUN apk add --update --virtual=build-dependencies build-base ca-certificates
RUN update-ca-certificates
RUN git clone http://github.com/openspending/os-viewer.git app
#RUN git clone https://github.com/openbudgets/os-viewer.git app

RUN git config --global url."https://github.com/".insteadOf git@github.com: && \
    git config --global url."https://".insteadOf git://

RUN curl https://www.npmjs.com/install.sh | sh
RUN npm --version
RUN cd app && npm install -g napa && napa eligrey/FileSaver.js:file-saver
RUN cd app && npm install
RUN cd app && node node_modules/gulp/bin/gulp.js
RUN apk del build-dependencies
RUN rm -rf /var/cache/apk/*

ENV OS_VIEWER_BASE_PATH=viewer/

ADD settings.json /app/settings.json
COPY ./index.js /app/app/config/index.js

EXPOSE 8000

WORKDIR /app
CMD ["npm", "start"]
