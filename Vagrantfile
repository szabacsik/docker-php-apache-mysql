Vagrant.configure("2") do |config|
    config.vm.box = "szabacsik/ubuntu"
    config.vm.provider "virtualbox"
    config.vm.network "private_network", ip: "192.168.100.100"
    config.vm.hostname = "lamp"
    config.vm.define "lamp"
    config.vm.provider :virtualbox do |vb|
        vb.name = "lamp"
        vb.memory = 4096
        vb.cpus = 4
        vb.customize [ "modifyvm", :id, "--ioapic", "on" ]
    end
    config.vm.synced_folder ".", "/vagrant", type: "rsync", disabled: false
    config.ssh.username="worker"
    config.ssh.password="worker"
end