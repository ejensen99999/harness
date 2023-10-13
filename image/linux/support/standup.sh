#!/usr/bin/env bash

apt update && apt upgrade -y \
&& apt install --no-install-recommends -y \
    apt-transport-https \
    ca-certificates \
    curl \
    dirmngr \
    gnupg \
    gpg-agent \
    rsync \
    software-properties-common \
    unzip \
    wget \
&& ln -snf /usr/share/zoneinfo/$(curl https://ipapi.co/timezone) /etc/localtime

REPO_ARGS1="$(curl https://packages.microsoft.com/config/ubuntu/20.04/mssql-server-2019.list)"
REPO_ARGS2="$(curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list)"
NODE_MAJOR=20

wget -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb \
    && dpkg -i packages-microsoft-prod.deb \
    && rm packages-microsoft-prod.deb

curl -L https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public |
    gpg --dearmor > /etc/apt/trusted.gpg.d/adoptopenjdk.gpg

curl -L https://packages.microsoft.com/keys/microsoft.asc |
    gpg --dearmor > /etc/apt/trusted.gpg.d/microsoft.gpg

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg |
    gpg --dearmor > /etc/apt/trusted.gpg.d/apt-key.gpg

curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key |
    gpg --dearmor > /etc/apt/trusted.gpg.d/nodesource.gpg

echo "deb [signed-by=/etc/apt/trusted.gpg.d/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" |
    tee /etc/apt/sources.list.d/nodesource.list

add-apt-repository -y ppa:deadsnakes/ppa
add-apt-repository -y ppa:ansible/ansible
add-apt-repository -y ppa:apt-fast/stable
add-apt-repository -y ppa:git-core/ppa
add-apt-repository -y "${REPO_ARGS1}"
add-apt-repository -y "${REPO_ARGS2}"
apt-add-repository -y "deb https://apt.kubernetes.io/ kubernetes-xenial main"

#curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -

apt update && apt upgrade -y \
&& apt install --no-install-recommends --allow-unauthenticated -y \
    build-essential \
    dnsutils \
    ftp \
    git \
    iproute2 \
    iputils-ping \
    jq \
    libyaml-dev \
    libunwind8 \
    locales \
    netcat \
    net-tools \
    nodejs \
    openssh-client \
    python3.8 \
    python3-pip \
    python3.8-venv \
    supervisor \
    sudo \
    telnet \
    time \
    tzdata \
    upx \
    zstd \
&& python3.8 -m pip install pipx \
&& python3.8 -m pipx ensurepath \
&& ln -sf /usr/bin/python3.8 /usr/bin/python \
&& ln -sf /usr/bin/pip3 /usr/bin/pip