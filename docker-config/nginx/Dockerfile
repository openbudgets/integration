FROM nginx:alpine

RUN apk update && \
    apk add --update wget curl nmap apache2-utils

#RUN apt-get -y update
#RUN apt-get install -y  wget curl telnet nmap apache2-utils

EXPOSE 80

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./createPassword.sh /createPassword.sh