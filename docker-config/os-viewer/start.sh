#!/usr/bin/env bash
cp -ar /config/* /app/app/config/.

CMD API_URL="${OS_EXTERNAL_ADDRESS}" cd /app && npm start