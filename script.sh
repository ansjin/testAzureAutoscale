#!/bin/sh
sudo apt-get remove docker docker-engine docker.io
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install -y docker-ce
sudo systemctl start docker.service
sudo apt-get update && apt-get install -y apt-transport-https
sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
sudo cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubernetes-cni
sudo swapoff -a
sudo free -m
sudo kubeadm reset
sudo rm -r $HOME/.kube/
sudo kubeadm join --token a42bb9.400e2d367b4ace48 10.0.0.4:6443 --discovery-token-ca-cert-hash sha256:9229ff3d30b68a22e4114987ebbb2f88555e200f37ff1c1c805904de6e39f839