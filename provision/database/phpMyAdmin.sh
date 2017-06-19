#!/usr/bin/env bash

echo "#######################################"
echo "#### INSTALLING phpMyAdmin 4.5.3.1 ####"
echo "#######################################"

if [[ -d /var/www/phpmyadmin ]]; then
    echo "Removing /var/www/phpmyadmin"
    sudo rm -rf /var/www/phpmyadmin
fi

if [[ -d /var/www/phpMyAdmin-4.5.3.1-all-languages/ ]]; then
    echo "Removing /var/www/phpMyAdmin-4.5.3.1-all-languages"
    sudo rm -rf /var/www/phpMyAdmin-4.5.3.1-all-languages/
fi

echo "Downloading https://files.phpmyadmin.net/phpMyAdmin/4.7.0/phpMyAdmin-4.7.0-all-languages.zip ..."
wget -q https://files.phpmyadmin.net/phpMyAdmin/4.7.0/phpMyAdmin-4.7.0-all-languages.zip -P /var/www/
apt-get -q -y install unzip
unzip /var/www/phpMyAdmin-4.7.0-all-languages.zip -d /var/www/
mv /var/www/phpMyAdmin-4.7.0-all-languages/ /var/www/phpmyadmin/
sudo rm /var/www/phpMyAdmin-4.7.0-all-languages.zip
cp /var/www/phpmyadmin/config.sample.inc.php /var/www/phpmyadmin/config.inc.php
sudo sed -i "s/\['AllowNoPassword'\] = false;/\['AllowNoPassword'\] = true;/g" /var/www/phpmyadmin/config.inc.php


