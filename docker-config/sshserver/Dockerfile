FROM debian:jessie

RUN apt-get update -y && apt-get install -y openssh-server rsyslog && \
    systemctl enable ssh.socket

COPY ./sshd_config /etc/ssh/sshd_config

# Set root user password to 'root':
RUN echo "root:root" | chpasswd

EXPOSE 22

RUN service rsyslog start && service ssh start
COPY ./start.sh /start.sh

CMD ["/bin/sh", "/start.sh"]