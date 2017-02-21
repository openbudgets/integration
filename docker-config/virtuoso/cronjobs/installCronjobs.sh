#!/usr/bin/env bash

importFromTrig="0 */12 * * * /cronjobs/importFromTrig"
importFromTTL="45 */12 * * * /cronjobs/importFromTTL"
(crontab -u root -l; echo "$importFromTrig\n$importFromTTL" ) | crontab -u root -


