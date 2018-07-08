#!/bin/bash

echo "Updating packages..."
sudo apt-get update -qq

# install docker
echo "Installing Docker..."
sudo apt-get install -qy apt-transport-https curl git vim
curl -sSL https://get.docker.com | sh
sudo systemctl enable docker
sudo systemctl start docker

# add docker to group
sudo usermod -aG docker $(whoami)

echo "Preparing to install Kubernetes..."
# remove swap
sudo swapoff -a
sudo sed -i '/ swap / s/^/#/' /etc/fstab
sudo systemctl disable dphys-swapfile
sudo dphys-swapfile swapoff
sudo rm /var/swap
sudo chmod -x /etc/init.d/dphys-swapfile

# get source list for kubernetes
echo "Getting apt-key for Kubernetes..."
sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

echo "Creating source file..."
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF

# get latest packages
echo "Getting latest packages..."
sudo apt-get update -qq

# install kubernetes
echo "Installing Kubernetes..."
sudo apt-get install -qy kubelet kubeadm kubectl

echo "Setup Complete!\n\n"

echo "Remember to reboot your system now..."
