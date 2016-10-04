#!/usr/bin/env bash
# Install cronjob:
#(crontab -l 2>/dev/null; echo "* * * * * /cronjobs/syncTriplestores") | crontab -
(crontab -l 2>/dev/null; echo "@hourly /cronjobs/syncTriplestores") | crontab -

service cron start

# Start Virtuoso server:
/bin/sh /virtuoso.sh