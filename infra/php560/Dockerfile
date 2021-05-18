FROM php:5.6.0-apache
ARG DEBIAN_FRONTEND=noninteractive
ENV PHP_INI_SCAN_DIR=/etc/php
RUN mkdir /etc/php -p
COPY ./php.ini /etc/php
RUN a2enmod rewrite
RUN apt-get update
RUN apt-get -y --force-yes install sudo apt-utils
RUN cd /tmp && \
	git clone git://github.com/xdebug/xdebug.git && \
	cd /tmp/xdebug && \
	git checkout XDEBUG_2_5_5 && \
	phpize && \
	./configure --enable-xdebug && \
	make && \
	make install && \
	bash -c 'echo -e "\n"zend_extension="$(php-config --extension-dir)/xdebug.so\n" | sudo tee -a /etc/php/xdebug.ini'
RUN apt-get -y --force-yes install openssh-server && \
    sed -i "/PermitRootLogin/c\PermitRootLogin yes" /etc/ssh/sshd_config
    RUN echo 'root:PASSWORD' | chpasswd
WORKDIR /var/www