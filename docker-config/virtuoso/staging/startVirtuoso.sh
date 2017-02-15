#!/usr/bin/env bash

# Start Virtuoso server:
chmod a+x -R /etc/cron.*/
#cp /virtuoso.ini /usr/local/virtuoso-opensource/var/lib/virtuoso/db/virtuoso.ini
syslog-ng
anacron
cron

echo "export DBA_PASSWORD=$DBA_PASSWORD" > /setEnv

#/bin/bash /virtuoso.sh
virtuoso-t +wait +foreground
