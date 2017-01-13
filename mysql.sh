#!/usr/bin/env bash

# inspiration: https://gist.github.com/rrosiek/8190550

DBHOST=localhost
DBNAME=wordpress
DBUSER=wordpress
DBPASSWD=wordpress

echo "Installing MySQL \n"
echo "mysql-server mysql-server/root_password password $DBPASSWD" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password $DBPASSWD" | debconf-set-selections

apt-get install -y mysql-server

echo "Setting up our MySQL user and db"
mysql -uroot -p$DBPASSWD -e "CREATE DATABASE $DBNAME"
mysql -uroot -p$DBPASSWD -e "grant all privileges on *.* to '$DBUSER'@'localhost' identified by '$DBPASSWD'"
mysql -uroot -p$DBPASSWD -e "grant all privileges on *.* to '$DBUSER'@'%' identified by '$DBPASSWD'"


# http://serverfault.com/a/609975
echo "Setting up bind address for mysql for external availability"
if  sed -i "s/bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/my.cnf ; then
    echo "Updated mysql bind address in /etc/mysql/my.cnf to 0.0.0.0 to allow external connections."
fi

service mysql restart