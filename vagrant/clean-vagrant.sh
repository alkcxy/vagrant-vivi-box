#!/usr/bin/env bash

sudo apt-get clean
sudo dd if=/dev/zero of=/EMPTY bs=1M
sudo rm -f /EMPTY
echo "in real machine execute the following command: "
echo "vagrant halt"
echo "vagrant package --output vivi.box"
echo "then, to use the new machine:"
echo "vagrant box add vivi vivi.box"
echo "vagrant init vivi"
cat /dev/null > ~/.bash_history && history -c && exit
