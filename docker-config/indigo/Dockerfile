FROM node:8.2


#RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62 \
#  && echo "deb http://nginx.org/packages/debian/ jessie nginx" >> /etc/apt/sources.list \
RUN apt-get update \
  && apt-get install -y nginx gettext-base \
  && rm -rf /var/lib/apt/lists/*

# maps /var/www to /usr/share/nginx/html
RUN ln -sf /usr/share/nginx/html /var/www

# forward request and error logs to docker log collector
#RUN ln -sf /dev/stdout /var/log/nginx/access.log \
#  && ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80 


# Add Timezone:
RUN apt-get -y install tzdata && cp /usr/share/zoneinfo/Europe/Berlin /etc/localtime && \
    echo "Europe/Berlin" > /etc/timezones


COPY ./conf/mime.types /etc/nginx/mime.types
COPY ./conf/nginx.conf /etc/nginx/nginx.conf


RUN apt-get -y update
RUN apt-get update &&  apt-get install -y npm git wget curl

RUN chown -R node:node /usr/local/lib/node_modules
RUN chown -R node:node /usr/local/bin

USER node


RUN npm uninstall -g angular-cli
RUN npm uninstall -g @angular/cli

RUN npm install -g @angular/cli@latest

RUN git config --global url."https://github.com/".insteadOf git@github.com: && \
    git config --global url."https://".insteadOf git://

USER root

RUN git clone https://github.com/okgreece/indigo.git /app && \
    cd /app && \
    git checkout cutting-edge && \
    git checkout 8f9fe9b06d98686eb1d634c7bd986e09de21850e

RUN cd /app && rm -rf node_modules dist &&  npm install

#COPY ./layout.ts /app/src/app/components/layout.ts

COPY ./environment.ts /app/src/environments/environment.ts

COPY ./environment.ts /app/src/environments/environment.prod.ts


RUN cd /app &&  ng build --prod --aot

RUN cp -R  /app/dist/* /usr/share/nginx/html


COPY ./start.sh /start.sh

CMD ["/bin/sh", "/start.sh"]
