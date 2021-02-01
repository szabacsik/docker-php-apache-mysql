#!/usr/bin/env bash
apt-get install -y apache2
a2enmod rewrite
chown www-data:www-data /srv/www -R
usermod -aG www-data vagrant
usermod -aG vagrant www-data
chmod o-rwx /srv/www -R
chmod ug+rwx /srv/www -R
chmod g+s /srv/www
rm -rf /var/www/html