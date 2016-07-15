#!/usr/bin/env bash
#write out current crontab
crontab -l > mycron
#echo new cron into cron file
CMD="sh $PWD/letsEncryptRenewCert.sh"
echo "@monthly $CMD" >> mycron
#install new cron file
crontab mycron
rm mycron