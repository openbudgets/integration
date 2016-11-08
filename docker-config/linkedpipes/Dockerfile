FROM gliderlabs/alpine:3.4

RUN apk update && \
    apk add --update git wget supervisor tar openjdk8 openssh nodejs
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
RUN git clone https://github.com/linkedpipes/etl.git /etl
RUN cd /etl && git checkout master
RUN cd /etl && mvn install
RUN chmod uag+rx /etl/deploy/executor.sh && \
    chmod uag+rx /etl/deploy/executor-monitor.sh && \
    chmod uag+rx /etl/deploy/frontend.sh
COPY ./configuration_update.properties /etl/deploy/configuration.properties

# Install FDP-to-RDF-component:
ENV URL_FDP2RDF_COMPONENT https://github.com/opendatacz/lp-etl-components/raw/master/t-fdpToRdf/deploy/t-fdpToRdf.zip
RUN cd /etl/deploy/jars && \
    wget $URL_FDP2RDF_COMPONENT && \
    unzip ./t-fdpToRdf.zip && \
    rm -rf ./t-fdpToRdf.zip

# Add Timezone:
RUN apk add tzdata && cp /usr/share/zoneinfo/Europe/Berlin /etc/localtime && \
    echo "Europe/Berlin" > /etc/timezone

EXPOSE \
    # executor.webserver.port:
    8085 \
    # Webserver & URI dereferencable URI for pipelines + templates:
    8080 \
    # executor-monitor.webserver.port:
    8081 \
    # executor-monitor.ftp.port (command):
    2221 \
    # ftp data ports:
    2223-2226 \
    # external.port.start port for external services like Fuseki:
    3300 \
    # supervisor frontend
    9001

COPY ./supervisord.conf /etc/supervisord.conf
COPY ./start.sh /start.sh
CMD ["/bin/sh", "/start.sh"]
#CMD ["/usr/bin/supervisord"]
