#!/usr/bin/env bash
yes | php artisan migrate --force
nohup php artisan db:seed --force > /dev/null 2>&1 &
nohup php artisan queue:listen --timeout=600 --sleep=30 > /dev/null 2>&1 &