#!/usr/bin/env bash
# Install cronjob:
#(crontab -l 2>/dev/null; echo "* * * * * /cronjobs/syncTriplestores") | crontab -
echo "0 * * * * /cronjobs/syncTriplestores" > mycron
crontab mycron
rm mycron
# (crontab -l 2>/dev/null; echo "0 * * * * /cronjobs/syncTriplestores") | crontab -

#cp /virtuoso.ini /usr/local/virtuoso-opensource/var/lib/virtuoso/db/virtuoso.ini
cp /virtuoso.ini /data/virtuoso.ini

# Start Virtuoso server:
/bin/sh /virtuoso.sh