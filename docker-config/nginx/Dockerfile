FROM nginx:alpine

RUN apk update && \
    apk add --update wget curl nmap apache2-utils dnsmasq git alpine-sdk

# Add Timezone:
RUN apk add tzdata && cp /usr/share/zoneinfo/Europe/Berlin /etc/localtime && \
    echo "Europe/Berlin" > /etc/timezone

EXPOSE 80

COPY ./mime.types /etc/nginx/mime.types
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./createPassword.sh /createPassword.sh