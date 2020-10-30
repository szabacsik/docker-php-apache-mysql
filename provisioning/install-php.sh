#!/usr/bin/env bash

add-apt-repository ppa:ondrej/php
apt-get update

#Install PHP core
apt-get install -y php php-dev libapache2-mod-php

#Install PHP extensions
apt-get install -y php-curl php-gd php-json php-mbstring php-zip php-mysql php-intl php-bcmath

#Install Redis extension
apt-get install -y --no-install-recommends php-igbinary php-redis

#Install PostgreSQL module for PHP
apt-get install -y php-pgsql

#Install AMQP extension for PHP
apt-get install -y php-amqp

#Install SOAP extension for PHP
apt-get install -y php-soap