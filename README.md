# docker-php-apache-mysql
Separate containers for PHP, Apache, Mysql and phpMyAdmin with Docker Compose and Vagrant

```
vagrant up
vagrant ssh
cd ~/artifact/containers/
docker-compose up -d
docker-compose stop
```

phpinfo
<http://192.168.100.100/>

phpmyadmin
<http://192.168.100.100:8080/>

# SSH private_key 
If you type `vagrant ssh-config` it'll show you the location of the vagrant's ssh key. If you remove the key, Vagrant will automatically generate a new one when you run `vagrant up`.  