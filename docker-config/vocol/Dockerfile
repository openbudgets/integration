FROM lavdim/vocol:latest

COPY ./hosts /etc/hosts
RUN echo "ServerName localhost" >> /etc/apache2/httpd.conf

COPY ./start.sh /start.sh
CMD ["/bin/sh", "/start.sh"]