FROM ubuntu:trusty

# Install app dependencies:
RUN apt-get -y update
RUN apt-get install -y git build-essential python3-pip \
    python3-dev python-psycopg2 libpng12-dev \
    libxft-dev libfreetype6-dev \
    python-virtualenv bash sudo bash
RUN pip3 install --upgrade pip

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
            git checkout 237ef65d1c67cf05e65cf0a5bab56c0e923eeb60
WORKDIR $APP_DIR

# COPY environment vars:
COPY ./.env $APP_DIR/.env

# Install DAM:
RUN yes | make pre && \
    source ./env/bin/activate && \
    make dam

# Start DAM:
COPY ./runServer.sh /runServer.sh
CMD ["/bin/sh", "/runServer.sh"]
