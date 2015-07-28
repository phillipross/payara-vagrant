# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
   config.vm.box = "ubuntu/trusty64"
   
   config.vm.provider "virtualbox" do |vb|
     vb.memory = "1024"
   end
   
   config.vm.provision "shell", path: "provision.sh"
   config.vm.network :forwarded_port, guest: 4848, host: 4848
   config.vm.network :forwarded_port, guest: 8080, host: 8080

end
