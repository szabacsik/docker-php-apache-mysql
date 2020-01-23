FROM php:7.4.1-apache-buster
RUN docker-php-ext-install pdo_mysql
WORKDIR /var/www