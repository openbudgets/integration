FROM lavdim/vocol:latest

COPY ./hosts /etc/hosts
RUN echo "ServerName localhost" >> /etc/apache2/httpd.conf

COPY ./start.sh /start.sh
COPY ./resetVocol.sh /resetVocol.sh

CMD ["/bin/sh", "/start.sh"]