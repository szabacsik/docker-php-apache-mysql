#!/usr/bin/env bash
ln -fs /usr/share/zoneinfo/Europe/Budapest /etc/localtime
dpkg-reconfigure --frontend noninteractive tzdata
locale-gen en_US en_US.UTF-8 hu_HU hu_HU.UTF-8
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8
apt-get update
apt-get upgrade -y
apt-get dist-upgrade -y
apt-get install -y zip unzip mc mysql-client redis-tools
mkdir /home/vagrant/artifact/containers -p
mkdir /home/vagrant/artifact/db
chown vagrant:vagrant /home/vagrant/artifact -R
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
/etc/init.d/ssh restart
