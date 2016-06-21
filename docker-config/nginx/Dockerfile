FROM nginx:alpine

RUN apk update && \
    apk add --update wget curl nmap apache2-utils dnsmasq git alpine-sdk

EXPOSE 80

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./createPassword.sh /createPassword.sh