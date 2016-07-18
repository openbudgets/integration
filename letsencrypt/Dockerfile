# https://certbot.eff.org/#debianjessie-nginx
FROM debian:jessie

RUN echo "deb http://ftp2.de.debian.org/debian jessie-backports main" >> /etc/apt/sources.list && \
    apt-get update -y && \
    apt-get install -y git nginx gdebi && \
    apt-get install -y certbot -t jessie-backports

ENTRYPOINT ["certbot"]