FROM tenforce/virtuoso:1.3.1-virtuoso7.2.4

RUN apt-get update && \
    apt-get install -y supervisor wget gzip software-properties-common && \
    add-apt-repository ppa:openjdk-r/ppa && \
    apt-get update && \
    apt-get install -y openjdk-8-jre anacron
RUN apt-get remove -y rsyslog && apt-get install -y syslog-ng
RUN apt-get upgrade -y

# Install Apache-Jena as a tool for Importing datasets
RUN cd / && \
    wget -O apache-jena.tar.gz https://archive.apache.org/dist/jena/binaries/apache-jena-3.2.0.tar.gz && \
    gunzip /apache-jena.tar.gz && \
    mkdir -p /apache-jena && tar -xvf /apache-jena.tar -C /apache-jena --strip-components=1

ENV PATH="/apache-jena/bin:${PATH}"


COPY ./cronjobs /cronjobs
RUN chmod a+x -R /cronjobs
COPY ./syslog-ng.conf /etc/syslog-ng/syslog-ng.conf
COPY ./syslog-ng /etc/default/syslog-ng

COPY ./staging/startVirtuoso.sh /startVirtuoso.sh
CMD ["/bin/sh", "/startVirtuoso.sh"]
