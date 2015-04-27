# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/trusty64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
   config.vm.provider "virtualbox" do |vb|
     # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  
     # Customize the amount of memory on the VM:
     vb.memory = "4096"
   end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  #

  # The below wget gets Payara 4.1.151 Full profile. The list of links for 
  # Payara 4.1.151 are:
  #     Full....................http://bit.ly/1CGCtI9
  #     Web.....................http://bit.ly/1DmWTUY
  #     Minimal.................http://bit.ly/163XP6f
  #     Embedded Full...........http://bit.ly/1zG59ls
  #     Embedded Web............http://bit.ly/1KdVP87
  #     Embedded Nucleus........http://bit.ly/1ydQTKw
  #     Multi-language Full.....https://bit.ly/1zv1YeB
  #     Multi-language Web......https://bit.ly/1wVXaZR
  #
  #
   config.vm.provision "shell", inline: <<-SHELL
     sudo apt-get -y update                        # Update the repos
     sudo apt-get -y install openjdk-7-jdk         # Install JDK 7
     sudo apt-get -y install unzip                 # Install unzip
     wget http://bit.ly/1CGCtI9 -O temp.zip        # Download Payara
     sudo mkdir -p /opt/payara/startup             # Make dirs for Payara
     unzip temp.zip -d /opt/payara                 # unzip Payara to dir
     sudo cp /vagrant/payara_service-4.1.151 /opt/payara/startup/
     sudo chmod +x /opt/payara/startup/payara_service-4.1.151
     ln -s /opt/payara/startup/payara_service-4.1.151 /etc/init.d/payara
     sudo update-rc.d payara defaults
     sudo chown -R vagrant:vagrant /opt/payara        # Make sure vagrant owns dir
     service payara start
   SHELL
end
