FROM nginx:1.10.2-alpine

RUN apk update && \
    apk add --update curl wget apache2-utils nmap git alpine-sdk dnsmasq

# Add Timezone:
RUN apk add tzdata && cp /usr/share/zoneinfo/Europe/Berlin /etc/localtime && \
    echo "Europe/Athens" > /etc/timezones

EXPOSE 80

COPY ./conf/mime.types /etc/nginx/mime.types
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/includes /etc/nginx/includes

COPY ./createPassword.sh /createPassword.sh
COPY ./start.sh /start.sh

CMD ["/bin/sh", "/start.sh"]