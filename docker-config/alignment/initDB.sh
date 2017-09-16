#!/usr/bin/env bash
yes | php artisan migrate --seed --force
nohup php artisan queue:listen --timeout=600 --sleep=10 --tries=5 > storage/logs/worker.log &
