#!/usr/bin/env bash

# install composer
curl -s https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
chmod +x /usr/local/bin/composer