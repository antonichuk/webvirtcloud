# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.ssh.insert_key = false
  
  config.vm.define :server do |node|
    node.vm.box = "rockylinux/8"
    node.vm.box_version = "5.0.0"
    node.vm.hostname = "wvc-dev-node"
    node.vm.synced_folder ".", "/vagrant", type: "nfs"
    
    node.vm.network "private_network", 
      ip: "172.64.0.254", 
      netmask: "255.255.255.0",
      auto_config: false
    
    node.vm.network "private_network", 
      ip: "192.168.33.254", 
      netmaks: "255.255.255.0", 
      auto_config: false
        
    node.vm.network "private_network", 
      ip: "10.132.255.254", 
      netmaks: "255.255.0.0",
      auto_config: false
        
    node.vm.provider :libvirt do |libvirt|
      libvirt.cpus = 6
      libvirt.cpu_mode = "host-passthrough"
      libvirt.memory = 8192
      libvirt.nested = true
      libvirt.machine_virtual_size = 256
      libvirt.qemu_use_session = false
    end

    # node.vm.provision "shell", inline: <<-SHELL
    #   dnf install -y cloud-utils-growpart
    #   growpart /dev/vda 1
    #   xfs_growfs /dev/vda1
    # SHELL
  
  end
end
