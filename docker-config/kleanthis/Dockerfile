FROM debian:jessie

RUN apt-get update && \
    apt-get install -y r-base r-base-dev

COPY install.R /install.R
Rscript /install.R