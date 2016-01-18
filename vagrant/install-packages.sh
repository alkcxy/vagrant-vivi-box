#!/usr/bin/env bash

sudo apt-get update
sudo /usr/share/debconf/fix_db.pl

sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password ${1}"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password ${1}"

# in development envs apparmor is useless and things get complicated without any reason
sudo apt-get purge -yqq apparmor

# tools
sudo apt-get install -yqq git
sudo apt-get install -yqq htop
sudo apt-get install -yqq dos2unix

# mysql server
sudo apt-get install -yqq mysql-server
sudo apt-get install -yqq libmysqlclient-dev

# for phpmyadmin without apache2
sudo apt-get install -yqq php5-cli php5-cgi fcgiwrap php5-gd

# for building php plugin for uwsgi
sudo apt-get install -yqq php5-dev libphp5-embed libonig-dev libqdbm-dev
sudo apt-get install -yqq libdb-dev libbz2-dev libpcre3-dev libxml2-dev libkrb5-dev
