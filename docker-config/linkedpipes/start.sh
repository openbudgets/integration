#!/usr/bin/env bash
cd /etl/deploy
/bin/sh ./executor.sh >> executor.log &
/bin/sh ./executor-monitor.sh >> executor-monitor.log &
/bin/sh ./frontend.sh >> frontend.log &