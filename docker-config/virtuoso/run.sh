#!/usr/bin/env bash

echo "export DBA_PASSWORD=$DBA_PASSWORD" > /setEnv

syslog-ng
cron
anacron
/usr/bin/supervisord -c /etc/supervisord.conf