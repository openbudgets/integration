FROM python:3

RUN apt-get update -y && \
    apt-get install -y supervisor git

RUN git clone https://github.com/openbudgets/microsite
RUN cd /microsite && git pull origin master && git checkout d936d385f52af0cd452941286a9912aeca537267

COPY ./supervisord.conf /etc/supervisord.conf
COPY ./start.sh /start.sh
COPY ./superuser.sh /superuser.sh

WORKDIR microsite
RUN pip install -r requirements.txt
RUN python manage.py makemigrations
RUN python manage.py migrate

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

