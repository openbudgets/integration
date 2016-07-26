FROM debian:jessie

# Install Python:
ENV PYTHON_VERSION 3.5.2
#ENV PYTHON_VERSION 3.6.0
RUN apt-get -y update
RUN apt-get install -y build-essential ca-certificates vim tar wget libssl-dev openssl
RUN wget https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz
RUN tar -xvzf Python-$PYTHON_VERSION.tgz && \
    rm Python-$PYTHON_VERSION.tgz
RUN cd Python-$PYTHON_VERSION && \
    ./configure && make && make install
RUN pip3 install --upgrade pip

# Install R:
RUN apt-get install -y r-base r-base-dev r-recommended

# Install app dependencies:
RUN apt-get install -y python3-dev python-psycopg2 libpng12-dev postgresql-server-dev-all libfreetype6-dev libxft-dev

# Create virtual environemnt:
RUN pip3 install virtualenv autoenv && \
    echo "source `which activate.sh`" >> ~/.bashrc && \
    virtualenv env

# Clone git-repo:
RUN apt-get install -y git
RUN git clone https://github.com/openbudgets/DAM && \
    cd DAM && \
    git checkout tiansi
WORKDIR DAM

# Installation:
ENV APP_SETTINGS "config.DevelopmentConfig"
ENV DATABASE_URL "postgresql://localhost/obeu_dam"
RUN pip3 install -r requirements.txt

#RUN apt-get install -y npm && npm install

EXPOSE 5000

CMD ["python3", "manage.py", "runserver"]