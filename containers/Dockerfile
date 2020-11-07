FROM php:7.4.12-apache-buster
RUN docker-php-ext-install pdo_mysql
RUN a2enmod rewrite
WORKDIR /var/www