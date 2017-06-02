FROM node:7-alpine

RUN apk add --update git

RUN git config --global url."https://github.com/".insteadOf git@github.com: && \
    git config --global url."https://".insteadOf git://

RUN git clone http://github.com/openspending/os-viewer.git app && \
    cd /app && git checkout 3823010f561ef100a27684be7d6d0ec720371f23

COPY ./obeu_specific/template.html /app/app/front/scripts/directives/package-info/template.html
ADD settings.json /app/settings.json

RUN cd /app && npm install -g napa && napa eligrey/FileSaver.js:file-saver && napa d3/d3-plugins:d3-plugins
RUN cd /app && npm install && npm run build
ADD /settings.json /app/settings.json

EXPOSE 8000
ENV OS_VIEWER_BASE_PATH=viewer/

COPY ./start.sh /start.sh
RUN chmod a+x /start.sh
CMD ["/bin/sh", "/start.sh"]
