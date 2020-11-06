#!/usr/bin/env bash

# Install Docker Engine
if ! command -v docker > /dev/null 2>&1; then
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh
    usermod -aG docker vagrant
else
    printf "\nDocker Engine is already installed.\n"
fi

# Install Docker Compose
if ! command -v docker-compose > /dev/null 2>&1; then
    apt install jq -y
    COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r '.tag_name')
    sh -c "curl -L https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose"
    chmod 755 /usr/local/bin/docker-compose
else
    printf "\nDocker Compose is already installed.\n"
fi

[ -f /home/vagrant/get-docker.sh ] && rm /home/vagrant/get-docker.sh