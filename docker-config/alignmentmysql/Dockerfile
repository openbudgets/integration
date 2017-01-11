FROM mysql/mysql-server:5.7

COPY ./my.cnf /etc/my.cnf

# Initializing DB for granting access to clients from another Host (aka Docker container):
#COPY ./createInitSql.sh /createInitSql.sh
COPY ./init.sql /docker-entrypoint-initdb.d/init.sql

EXPOSE 3306