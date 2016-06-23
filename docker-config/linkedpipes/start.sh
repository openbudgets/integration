#!/usr/bin/env bash
mkdir -p /data/lp/etl/pipelines
mkdir -p /data/lp/etl/working
mkdir -p /data/lp/etl/log
mkdir -p /data/lp/etl/pipelines
mkdir -p /data/lp/etl/services
chmod -R oga+rwx /data
/usr/bin/supervisord