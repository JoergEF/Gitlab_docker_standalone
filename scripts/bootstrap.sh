#!/bin/bash
# apt im Noninteractive-Modus
export DEBIAN_FRONTEND=noninteractive
# allgemeine Updates
apt-get update
apt-get -y upgrade
# Installation der aktuellen Docker-CE
apt-get -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose
usermod -aG docker vagrant
systemctl enable docker
mkdir -p /srv/gitlab/{config,logs,data}
cp /vagrant/config/certs/* /srv/gitlab/config

