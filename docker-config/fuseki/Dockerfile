FROM alpine:3.4

RUN apk update && \
    apk add --update openjdk8 wget tar supervisor python3

# Download Fuseki:
ENV FUSEKI_VERSION 2.4.1
ENV FUSEKI_HOME /usr/lib/fuseki
RUN wget http://mirror.dkd.de/apache/jena/binaries/apache-jena-fuseki-$FUSEKI_VERSION.tar.gz && \
    tar -zxvf apache-jena-fuseki-$FUSEKI_VERSION.tar.gz && \
    rm apache-jena-fuseki-$FUSEKI_VERSION.tar.gz && \
    mv apache-jena-fuseki-$FUSEKI_VERSION $FUSEKI_HOME

# Download Jena:
ENV JENA_VERSION 3.1.1
ENV JENA_HOME /usr/lib/jena
RUN wget http://mirror.dkd.de/apache/jena/binaries/apache-jena-$JENA_VERSION.tar.gz && \
    tar -zxvf apache-jena-$JENA_VERSION.tar.gz && \
    rm apache-jena-$JENA_VERSION.tar.gz && \
    mv apache-jena-$JENA_VERSION $JENA_HOME

ENV PATH $PATH:$FUSEKI_HOME/bin:$JENA_HOME/bin

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
# default start script
COPY ./staging/start.sh /start.sh
# testing script
COPY ./compareFolders.sh /compareFolders.sh
COPY ./cronjobs /cronjobs
RUN chmod -R a+x /cronjobs
# testing script
COPY ./testCronJob.sh /testCronJob.sh

CMD ["/usr/bin/supervisord"]
