#!/usr/bin/env bash

add-apt-repository ppa:ondrej/php
apt-get update

#Install PHP core
apt-get install -y php php-dev libapache2-mod-php

#Install PHP extensions
apt-get install -y php-curl php-gd php-json php-mbstring php-zip php-mysql
