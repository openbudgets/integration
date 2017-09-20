#!/usr/bin/env bash
cd /microsite

rsync --ignore-existing

python manage.py runserver 0.0.0.0:8000