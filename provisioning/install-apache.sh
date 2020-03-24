#!/usr/bin/env bash

apt-get install -y apache2
a2enmod rewrite
apt-get install -y libapache2-mod-php

grep -qxF '<Directory "/var/www/html">' /etc/apache2/sites-enabled/000-default.conf || echo '<Directory "/var/www/html">' >> /etc/apache2/sites-enabled/000-default.conf
grep -qxF 'Allowoverride all' /etc/apache2/sites-enabled/000-default.conf || echo 'Allowoverride all' >> /etc/apache2/sites-enabled/000-default.conf
grep -qxF '</Directory>' /etc/apache2/sites-enabled/000-default.conf || echo '</Directory>' >> /etc/apache2/sites-enabled/000-default.conf

if [ ! -e /var/www/html/.htaccess ]; then
   echo 'RewriteEngine on' > /var/www/html/.htaccess
   echo 'RewriteCond %{REQUEST_FILENAME} !-f' >> /var/www/html/.htaccess
   echo 'RewriteCond %{REQUEST_FILENAME} !-d' >> /var/www/html/.htaccess
   echo 'RewriteRule ^(.*)$ /index.php?path=$1 [NC,L,QSA]' >> /var/www/html/.htaccess
fi

if [ ! -e /var/www/html/index.php ]; then
   echo '<?php phpinfo();' > /var/www/html/index.php
fi

chown www-data:www-data /var/www/html -R
usermod -aG www-data vagrant
chmod g+w /var/www/html

service apache2 restart