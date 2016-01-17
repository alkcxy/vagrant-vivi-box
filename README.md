# vivi.box
Vagrant Box uWSGI ready with ruby2.2+mysql5+phpmyadmin+rvm+nvm based on the official Ubuntu Trusty (14.04 LTS) box.

## Feature
* Ruby 2.2 installed through rvm.
* Node 4.2.4 installed through nvm.
* Ruby gemset vagrant created and used for installing uWSGI and bundler.
* uWSGI is ready to execute vassals presents under ~/vassals from an emperor instance in ~/bin/emperor.sh
* mysql is already configured as a uWSGI smart-attacch-daemon under ~/vassals
* Forwarded port - guest: 3000, host: 3000; guest: 80, host: 8080. eg. http://localhost:8080/phpmyadmin and http://localhost:3000 for your own uwsgi+ruby project

## TODO
* create a vassal uWSGI for phpmyadmin. Currently is executed with apache2

## Dependencies (tested with)
* Vagrant >= 1.8.1
* VirtualBox >= 5.0.12
