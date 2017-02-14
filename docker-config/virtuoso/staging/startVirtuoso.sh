#!/usr/bin/env bash
# Start Virtuoso server:
chmod a+x -R /etc/cron.*/
#cp /virtuoso.ini /usr/local/virtuoso-opensource/var/lib/virtuoso/db/virtuoso.ini


/bin/bash /virtuoso.sh

# Delay restart in cas of errors:
sleep 5s