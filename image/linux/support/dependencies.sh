#!/bin/bash -e

curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
apt-add-repository --yes "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
add-apt-repository --yes --update ppa:ansible/ansible
apt-get update
apt-get install -y \
    ansible \
    ca-certificates \
    curl \
    software-properties-common

# echo "Running as user:"
# whoami

# echo "Where is ansible-playbook?"
# which ansible-playbook
user=$(whoami)

#sudo chmod 777 -R /home/$user/.ansible

# echo "What version is it?"
# ansible-playbook --version