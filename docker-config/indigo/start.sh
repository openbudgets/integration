#!/usr/bin/env bash

updateApp() {
    echo "Updating Indigo application"
    cd /app
    git pull origin master
    npm install
    typings install
}

installApp() {
    echo "Installing Indigo application"
    git clone https://github.com/okgreece/indigo.git /app
    cd /app
    typings install
    npm install
}

startApp() {
    cd /app
    npm run start
}

if [ -e "/app/package.json" ]
then
    updateApp
else
    installApp
fi
startApp