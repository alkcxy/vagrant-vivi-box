#!/usr/bin/env bash

cd
if [ ! -f VBoxGuestAdditions_${1}.iso ]; then
sudo wget -cq http://download.virtualbox.org/virtualbox/${1}/VBoxGuestAdditions_${1}.iso \
                       -O VBoxGuestAdditions_${1}.iso
fi
sudo mount VBoxGuestAdditions_${1}.iso -o loop /mnt
cd /mnt
yes | sudo sh VBoxLinuxAdditions.run --nox11
cd
sudo umount /mnt
sudo rm *.iso
sudo /etc/init.d/vboxadd setup
sudo update-rc.d vboxadd defaults
sudo update-rc.d vboxadd enable

#$ vagrant package --output ubuntu_saucy_4.3.4.box
