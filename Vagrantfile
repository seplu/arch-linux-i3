Vagrant.configure("2") do |config|

    config.vm.define "arch" do |arch|
        arch.vm.box = "archlinux/archlinux"
        arch.vm.hostname = "vagrant-arch"
        arch.ssh.insert_key = true
    
        arch.vm.provision "default",type: "ansible" do |ansible|
            ansible.playbook = "arch-linux-i3.yaml"
            ansible.verbose = "v"

            ansible.extra_vars = {
                ansible_python_interpreter: "/usr/bin/python3",
                ansible_hostname: "arch-linux-i3",
                ansible_virtualbox: "true"
            }
        end

        arch.vm.provider "virtualbox" do |virtualbox|
            #virtualbox.gui = "true"
            virtualbox.name = "vbox-arch-linux-i3"
            virtualbox.cpus = 2
            virtualbox.memory = 2048
            virtualbox.customize ['setextradata', :id, 'GUI/LastGuestSizeHint','1280,800']
        end
    end
end
