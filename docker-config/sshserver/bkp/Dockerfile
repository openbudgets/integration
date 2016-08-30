FROM alpine:3.4

RUN apk add --update openssh rsyslog supervisor openrc

COPY ./sshd_config /etc/ssh/sshd_config
COPY ./supervisord.conf /etc/supervisord.conf

# Add Timezone:
RUN apk add tzdata && cp /usr/share/zoneinfo/Europe/Berlin /etc/localtime && \
    echo "Europe/Berlin" > /etc/timezone

# Generate ssh-Host-Key:
RUN ssh-keygen -t rsa -N "" -f /etc/ssh/ssh_host_rsa_key

# Set root user password to 'root':
RUN echo "root:root" | chpasswd

RUN rc-update add sshd

EXPOSE 22

COPY ./start.sh /start.sh
CMD ["/bin/sh", "/start.sh"]