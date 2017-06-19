#!/usr/bin/env bash

# adding '> /dev/null' Suppresses the output to the shell

PROJECT_NAME=$1
export PROJECT_NAME

echo "#######################"
echo "##### STARTING ########"
echo "#######################"

# Make provisioning scripts executable
sudo chmod 777 -R /vagrant/provision/

add-apt-repository ppa:ondrej/php
apt-get -y update

# Get phpMyAdmin 4.5.3.1
/vagrant/provision/database/phpMyAdmin.sh

# Install & Configure Apache 2
/vagrant/provision/webserver/apache2.sh

# Install PHP 7
/vagrant/provision/php/php7.sh

# Install MySQL Server 5.6
/vagrant/provision/database/mysql-server-5.6.sh

# Install Magento
# better to do this manually using ./utils/m98-magerun.phar
#/vagrant/provision/magerun/install.sh

service apache2 restart

# Success
/vagrant/provision/finished.sh