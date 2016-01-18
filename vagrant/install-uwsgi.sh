#!/usr/bin/env bash

mkdir $HOME/bin -p
mkdir $HOME/vassals -p
cp /vagrant/vagrant/conf/emperor.sh $HOME/bin/
cp /vagrant/vagrant/conf/emperor.ini $HOME/bin/

source $HOME/.rvm/scripts/rvm
rvm use ${1}@vagrant --create

gem install bundler uwsgi --no-rdoc --no-ri

cd $HOME/.rvm/gems/ruby-2.2.1@vagrant/gems/uwsgi-$(uwsgi --version)/ext/uwsgi/uwsgi_latest_from_installer/
python uwsgiconfig.py --plugin plugins/php
mkdir $HOME/libs
mv php_plugin.so $HOME/libs/

bash $HOME/bin/emperor.sh
