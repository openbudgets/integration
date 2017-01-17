#!/usr/bin/env bash
# Needs to be executed in the directory where the script is stored
# write out current crontab
crontab -l > mycron
# echo new cron into cron file
CMD="cd $PWD && sh ./letsEncryptRenewCert.sh"
echo "@weekly $CMD" >> mycron
# install new cron file
crontab mycron
rm mycron