#!/usr/bin/env bash
echo "manual" | sudo tee /etc/init/mysql.override
sudo service mysql stop
sudo killall mysqld

mkdir $HOME/db.mysql -p

cp /vagrant/vagrant/conf/my.cnf $HOME/.my.cnf
chmod 644 $HOME/.my.cnf
mysql_install_db --defaults-file=$HOME/.my.cnf
sudo rm /var/run/mysqld -rf
sudo ln -s $HOME/db.mysql /var/run/mysqld

cp /vagrant/vassals/mysql.ini $HOME/vassals/
tail -f $HOME/emperor.log | while read LOGLINE
do
   if [[ "${LOGLINE}" == *"mysqld: ready for connections"* ]]; then
     /usr/bin/mysqladmin --defaults-file=$HOME/.my.cnf -uroot password ${1}
     exit 0
   fi
done
