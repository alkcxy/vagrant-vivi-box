# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
if !Vagrant.has_plugin?("vagrant-proxyconf")
        system('vagrant plugin install vagrant-proxyconf')

     raise("vagrant-proxyconf installed. Run command again.");
end
Vagrant.configure(2) do |config|
  if Vagrant.has_plugin?("vagrant-proxyconf")
    config.proxy.http     = "" # set your proxy
    config.proxy.https    = "" # set your proxy
    config.proxy.no_proxy = "localhost,127.0.0.1"
  end

  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.define :vivi32 do |td|
    td.vm.box = "ubuntu/trusty32"
  end

  config.vm.define :vivi64 do |sq|
    sq.vm.box = "ubuntu/trusty64"
  end

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
#  config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.network "forwarded_port", guest: 80, host: 8080

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
#  config.vm.synced_folder ".", "/vagrant", :nfs => true

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
  #  vb.gui = true
    ### Change network card to PCnet-FAST III
    # For NAT adapter
    vb.customize ["modifyvm", :id, "--nictype1", "Am79C973"]
    # For host-only adapter
    # vb.customize ["modifyvm", :id, "--nictype2", "Am79C973"]
    #   # Customize the amount of memory on the VM:
    vb.memory = 1024
    vb.cpus = 1
    vb.auto_nat_dns_proxy = false
  end
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL
  rvmtype = "stable"
  rubyver = "2.2"
  dbpwd = "vagrant"
  nodever = "v4.2.4"
  vbver = "5.0.12"

  config.vm.provision "install-packages", type: :shell, path: "vagrant/install-packages.sh", args: dbpwd, privileged: false
  config.vm.provision :shell, path: "vagrant/install-rvm.sh", args: rvmtype, privileged: false
  config.vm.provision :shell, path: "vagrant/install-nvm.sh", args: nodever, privileged: false
  config.vm.provision "install-ruby", type: :shell, path: "vagrant/install-ruby.sh", args: rubyver, privileged: false
  config.vm.provision "install-uwsgi", type: :shell, path: "vagrant/install-uwsgi.sh", args: rubyver, privileged: false
  config.vm.provision "install-mysql", type: :shell, path: "vagrant/install-mysql.sh", args: dbpwd, privileged: false
  config.vm.provision "install-phpmyadmin", type: :shell, path: "vagrant/install-phpmyadmin.sh", args: dbpwd, privileged: false
  config.vm.provision "vbga", type: :shell, path: "vagrant/vbguestaddition_update.sh", args: vbver, privileged: false
  config.vm.provision "clean-vagrant", type: :shell, path: "vagrant/clean-vagrant.sh", args: vbver, privileged: false

end
