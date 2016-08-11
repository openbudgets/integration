#!/usr/bin/env bash

## Function declarations:

downloadDAM()
{
    rm -rf /DAM
    git clone https://github.com/openbudgets/DAM && \
        cd /DAM && \
        git checkout tiansi
}

updateDAM()
{
    cd /DAM && \
        git pull origin tiansi
}

startDAM()
{
     /bin/sh /start.sh
}

installDAM()
{
    cd /DAM && \
        pip3 install --upgrade pip && \
        pip3 install virtualenv && \
        chmod a+rwx -R /DAM && \
        virtualenv -p python3 env && \
        . ./env/bin/activate && \
        cd /DAM && \
        pip3 install -r requirements.txt && \
        startDAM
}

## Execute:

[ -f /DAM/app.py ] && echo "Update DAM-Repository" && updateDAM || ( echo "Download DAM-Repository" && downloadDAM )

[ -f /DAM/env/bin/activate ] && echo "Start DAM without Installation" && startDAM || ( echo "Install & Start DAM" && installDAM )