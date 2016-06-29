FROM gliderlabs/alpine:3.3

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

# Persist data of Fuseki server:
VOLUME /data
# Persist log files:
VOLUME $FUSEKI_HOME/run/logs

# Open default port of Fuseki:
EXPOSE 3030

COPY ./supervisord.conf /etc/supervisord.conf
COPY ./log4j.properties $FUSEKI_HOME/log4j.properties
COPY ./config.ttl /config.ttl
COPY ./start.sh /start.sh
COPY ./shiro.ini $FUSEKI_HOME/run/shiro.ini
CMD ["/usr/bin/supervisord"]
