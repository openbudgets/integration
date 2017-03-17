FROM continuumio/anaconda3:latest

RUN apt-get update
RUN apt-get install git

RUN git clone https://github.com/openbudgets/outlier_dm.git /app && \
    cd /app && git checkout 78ac53943c5f84f6da8cbddee318e404fe9db9d9

RUn cd /app/webapp && pip install -r requirements.txt

COPY ./start.sh /start.sh

CMD ["/bin/sh", "/start.sh"]




