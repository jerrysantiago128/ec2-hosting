#!/bin/bash
echo "update yum"
sudo yum -y update
echo "install peer dependneices"
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
echo "installing git, tmux, httpd, gcc, lynx, make"
sudo yum install -y git tmux httpd lynx gcc make
echo "starting HTTPD service"
sudo systemctl start httpd
echo "httpd started"
echo "adding Docker CE repo"
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
echo "install Docker"
sudo yum install -y docker
echo "enable and start docker"
sudo systemctl enable docker
sudo systemctl start docker
echo "add user to Docker group"
sudo usermod -aG docker $USER
sudo chmod 777 /var/run/docker.sock
echo "Dependency installation complete"

