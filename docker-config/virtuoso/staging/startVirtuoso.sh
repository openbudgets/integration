#!/usr/bin/env bash

# Delay restart in case of errors:
sleep 2s

# Start Virtuoso server:
chmod a+x -R /etc/cron.*/
#cp /virtuoso.ini /usr/local/virtuoso-opensource/var/lib/virtuoso/db/virtuoso.ini


/bin/bash /virtuoso.sh
