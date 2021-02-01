Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/focal64"
    config.vm.box_check_update = true
    config.vm.provider "virtualbox"
    config.vm.network "private_network", ip: "192.168.100.100"
    config.vm.network "forwarded_port", guest: 80, host: 80, disabled: false
    config.vm.network "forwarded_port", guest: 1080, host: 1080, disabled: false
    config.vm.network "forwarded_port", guest: 22, host: 2222, disabled: false
    config.vm.hostname = "webstack"
    config.vm.define "webstack"
    config.vm.provider :virtualbox do |vb|
        vb.name = "webstack"
        vb.memory = 4096
        vb.cpus = 4
        vb.customize [ "modifyvm", :id, "--ioapic", "on" ]
		vb.customize [ "modifyvm", :id, "--uart1", "0x3f8", "4" ]
		vb.customize [ "modifyvm", :id, "--uartmode1", "tcpserver", "2323" ]
    end
    config.vm.synced_folder ".", "/vagrant", disabled: true
    config.vm.provision :shell, path: "./provisioning/shell/common.sh"
    config.vm.provision :file, source: "./provisioning/file/99-xdebug.ini", destination: "/tmp/99-xdebug.ini"
    config.vm.provision :file, source: "./provisioning/file/99-xdebug-cli.ini", destination: "/tmp/99-xdebug-cli.ini"
    config.vm.provision :file, source: "./provisioning/file/99-php.ini", destination: "/tmp/99-php.ini"
    config.vm.provision :file, source: "./provisioning/file/99-php-cli.ini", destination: "/tmp/99-php-cli.ini"
    config.vm.provision :shell, path: "./provisioning/shell/install-apache.sh"
    config.vm.provision :shell, path: "./provisioning/shell/install-php.sh"
    config.vm.provision :shell, path: "./provisioning/shell/install-docker.sh"
    config.vm.provision :shell, path: "./provisioning/shell/install-composer.sh"
    config.vm.provision :shell, path: "./provisioning/shell/install-symfony.sh"
    config.vm.provision :shell, path: "./provisioning/shell/install-xdebug.sh"
    config.vm.provision :shell, path: "./provisioning/shell/install-codeception.sh"
    config.vm.provision :shell, path: "./provisioning/shell/install-phpunit.sh"
    config.vm.provision :shell, path: "./provisioning/shell/finalize.sh"
    config.vm.provision :file, source: "./infra/.", destination: "/srv/infra"
    config.vm.provision "environment-variables", type: "shell", path: "./provisioning/shell/environment-variables.sh"
    config.vm.provision "copy", before: "deploy", type: "file", run: "always", source: "./www", destination: "/tmp/www"
    config.vm.provision "deploy", after: "copy", type: "shell", run: "always", path: "./provisioning/shell/www-deploy.sh"
end