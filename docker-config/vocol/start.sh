#!/usr/bin/env bash
/usr/sbin/apache2ctl -D BACKGROUND
cd /home/vagrant
. .nvm/nvm.sh
/bin/sh ./resetVoCol.sh | tail -f