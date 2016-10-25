#!/usr/bin/env bash
/usr/sbin/apache2ctl -D BACKGROUND
/bin/sh /home/vagrant/resetVoCol.sh | tail -f