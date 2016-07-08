#!/usr/bin/env bash
#write out current crontab
crontab -l > mycron
#echo new cron into cron file
CMD="sh $PWD/requestCertificateProduction.sh"
echo "0 0 1 * * $PWD" >> mycron
#install new cron file
crontab mycron
rm mycron

