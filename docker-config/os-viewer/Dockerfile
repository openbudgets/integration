FROM node:7-alpine

RUN apk add --update git

RUN git config --global url."https://github.com/".insteadOf git@github.com: && \
    git config --global url."https://".insteadOf git://

RUN git clone http://github.com/openspending/os-viewer.git app && \
    cd /app && git checkout e67c1eba1df905ff40c8f5a29675816fe599be2e

COPY ./obeu_specific/template.html /app/app/front/scripts/directives/package-info/template.html
ADD settings.json /app/settings.json

RUN cd /app && npm install -g napa && napa eligrey/FileSaver.js:file-saver && napa d3/d3-plugins:d3-plugins
RUN cd /app && npm install && npm run build
ADD docker/settings.json /app/settings.json

EXPOSE 8000
ENV OS_VIEWER_BASE_PATH=viewer/

CMD API_URL="${OS_EXTERNAL_ADDRESS}" cd /app && npm start
