FROM node:7-alpine

RUN apk add --update git
RUN update-ca-certificates

RUN git config --global url."https://github.com/".insteadOf git@github.com: && \
    git config --global url."https://".insteadOf git://

RUN git clone http://github.com/openspending/os-explorer.git app && \
    cd /app && git checkout 4d1f2c51a67a08f50a988eb8f9061db9123f0648
COPY ./config.js /app/config.js

RUN cd app && npm install && npm run build
#RUN cd app && (find . -type f | grep -v /public/ | grep -v index.html | grep -v config.json | grep -v favicon.ico | tee | xargs rm) | true

RUN rm -rf /var/cache/apk/*

COPY startup.sh /startup.sh
RUN chmod a+x /startup.sh

EXPOSE 8000

CMD ["/bin/sh", "/startup.sh"]