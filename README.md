## Dependencies

* Oracle VM **VirtualBox** *open-source hosted hypervisor*.  
<https://www.virtualbox.org/>

* **Vagrant** by HashiCorp *tool for building complete development environments*.  
<https://www.vagrantup.com/>

It is possible to install both with **Chocolatey** Package Manager for Windows.  
<https://chocolatey.org/docs/installation>

```shell
choco install virtualbox
choco install vagrant
```

## Spin up **Webstack** virtual machine

```shell
mkdir project
cd project
git clone https://github.com/szabacsik/webstack
cd webstack
vagrant up
```

## Start **docker** containers
* PHP
* MySQL
* phpMyAdmin
* Redis
* MailCatcher
* Portainer Container Management [Documentation](https://documentation.portainer.io/ "Portainer Documentation"), [Deployment](https://portainer.readthedocs.io/en/stable/deployment.html "Portainer Deployment")

```shell
vagrant ssh
cd /srv/infra
docker-compose up -d
```

## Access web interfaces

* Projects  
<http://192.168.100.100/>

* phpinfo  
<http://192.168.100.100/info/>

* demo  
<http://192.168.100.100/demo/>

* PHP 7.4.12 container  
<http://192.168.100.100:7412/>

* phpMyAdmin container  
<http://192.168.100.100:8080/>

* MailCatcher container  
<http://192.168.100.100:1080/>

* Portainer Container Management
<http://192.168.100.100:9000/>

## Debugging PHP Containers with XDebug

Start **DBGp Proxy Tool** on **Webstack** VM. It listens for container's debugger connections on the **port 9001**, and listens for developers' IDE on the **port 9000**.

```shell
/opt/dbgpProxy -i 0.0.0.0:9000 -s 0.0.0.0:9001
```

- **-i**: the host and the port to listen on for IDE (client) connections
- **-s**: the host and the port to listen on for debugger engine (server) connections

### Configure access to the DBGp proxy server from PhpStorm

In the main menu, select **Tools** | **DBGp Proxy** | **Configuration**.

In the **DBGP Proxy** dialog that opens, specify the  
IDE key: PHPSTORM  
host: 192.168.100.100  
port: 9000  
of the Xdebug proxy server.

In the main menu, click **Tools** | **DBGp Proxy** | **Register IDE**.

click Start Listening for PHP Debug Connections

<https://www.jetbrains.com/help/phpstorm/multiuser-debugging-via-xdebug-proxies.html>
<https://xdebug.org/docs/dbgpProxy>

### Debugging a **PHP CLI** script from the command line of a container

Start [Screen](https://www.gnu.org/software/screen/ "Screen") session
```shell
screen
```

Start **DBGp Proxy Tool** and start listening for debug connections in **PHPStorm**.  

Press **CTRL+a** than **c** to create a new **screen shell** window.  

Start **SSH Server** and log into the container. The root password is **PASSWORD**.  
```
docker exec -it -u0 php7412 /etc/init.d/ssh start
docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' php7412
ssh root@172.18.0.4
```

Go to your app and run a cli script
```shell
cd /var/www/html/demo
php index.php
```
