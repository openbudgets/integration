FROM continuumio/anaconda3:latest

RUN apt-get update
RUN apt-get install git

RUN git clone https://github.com/openbudgets/outlier_dm.git /app && \
    git checkout 550f6d903596264dbfbda30b10df47a7c99c4833

RUn cd /app/webapp && pip install -r requirements.txt

COPY ./start.sh /start.sh

CMD ["/bin/sh", "/start.sh"]




