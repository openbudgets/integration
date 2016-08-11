#!/usr/bin/env bash
rm -rf /DAM
git clone https://github.com/openbudgets/DAM && \
    cd /DAM && \
    git checkout tiansi

cd / && \
    pip3 install --upgrade pip && \
    pip3 install virtualenv && \
    chmod a+rwx -R /DAM && \
    cd /DAM && \
    virtualenv -p python3 env && \
    . ./env/bin/activate && \
    pip3 install -r requirements.txt

/bin/sh /start.sh