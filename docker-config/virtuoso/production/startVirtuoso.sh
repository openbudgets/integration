#!/usr/bin/env bash

chmod a+x -R /etc/cron.*/
# Install cronjob:
#(crontab -l 2>/dev/null; echo "* * * * * /cronjobs/syncTriplestores") | crontab -
echo "0 * * * * /cronjobs/syncTriplestores" > mycron
crontab mycron
rm mycron
# (crontab -l 2>/dev/null; echo "0 * * * * /cronjobs/syncTriplestores") | crontab -


# Start Virtuoso server:
#/bin/bash /virtuoso.sh
virtuoso-t +wait +foreground
