#!/usr/bin/env bash

add-apt-repository ppa:ondrej/php
apt-get update

#Install PHP core
apt-get install -y php-common php-cli php-dev

#Install PHP extensions
apt-get install -y php-curl php-gd php-json php-mbstring php-zip php-mysql
