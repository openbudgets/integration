#!/usr/bin/env bash

echo "export DBA_PASSWORD=$DBA_PASSWORD" > /setEnv

nohup syslog-ng &
nohup cron &
nohup anacron &
/usr/bin/supervisord -c /etc/supervisord.conf