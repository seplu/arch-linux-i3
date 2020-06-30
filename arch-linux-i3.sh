#!/bin/bash

# Check linux distro
OS=$(awk -F= '/^NAME/{print $2}' /etc/os-release)
if ! [[ $OS == *"Arch"* ]]; then
    echo -e "No Arch distro.\nExiting..."
    exit 1
fi

# Check for internet connection
if ping -c 1 8.8.8.8 > /dev/null; then
    :
else
    echo -e "No internet connection.\nExiting..."
    exit 1
fi

# Check for Ansible
if ! type ansiblee-playbook &> /dev/null; then
    echo -e "Ansible not installed...\nTrying to install..."
    sudo pacman -S ansible --noconfirm
fi

ansible-playbook --connection=local --inventory 127.0.0.1, arch-linux-i3.yaml --extra-vars "ansible_python_interpreter='/usr/bin/python3'"
