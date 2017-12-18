FROM python:3

RUN apt-get update -y && \
    apt-get install -y supervisor git

RUN git clone https://github.com/openbudgets/microsite /microsite && \
    cd /microsite && \
    git checkout 3c1eaa42bcd1870d3249f794511680caa89915a2

COPY ./supervisord.conf /etc/supervisord.conf
COPY ./start.sh /start.sh
COPY ./superuser.sh /superuser.sh

WORKDIR microsite
RUN pip install -r requirements.txt
RUN python manage.py makemigrations
RUN python manage.py migrate

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

