#!/usr/bin/env bash

mkdir -p /etc/docker
mkdir -p /var/lib/docker

chown docker:docker -R /var/lib/docker
chmod 775 -R /var/lib/docker

if [ ! -f /etc/docker/daemon.json ]; then
  echo "{\"iptables\":false}" > /etc/docker/daemon.json
fi

if [ -n "${MTU}" ]; then
    jq ".\"mtu\" = ${MTU}" /etc/docker/daemon.json > /tmp/.daemon.json \
        && mv /tmp/.daemon.json /etc/docker/daemon.json

    echo "environment=DOCKERD_ROOTLESS_ROOTLESSKIT_MTU=${MTU}" >> /etc/supervisor/conf.d/dockerd.conf
fi

if [ -n "${DOCKER_REGISTRY_MIRROR}" ]; then
    jq ".\"registry-mirrors\"[0] = \"${DOCKER_REGISTRY_MIRROR}\"" /etc/docker/daemon.json > /tmp/.daemon.json \
        && mv /tmp/.daemon.json /etc/docker/daemon.json
fi