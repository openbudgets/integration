FROM alpine:3.4

COPY ./sshd_config /etc/ssh/sshd_config

RUN apk add --update openssh

# Add Timezone:
RUN apk add tzdata && cp /usr/share/zoneinfo/Europe/Berlin /etc/localtime && \
    echo "Europe/Berlin" > /etc/timezone

# Generate ssh-Host-Key:
RUN ssh-keygen -t rsa -N "" -f /etc/ssh/ssh_host_rsa_key

# Set root user password to 'root':
RUN echo "root:root" | chpasswd

EXPOSE 22

#COPY ./start.sh /start
CMD ["/usr/sbin/sshd","-D"]