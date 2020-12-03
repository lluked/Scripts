#!/bin/bash
#
# Cisco DevNet Ubuntu Development Environment Install Script
# https://developer.cisco.com/learning/tracks/containers/containers-dev-env-setup/containers-dev-ubuntu/step/1
#
# Update and install curl
apt-get update && \
apt-get install -y curl \
#
# Install chromium repo
curl -fsSL https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add - && \
add-apt-repository "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" && \
apt-get update && \
# Install docker repo
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && \
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
apt-get update && \
#
# Install apt packages
apt-get install \
    -y \
    -o APT::Install-Suggests=false \
    -o APT::Install-Recommends=false \
        apt-transport-https \
        build-essential \
        ca-certificates \
        software-properties-common \
        libssl-dev \
        git \
        npm \
        snapd \
        python3 \
        python3-pip \
        python3-virtualenv \
        nodejs \
        openconnect \
        google-chrome-stable \
        docker-ce && \
#
# Install snap packages
snap install atom --classic && \
snap install postman && \
snap install microk8s --classic && \
snap alias microk8s.kubectl kubectl
microk8s.kubectl config view --raw > $HOME/.kube/config
#
# Install ngrok
cd /opt && \
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip && \
unzip ngrok-stable-linux-amd64.zip && \
mv ngrok /usr/local/bin && \
#
# Update groups
usermod -aG docker $USER && \
newgrp docker && \
usermod -a -G microk8s $USER && \
newgrp microk8s