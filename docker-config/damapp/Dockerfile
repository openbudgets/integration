FROM ubuntu:trusty

# Install app dependencies:
RUN sed -i'' 's/archive\.ubuntu\.com/us\.archive\.ubuntu\.com/' /etc/apt/sources.list
RUN apt-get -y update
RUN apt-get install -y sudo git build-essential python3-pip \
    python3-dev python-psycopg2 libpng12-dev \
    postgresql-server-dev-all libxft-dev libfreetype6-dev \
    python-virtualenv bash postgresql-client bash
RUN apt-get update && \
    apt-get install wget --fix-missing
RUN pip3 install --upgrade pip

#encoding related
ENV LANG C.UTF-8
#encoding related

# Switch from /bin/sh to /bin/bash:
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Frontend Port:
EXPOSE 5000

# Environment variables:
ENV APP_DIR "/dam"

# Clone DAM:
RUN git clone https://github.com/openbudgets/DAM $APP_DIR && \
            cd $APP_DIR && \
            git checkout staging_indigo && \
            git checkout 8a28a569e4fe034e4c9e6e343aae201c5e936b74
WORKDIR $APP_DIR

# COPY environment vars:
COPY ./.env $APP_DIR/.env

# Install DAM:
RUN apt-get update
RUN yes | make pre && \
    source ./env/bin/activate && \
    make dam

# Start DAM:
COPY ./runServer.sh /runServer.sh
CMD ["/bin/sh", "/runServer.sh"]
