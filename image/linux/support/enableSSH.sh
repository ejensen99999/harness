#!/usr/bin/env bash

ssh="/home/harness/.ssh"

mkdir -p $ssh \
    && chown harness:harness $ssh \
    && chmod 700 $ssh \
    && ssh-keyscan -t rsa,ecdsa,ed25519 github.com >> /etc/ssh/ssh_known_hosts \
    && ssh-keyscan -t rsa ssh.dev.azure.com >> /etc/ssh/ssh_known_hosts
