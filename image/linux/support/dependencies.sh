#!/bin/bash -e

curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository --yes "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt-get update
sudo apt-get install -y \
    ansible \
    ca-certificates \
    curl \
    kubectl \
    software-properties-common \
    packer=1.7.8

pip install requests-credssp

sudo wget -qO /usr/local/bin/yq https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64
sudo chmod a+x /usr/local/bin/yq        

wget https://github.com/instrumenta/kubeval/releases/latest/download/kubeval-linux-amd64.tar.gz
tar xf kubeval-linux-amd64.tar.gz
sudo cp kubeval /usr/local/bin

wget -q https://github.com/Azure/kubelogin/releases/download/v0.0.20/kubelogin-linux-amd64.zip
unzip kubelogin-linux-amd64.zip
sudo cp bin/linux_amd64/* /usr/local/bin

curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# echo "Running as user:"
# whoami

# echo "Where is ansible-playbook?"
# which ansible-playbook

sudo chmod 777 -R /home/runner/.ansible

# echo "What version is it?"
# ansible-playbook --version