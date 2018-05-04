#!/bin/sh

# pre-remove mariadb
sudo yum remove -y mariadb-libs
sudo rm -rf /var/lib/mysql/

# mysql5.6
sudo yum localinstall -y http://dev.mysql.com/get/mysql57-community-release-el6-7.noarch.rpm
sudo yum -y install yum-utils
sudo yum-config-manager --disable mysql57-community
sudo yum-config-manager --enable mysql56-community

# mysql-community-server
sudo yum install -y mysql-community-server

# add as service
sudo systemctl enable mysqld
sudo service mysqld restart
