FROM continuumio/anaconda3:latest

RUN apt-get update
RUN apt-get install git

RUN git clone https://github.com/openbudgets/outlier_dm.git /app && \
    cd /app && git checkout c20622402e1cc6331eab3d55b9bf71fe9f17a4fd

RUn cd /app/webapp && pip install -r requirements.txt

COPY ./start.sh /start.sh

CMD ["/bin/sh", "/start.sh"]




