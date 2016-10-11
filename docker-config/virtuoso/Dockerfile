FROM openbudgets/virtuoso:7.2.4

# Install Supervisor:
RUN apt-get update && \
    apt-get install -y supervisor
COPY ./cronjobs /cronjobs
RUN chmod a+x -R /cronjobs

# Create graph files for Bonn-datasets:
COPY ./createGraphFilesForBonn.sh /createGraphFilesForBonn.sh

COPY staging/supervisord.conf /etc/supervisord.conf
COPY ./staging/startVirtuoso.sh /startVirtuoso.sh
COPY ./run.sh /run.sh
CMD ["/bin/sh", "/run.sh"]