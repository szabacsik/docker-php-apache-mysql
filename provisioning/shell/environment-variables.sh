#!/usr/bin/env bash
echo 'export MYSQL_HOST="127.0.0.1"' >> /etc/environment
echo 'export MYSQL_PORT="3306"' >> /etc/environment
echo 'export MYSQL_USER="root"' >> /etc/environment
echo 'export MYSQL_PASSWORD="PASSWORD"' >> /etc/environment
echo 'export MYSQL_HOST="127.0.0.1"' >> /etc/apache2/envvars
echo 'export MYSQL_PORT="3306"' >> /etc/apache2/envvars
echo 'export MYSQL_USER="root"' >> /etc/apache2/envvars
echo 'export MYSQL_PASSWORD="PASSWORD"' >> /etc/apache2/envvars
