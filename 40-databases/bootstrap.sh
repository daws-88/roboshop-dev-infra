#!/bin/bash
component=$1
environment=$2
dnf install ansible -y 

# ansible-pull \
# -U https://github.com/daws-88/terraform-ansible.git \
# -i inventory.ini \
# -e component=$component \
# main.yaml

REPO_URL=https://github.com/daws-88/terraform-ansible.git
REPO_DIR=opt/roboshop/ansible
ANSIBLE_DIR=terraform-ansible

mkdir -p $REPO_DIR
mkdir -p /var/log/roboshop
touch ansible.log
cd $REPO_DIR

##  check if ansible repo is already closed or not
if [ -d $ANSIBLE_DIR]; then
    cd $ANSIBLE_DIR
    git pull
else
    git clone $REPO_URL
    cd $ANSIBLE_DIR
fi

ansible-playbook -e component=$component -e env=$environment main.yaml


