#!/usr/bin/env bash

## Function declarations:

downloadDAM()
{
    echo "Downloading DAM-Git-Repository"
    rm -rf /DAM
    git clone https://github.com/openbudgets/DAM && \
        cd /DAM && \
        git checkout tiansi
}

updateDAM()
{
    echo "Updating DAM-Git-Repository"
    cd /DAM && \
        git pull origin tiansi
}

startDAM()
{
    echo "Starting DAM without Installation"
    /bin/sh /start.sh
}

installDAM()
{
    echo "Installing & Starting DAM"
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

[ -f /DAM/app.py ] && updateDAM || downloadDAM

[ -f /DAM/env/bin/activate ] && startDAM || installDAM