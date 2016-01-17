#!/usr/bin/env bash

sudo apt-get update
sudo /usr/share/debconf/fix_db.pl
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password ${1}"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password ${1}"

sudo apt-get purge -yqq apparmor
sudo apt-get install -yqq git
sudo apt-get install -yqq mysql-server
sudo apt-get install -yqq libmysqlclient-dev
sudo apt-get install -yqq imagemagick
sudo apt-get install -yqq graphviz
sudo apt-get install -yqq htop
sudo apt-get install -yqq dos2unix
