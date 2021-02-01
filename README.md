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

* PHP container (demo)  
<http://192.168.100.100:8000/>

* phpMyAdmin container  
<http://192.168.100.100:8080/>

* MailCatcher container  
<http://192.168.100.100:1080/>