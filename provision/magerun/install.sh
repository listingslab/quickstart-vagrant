#!/usr/bin/env bash

echo "##############################"
echo "##### INSTALLING MAGENTO #####"
echo "##############################"

/vagrant/utils/n98-magerun.phar install --no-interaction --magentoVersionByName magento-ce-1.9.3.2 --installationFolder /magento --dbHost localhost --dbUser root --dbName $PROJECT_NAME --baseUrl=http://local.$PROJECT_NAME.dev/ --replaceHtaccessFile=yes

# Add a session save path to the local.xml to workaround the admin panel issue
sudo sed -i '/session_save/a \<session_save_path\>\<![CDATA[/tmp/session]]\>\</session_save_path\>' /magento/app/etc/local.xml

# flush the cache for changes to take effect
/vagrant/utils/n98-magerun.phar cache:f --root-dir /magento
