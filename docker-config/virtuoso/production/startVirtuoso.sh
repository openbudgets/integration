#!/usr/bin/env bash

chmod a+x -R /etc/cron.*/
# Install cronjob:
#(crontab -l 2>/dev/null; echo "* * * * * /cronjobs/syncTriplestores") | crontab -
echo "0 * * * * /cronjobs/syncTriplestores" > mycron
crontab mycron
rm mycron
# (crontab -l 2>/dev/null; echo "0 * * * * /cronjobs/syncTriplestores") | crontab -


cd / && find . -name "*virtuoso.trx*" | xargs -i rm "{}"
cd / && find . -name "*virtuoso.lck*" | xargs -i rm "{}"

# Start Virtuoso server:
#/usr/bin/supervisord
/bin/sh /virtuoso.sh

