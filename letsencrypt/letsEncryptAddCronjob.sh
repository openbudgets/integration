#!/usr/bin/env bash

chmod +x ./*

rsync -a ./letsEncryptRenewCert /etc/cron.daily/.