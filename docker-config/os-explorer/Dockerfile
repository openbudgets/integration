FROM sickp/alpine-nginx

RUN rm /etc/nginx/nginx.conf /etc/nginx/mime.types

RUN apk add --update nodejs git

RUN git config --global url."https://github.com/".insteadOf git@github.com: && \
    git config --global url."https://".insteadOf git://

RUN update-ca-certificates
RUN cd $(npm root -g)/npm \
 && npm install fs-extra \
 && sed -i -e s/graceful-fs/fs-extra/ -e s/fs\.rename/fs.move/ ./lib/utils/rename.js

RUN npm cache clean -f
RUN npm install npm@latest -g
RUN npm install -g n

# Set Log Level to info for debugging:
# npm config set loglevel info

RUN git clone http://github.com/openspending/os-explorer.git app && \
    cd /app && git checkout ca93011c77091d6805d9b6a8046b822d3281b92d
COPY ./config.js /app/config.js

RUN cd /app && npm install && npm run build
#RUN cd app && (find . -type f | grep -v /public/ | grep -v index.html | grep -v config.json | grep -v favicon.ico | tee | xargs rm) | true

RUN rm -rf /var/cache/apk/*

COPY startup.sh /startup.sh
RUN chmod a+rwx /startup.sh

COPY nginx.conf /etc/nginx/nginx.conf
COPY mime.types /etc/nginx/mime.types
COPY default /etc/nginx/sites-enabled/default

EXPOSE 8000

CMD ["/bin/sh", "/startup.sh"]