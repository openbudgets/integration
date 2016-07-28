#!/usr/bin/env bash
chmod -R uga+rwx /var/log
#/usr/bin/supervisord
/bin/sh /etc/init.d/rsyslog start && /usr/sbin/sshd -D