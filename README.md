# vivi.box
Vagrant Box uWSGI ready with ruby2.2+mysql5+phpmyadmin+rvm+nvm based on the official Ubuntu Trusty (14.04 LTS) box.

## Feature
* Ruby 2.2 installed through rvm.
* Node 4.2.4 installed through nvm.
* Ruby gemset vagrant created and used for installing uWSGI and bundler.
* uWSGI is ready to execute vassals presents under ~/vassals from an emperor instance in ~/bin/emperor.sh
* mysql is already configured as a uWSGI smart-attacch-daemon with configuration file under ~/vassals
* phpmyadmin is already configured as a uWSGI instance with configuration file under vassals
* Forwarded port - guest: 3000, host: 3000; guest: 8080, host: 8080. eg. http://localhost:8080/phpmyadmin and http://localhost:3000 for your own uwsgi+ruby project. with vagrant init you can create your own Vagrant box and you must declare your forward.

## TO INVESTIGATE
* phpmyadmin alerts about a configuration error. this error disappear if emperor runs as root at least once.

## Host dependencies (tested with)
* Vagrant >= 1.8.1
* VirtualBox >= 5.0.12
