FROM openbudgets/virtuoso:7.2.4

# Configure Virtuoso:
COPY ./virtuoso.ini /usr/local/virtuoso-opensource/var/lib/virtuoso/db/virtuoso.ini

# Install Supervisor:
RUN apt-get update && \
    apt-get install -y supervisor
COPY ./cronjobs /cronjobs
RUN chmod a+x -R /cronjobs

COPY staging/supervisord.conf /etc/supervisord.conf
COPY ./staging/startVirtuoso.sh /startVirtuoso.sh
COPY ./run.sh /run.sh
CMD ["/bin/sh", "/run.sh"]