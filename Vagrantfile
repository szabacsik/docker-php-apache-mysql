Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/bionic64"
    config.vm.box_check_update = true
    config.vm.provider "virtualbox"
    config.vm.network "private_network", ip: "192.168.100.100"
    config.vm.network "forwarded_port", guest: 80, host: 80, disabled: false
    config.vm.network "forwarded_port", guest: 22, host: 2222, disabled: false
    config.vm.hostname = "lamp"
    config.vm.define "lamp"
    config.vm.provider :virtualbox do |vb|
        vb.name = "lamp"
        vb.memory = 4096
        vb.cpus = 4
        vb.customize [ "modifyvm", :id, "--ioapic", "on" ]
    end
    config.vm.synced_folder ".", "/vagrant", disabled: true
    config.vm.provision :shell, inline: "ln -fs /usr/share/zoneinfo/Europe/Budapest /etc/localtime && dpkg-reconfigure --frontend noninteractive tzdata"
    config.vm.provision :shell, inline: "locale-gen en_US en_US.UTF-8 hu_HU hu_HU.UTF-8; export LANGUAGE=en_US.UTF-8; export LANG=en_US.UTF-8; export LC_ALL=en_US.UTF-8; update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8"
    config.vm.provision :shell, inline: "apt-get update; apt-get upgrade -y; apt-get dist-upgrade -y; apt-get clean; apt-get autoclean; apt-get autoremove -y"
    config.vm.provision :shell, inline: "apt-get install -y zip unzip mc", privileged: true
    config.vm.provision :shell, path: "./provisioning/install-apache.sh", privileged: true
    config.vm.provision :shell, path: "./provisioning/install-php.sh", privileged: true
    config.vm.provision :shell, path: "./provisioning/install-docker.sh", privileged: true
    config.vm.provision :shell, path: "./provisioning/install-composer.sh", privileged: true
    config.vm.provision :shell, path: "./provisioning/install-symfony.sh", privileged: true
    config.vm.provision :file, source: "./provisioning/99-xdebug.ini", destination: "/tmp/99-xdebug.ini"
    config.vm.provision :file, source: "./provisioning/99-xdebug-cli.ini", destination: "/tmp/99-xdebug-cli.ini"
    config.vm.provision :shell, path: "./provisioning/install-xdebug.sh", privileged: true
    config.vm.provision :shell, inline: "apt-get update; apt-get upgrade -y; apt-get dist-upgrade -y; apt-get clean; apt-get autoclean; apt-get autoremove -y"
    config.vm.provision :shell, inline: "mkdir ~/artifact/containers -p; mkdir ~/artifact/app; mkdir ~/artifact/db", privileged: false
    if File.exists?("./containers/docker-compose.yml")
        config.vm.provision :file, source: "./containers/docker-compose.yml", destination: "/home/vagrant/artifact/containers/docker-compose.yml"
    end
    if File.exists?("./containers/Dockerfile")
        config.vm.provision :file, source: "./containers/Dockerfile", destination: "/home/vagrant/artifact/containers/Dockerfile"
    end
    if File.exists?("./app/index.php")
        config.vm.provision :file, source: "./app/index.php", destination: "/home/vagrant/artifact/app/index.php"
    end
end