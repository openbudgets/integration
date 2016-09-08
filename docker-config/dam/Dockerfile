FROM debian:jessie

# Install Python:
ENV PYTHON_VERSION 3.5.2
#ENV PYTHON_VERSION 3.6.0
RUN apt-get -y update
RUN apt-get install -y git openssl build-essential vim ca-certificates tar wget libssl-dev libreadline-dev python-dev liblzma-dev cython gcc curl
RUN wget https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz
RUN tar -xvzf Python-$PYTHON_VERSION.tgz && \
    rm Python-$PYTHON_VERSION.tgz
RUN cd Python-$PYTHON_VERSION && \
    ./configure && make && make install
RUN pip3 install --upgrade pip

# Install R:
RUN apt-get install -y r-base r-base-dev r-recommended

# Install app dependencies:
RUN apt-get install -y python3-dev python-psycopg2 libpng12-dev postgresql-server-dev-all libxft-dev libfreetype6-dev virtualenv bash

# Frontend Port:
EXPOSE 5000

# Installation:
ENV APP_SETTINGS "config.DevelopmentConfig"
ENV DATABASE_URL "postgresql://localhost/obeu_dam"

COPY ./installAndStartDAM.sh /installAndStartDAM.sh
COPY ./start.sh /start.sh
RUN chmod a+rwx /installAndStartDAM.sh && chmod a+rwx /start.sh
CMD ["/bin/sh", "installAndStartDAM.sh"]
