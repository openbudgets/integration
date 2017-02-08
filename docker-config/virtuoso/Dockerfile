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
    wget http://apache.mirror.digionline.de/jena/binaries/apache-jena-3.1.1.tar.gz && \
    gunzip /apache-jena-3.1.1.tar.gz && \
    tar -xvf /apache-jena-3.1.1.tar

ENV PATH="/apache-jena-3.1.1/bin:${PATH}"

COPY staging/supervisord.conf /etc/supervisord.conf
COPY ./staging/startVirtuoso.sh /startVirtuoso.sh
COPY ./run.sh /run.sh
CMD ["/bin/sh", "/run.sh"]