#!/usr/bin/env bash

importFromTrig="0 */12 * * * /cronjobs/importFromTrig"
(crontab -u userhere -l; echo "$importFromTrig" ) | crontab -u root -

importFromTTL="15 */12 * * * /cronjobs/importFromTTL"
(crontab -u userhere -l; echo "$importFromTTL" ) | crontab -u root -