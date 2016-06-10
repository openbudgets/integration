#!/usr/bin/env bash
# Execute with the nginx-container to setup a password for basic auth to jenkins, gitlab
# $1 = username
htpasswd -c /etc/nginx/.htpasswd $1