FROM postgres:9.6.1

VOLUME /var/lib/postgresql/data

COPY ./schema.sql /docker-entrypoint-initdb.d/schema.sql

ENV POSTGRES_DB obeu_dam
#ENV POSTGRES_USER root
#POSTGRES_PASSWORD
