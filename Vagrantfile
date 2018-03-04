# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.define "mysql-vagrant-seeded"
  config.vm.network :forwarded_port, guest: 3306, host: 33060
  config.vm.provision :shell, :path => "install.sh"
  config.vm.provision "seed", type: "shell", :path => "seed.sh"
  config.vm.synced_folder ".", "/vagrant", :mount_options => ["dmode=777", "fmode=666"]
  config.vm.network "private_network", ip: "33.33.33.1", type: "dhcp", auto_config: false
end
