FROM openbudgets/landingpage

RUN cd /var/www/LandingPage && git pull

RUN /etc/init.d/apache2 start

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
