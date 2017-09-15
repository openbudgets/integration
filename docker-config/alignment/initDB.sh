#!/usr/bin/env bash
yes | php artisan migrate --seed --force
nohup php artisan queue:listen --timeout=600 --sleep=30 --tries=5 > /dev/null 2>&1 &
