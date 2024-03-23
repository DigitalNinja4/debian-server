#!/bin/bash

# Aktualizacja systemu
sudo apt update && sudo apt upgrade -y

# Instalacja pakietów KVM
sudo apt install -y qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virtinst

# Dodanie użytkownika do grupy libvirt i kvm
sudo adduser $(whoami) libvirt
sudo adduser $(whoami) kvm

# Sprawdzenie, czy moduły KVM są załadowane
if lsmod | grep kvm; then
    echo "Moduły KVM są już załadowane."
else
    echo "Wymagane moduły KVM nie są załadowane. Spróbuj uruchomić system ponownie."
fi

# Uruchomienie usługi libvirt
sudo systemctl enable libvirtd
sudo systemctl start libvirtd

# Sprawdzenie statusu usługi libvirt
sudo systemctl status libvirtd

echo "KVM został pomyślnie zainstalowany i skonfigurowany."
