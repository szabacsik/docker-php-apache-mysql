#!/usr/bin/env bash

mv /tmp/99-xdebug.ini /etc/php/8.0/apache2/conf.d/99-xdebug.ini
chown root:root /etc/php/8.0/apache2/conf.d/99-xdebug.ini
mv /tmp/99-xdebug-cli.ini /etc/php/8.0/cli/conf.d/99-xdebug-cli.ini
chown root:root /etc/php/8.0/cli/conf.d/99-xdebug-cli.ini

cd /tmp
git clone git://github.com/xdebug/xdebug.git
cd /tmp/xdebug
git checkout 3.0.4
phpize
./configure --enable-xdebug
make
make install

grep -qF 'xdebug.so' /etc/php/8.0/apache2/php.ini || echo -e "\n"zend_extension="$(php-config --extension-dir)/xdebug.so\n" | tee -a /etc/php/8.0/apache2/php.ini
grep -qF 'xdebug.so' /etc/php/8.0/cli/php.ini || echo -e "\n"zend_extension="$(php-config --extension-dir)/xdebug.so\n" | tee -a /etc/php/8.0/cli/php.ini

service apache2 restart