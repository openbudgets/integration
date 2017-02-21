#!/usr/bin/env bash

importFromTrig="0 */12 * * * /cronjobs/importFromTrig"
importFromTTL="15 */12 * * * /cronjobs/importFromTTL"
(crontab -u userhere -l; echo "$importFromTrig\n$importFromTTL" ) | crontab -u root -


