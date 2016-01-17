#!/usr/bin/env bash

mkdir $HOME/bin -p
mkdir $HOME/vassals -p
ln -s /vagrant/vagrant/conf/emperor.sh $HOME/bin/

source $HOME/.rvm/scripts/rvm
rvm use ${1}@vagrant --create

gem install bundler uwsgi --no-rdoc --no-ri
bash $HOME/bin/emperor.sh

