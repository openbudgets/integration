#!/usr/bin/env bash
# Execute with the nginx-container to setup a password for basic auth to jenkins, gitlab
# $1 = username
htpasswd -b -c /etc/nginx/.htpasswd $NGINX_BASIC_AUTH_USER $NGINX_BASIC_AUTH_PW