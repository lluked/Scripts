#!/bin/bash
#
# Cisco DevNet Ubuntu Development Environment Install Script
# https://developer.cisco.com/learning/tracks/containers/containers-dev-env-setup/containers-dev-ubuntu/step/1
#
# Update and install packages
apt-get update && \
apt-get install \
    -y \
    -o APT::Install-Suggests=false \
    -o APT::Install-Recommends=false \
        build-essential \
        curl \
        git \
        libssl-dev \
        nodejs \
        npm \
        openconnect && \
        python3 \
        python3-pip \
        python3-virtualenv \
        snapd \
#
# Install snap packages
snap install atom --classic && \
snap install postman && \
#
# Install ngrok
cd /opt && \
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip && \
unzip ngrok-stable-linux-amd64.zip && \
mv ngrok /usr/local/bin && \
#
# Install chromium
curl -fsSL https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add - && \
add-apt-repository "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" && \
apt-get update && \
apt-get install google-chrome-stable && \
#
# Install docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && \
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
apt-get update && \
apt-get install \
    -y \
    -o APT::Install-Suggests=false \
    -o APT::Install-Recommends=false \
        apt-transport-https \
        ca-certificates \
        software-properties-common \
        docker-ce && \
#
# Update docker group
usermod -aG docker $USER