FROM python:3

RUN git clone https://github.com/openbudgets/microsite

WORKDIR microsite
COPY start.sh .
RUN pip install -r requirements.txt
RUN python manage.py makemigrations
RUN python manage.py migrate
CMD ["/bin/sh", "start.sh"]
