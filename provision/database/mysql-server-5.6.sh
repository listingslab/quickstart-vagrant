#!/usr/bin/env bash

echo "################################"
echo "##### INSTALLING MYSQL 5.6 #####"
echo "################################"

# Ignore MySQL's post install questions
export DEBIAN_FRONTEND=noninteractive
apt-get install -y mysql-server-5.6 mysql-client-core-5.6
