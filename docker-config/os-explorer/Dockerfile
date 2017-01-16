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

RUN git clone http://github.com/openspending/os-explorer.git app
RUN cd /app && git checkout 4d1f2c51a67a08f50a988eb8f9061db9123f0648
RUN cd /app && npm install

COPY startup.sh /startup.sh
RUN chmod a+rwx /startup.sh

COPY nginx.conf /etc/nginx/nginx.conf
COPY mime.types /etc/nginx/mime.types
COPY default /etc/nginx/sites-enabled/default

EXPOSE 8000

CMD /startup.sh