FROM nginx

RUN apt-get -y update
RUN apt-get install -y  wget curl telnet nmap apache2-utils

EXPOSE 37070

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./createPassword.sh /createPassword.sh