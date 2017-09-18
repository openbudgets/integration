#!/usr/bin/env bash
yes | php artisan migrate --seed --force
supervisord
supervisorctl reread
supervisorctl update
supervisorctl start laravel-listener:*
#nohup php artisan queue:listen --timeout=600 --sleep=10 --tries=5 > storage/logs/worker.log &
