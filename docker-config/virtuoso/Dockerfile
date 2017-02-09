FROM openbudgets/virtuoso:7.2.4

RUN apt-get update && \
    apt-get install -y supervisor wget gzip software-properties-common && \
    add-apt-repository ppa:openjdk-r/ppa && \
    apt-get update && \
    apt-get install -y openjdk-8-jre
COPY ./cronjobs /cronjobs
RUN chmod a+x -R /cronjobs

# Install Apache-Jena as a tool for Importing datasets
RUN cd / && \
    wget -O apache-jena.tar.gz ftp://ftp.fu-berlin.de/unix/www/apache/jena/binaries/apache-jena-3.2.0.tar.gz && \
    gunzip /apache-jena.tar.gz && \
    tar -xvf /apache-jena.tar

ENV PATH="/apache-jena/bin:${PATH}"

COPY ./50-default.conf /etc/rsyslog.d/50-default.conf
COPY staging/supervisord.conf /etc/supervisord.conf
COPY ./staging/startVirtuoso.sh /startVirtuoso.sh
COPY ./run.sh /run.sh
CMD ["/bin/sh", "/run.sh"]