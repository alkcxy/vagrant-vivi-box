#!/usr/bin/env bash

sudo /usr/share/debconf/fix_db.pl
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password ${1}"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password ${1}"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/dbconfig-install boolean true"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/admin-user string root"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/app-password-confirm password ${1}"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/admin-pass password ${1}"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/app-pass password ${1}"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/database-type select mysql"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/reconfigure-webserver multiselect none"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/setup-password password ${1}"

sudo apt-get install -yqq phpmyadmin
