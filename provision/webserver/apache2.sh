#!/usr/bin/env bash

echo "##################################"
echo "##### INSTALLING APACHE 2 ########"
echo "##################################"

apt-get -y install apache2

rm -rf /var/www/html
ln -fs /magento /var/www/html
VHOST=$(cat <<EOF
Listen 8080
Listen 9999
<VirtualHost *:80>
  DocumentRoot "/var/www/html"
  ServerName magento-vagrant
  <Directory "/var/www/html">
    Options Indexes FollowSymLinks MultiViews
    AllowOverride All
    Order allow,deny
    allow from all
  </Directory>
</VirtualHost>
<VirtualHost *:8080>
  DocumentRoot "/var/www/html"
  ServerName magento-vagrant
  <Directory "/var/www/html">
    Options Indexes FollowSymLinks MultiViews
    AllowOverride All
    Order allow,deny
    allow from all
  </Directory>
</VirtualHost>
<VirtualHost *:9999>
  DocumentRoot "/var/www/phpmyadmin"
  ServerName magento-vagrant
  <Directory "/var/www/phpmyadmin">
    Options Indexes FollowSymLinks MultiViews
    AllowOverride All
    Order allow,deny
    allow from all
  </Directory>
</VirtualHost>
EOF
)

echo "$VHOST" > /etc/apache2/sites-enabled/000-default.conf
sudo a2enmod rewrite
service apache2 restart