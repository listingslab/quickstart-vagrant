# -*- mode: ruby -*-
# vi: set ft=ruby :

# Change your project name here
PROJECT_NAME = "quickstart-vagrant"

Vagrant.configure("2") do |config|

    # Every Vagrant virtual environment requires a box to build from.
    config.vm.box = "ubuntu/trusty64"

    config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", "2048"]
    end

    # Private network which allows host-only access to the machine on a specific IP.
    config.vm.network :private_network, ip: "192.168.56.56"
    config.vm.host_name = "local." + PROJECT_NAME + ".dev"
    config.hostmanager.enabled = true
    config.hostmanager.manage_host = true
    config.hostmanager.ignore_private_ip = false
    config.hostmanager.include_offline = true

    config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", "2048"]
    end

    # Vagrant v1.1+ (http://jeremykendall.net/2013/08/09/vagrant-synced-folders-permissions/)
    config.vm.synced_folder "./magento", "/magento", id: "vagrant-root",
        owner: "vagrant",
        group: "www-data",
        mount_options: ["dmode=775,fmode=664"]

    config.vm.provision :shell, :path => "./provision/start.sh", :args => [PROJECT_NAME]

end
