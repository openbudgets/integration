#!/usr/bin/env bash
# Execute this script first in order to install a cronjob for renewing the TLS-certificate
# Needs to be executed from the folder where the script is placed in order to work correctly
crontab -l > mycron
# echo new cron into cron file
CMD="cd $PWD && sh ./letsEncryptRenewCert.sh"
echo "@weekly $CMD" >> mycron
# install new cron file
crontab mycron
rm mycron