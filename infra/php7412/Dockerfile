FROM php:7.4.12-apache-buster
RUN docker-php-ext-install pdo_mysql
RUN a2enmod rewrite
RUN pecl install -f xdebug && \
    docker-php-ext-enable xdebug && \
    echo "xdebug.start_with_request=yes" >> /usr/local/etc/php/conf.d/xdebug.ini && \
    echo "xdebug.mode=debug" >> /usr/local/etc/php/conf.d/xdebug.ini && \
    echo "xdebug.log=/var/www/xdebug/xdebug.log" >> /usr/local/etc/php/conf.d/xdebug.ini && \
    echo "xdebug.client_port=9001" >> /usr/local/etc/php/conf.d/xdebug.ini && \
    echo "xdebug.client_host=172.18.0.1" >> /usr/local/etc/php/conf.d/xdebug.ini && \
    echo "xdebug.idekey=PHPSTORM" >> /usr/local/etc/php/conf.d/xdebug.ini
RUN apt-get update && \
    apt-get -y install openssh-server && \
    sed -i "/PermitRootLogin/c\PermitRootLogin yes" /etc/ssh/sshd_config
    RUN echo 'root:PASSWORD' | chpasswd
WORKDIR /var/www