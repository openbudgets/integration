#!/usr/bin/env bash
# Install cronjob:
#(crontab -l 2>/dev/null; echo "* * * * * /cronjobs/syncTriplestores") | crontab -
(crontab -l 2>/dev/null; echo "0 * * * * /cronjobs/syncTriplestores") | crontab -

# Start Virtuoso server:
/bin/sh /virtuoso.sh