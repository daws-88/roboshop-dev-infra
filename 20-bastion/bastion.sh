#!/bin/bash

## ebs volume
sudo growpart /dev/nvme0n1 4
sudo lvextend -L +30G /dev/mapper/RootVG-homeVol
sudo xfs_growfs /home

## install terraform
sudo dnf install -y dnf-plugins-core
sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo dnf install terraform -y

## configure data base
cd /home/ec2-user
git clone https://github.com/daws-88/roboshop-devlopment-infra.git
chown -R ec2-user:ec2-user roboshop-devlopment-infra
cd roboshop-devlopment-infra
cd 40-databases
terraform init
terraform apply -auto-approve
