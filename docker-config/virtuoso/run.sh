#!/usr/bin/env bash

echo "export DBA_PASSWORD=$DBA_PASSWORD" > /setEnv

/usr/bin/supervisord -c /etc/supervisord.conf