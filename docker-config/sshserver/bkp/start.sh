#!/usr/bin/env bash
ufw enable && ufw allow 22
tail -f /var/log/messages