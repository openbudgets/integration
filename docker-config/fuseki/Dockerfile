FROM alpine:3.4

RUN apk update && \
    apk add --update openjdk8 wget tar supervisor

# Download Fuseki:
ENV FUSEKI_VERSION 2.4.0
ENV FUSEKI_HOME /usr/lib/fuseki
RUN wget http://ftp.halifax.rwth-aachen.de/apache/jena/binaries/apache-jena-fuseki-$FUSEKI_VERSION.tar.gz && \
    tar -zxvf apache-jena-fuseki-$FUSEKI_VERSION.tar.gz && \
    rm apache-jena-fuseki-$FUSEKI_VERSION.tar.gz && \
    mv apache-jena-fuseki-$FUSEKI_VERSION $FUSEKI_HOME
ENV PATH $PATH:FUSEKI_HOME/bin

# Add Timezone:
RUN apk add tzdata && cp /usr/share/zoneinfo/Europe/Berlin /etc/localtime && \
    echo "Europe/Berlin" > /etc/timezone

# Persist data of Fuseki server:
VOLUME /data
# Persist log files:
VOLUME $FUSEKI_HOME/run/logs

# Open default port of Fuseki:
EXPOSE 3030

COPY ./supervisord.conf /etc/supervisord.conf
COPY ./log4j.properties $FUSEKI_HOME/log4j.properties
COPY ./config.ttl /config.ttl
COPY ./shiro.ini $FUSEKI_HOME/run/shiro.ini

# Sync Folders as cronjob:
COPY ./staging/start.sh /start.sh # default start script
COPY ./compareFolders.sh /compareFolders.sh # testing script
COPY ./syncTriplestores /syncTriplestores
RUN chmod a+x /syncTriplestores
COPY ./testCronJob.sh /testCronJob.sh # testing script

CMD ["/usr/bin/supervisord"]
