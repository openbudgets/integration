#!/usr/bin/env bash
# sshd start
rc-update add sshd

# Generate ssh-Host-Key:
# ssh-keygen -t rsa -N "" -f /etc/ssh/ssh_host_rsa_key