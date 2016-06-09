FROM gliderlabs/alpine:3.3

RUN apk update && \
    apk add --update openjdk8 git nodejs wget tar supervisor
ENV JAVA_HOME /usr/lib/jvm/default-jvm

# Install Maven:
ENV MAVEN_VERSION="3.3.9"
ENV M2_HOME=/usr/lib/mvn
RUN wget http://apache.mirror.digionline.de/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz && \
    tar -zxvf apache-maven-$MAVEN_VERSION-bin.tar.gz && \
    rm apache-maven-$MAVEN_VERSION-bin.tar.gz && \
    mv apache-maven-$MAVEN_VERSION $M2_HOME
ENV PATH $PATH:$M2_HOME/bin

# Install LinkedPipes
RUN git clone https://github.com/linkedpipes/etl.git
RUN cd etl && mvn install
RUN chmod ug+rx /etl/deploy/executor.sh && \
    chmod ug+rx /etl/deploy/executor-monitor.sh && \
    chmod ug+rx /etl/deploy/frontend.sh
COPY ./configuration.properties /etl/deploy/configuration.properties

EXPOSE \
    # executor.webserver.port:
    8085 \
    # Webserver & URI dereferencable URI for pipelines + templates:
    8080 \
    # executor-monitor.webserver.port:
    8081 \
    # executor-monitor.ftp.port:
    2221 \
    # external.port.start port for external services like Fuseki:
    3300
    # supervisor frontend
    9001

COPY ./supervisord.conf /etc/supervisord.conf
CMD ["/usr/bin/supervisord"]
