#!/usr/bin/env bash
cd /DAM && \
    . ./env/bin/activate && \
    python3 manage.py runserver --host 0.0.0.0