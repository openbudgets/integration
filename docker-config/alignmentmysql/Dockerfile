FROM mysql/mysql-server:5.7

COPY ./my.cnf /etc/my.cnf
COPY ./init.sql /docker-entrypoint-initdb.d/init.sql

EXPOSE 3306