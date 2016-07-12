#!/usr/bin/env bash
#write out current crontab
crontab -l > mycron
#echo new cron into cron file
CMD="sh $PWD/letsEncryptCertRenew.sh"
echo "@weekly $CMD" >> mycron
#install new cron file
crontab mycron
rm mycron