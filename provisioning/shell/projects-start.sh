#!/usr/bin/env bash
rm -f /etc/apache2/sites-enabled/000-default.conf
mv /tmp/projects/apache.conf /etc/apache2/sites-enabled/apache.conf
rm -rf /var/www/html/demo
rm -rf /var/www/html/info
mv /tmp/projects/* /var/www/html
service apache2 restart