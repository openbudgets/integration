FROM python:3

RUN apt-get update -y && \
    apt-get install -y supervisor git

RUN git clone https://github.com/openbudgets/microsite
RUN cd /microsite && git pull origin master && git checkout 26d42fb0efc75a312b2f5a796d6813e01a3e603c

COPY ./supervisord.conf /etc/supervisord.conf
COPY ./start.sh /start.sh
COPY ./superuser.sh /superuser.sh

WORKDIR microsite
RUN pip install -r requirements.txt
RUN python manage.py makemigrations
RUN python manage.py migrate

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

