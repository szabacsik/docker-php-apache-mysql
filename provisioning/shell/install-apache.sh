#!/usr/bin/env bash
apt-get install -y apache2
a2enmod rewrite
chown www-data:www-data /var/www/html -R
usermod -aG www-data vagrant
usermod -aG vagrant www-data
chmod o-rwx /var/www/html -R
chmod ug+rwx /var/www/html -R
chmod g+s /var/www/html
rm -f /var/www/html/index.html