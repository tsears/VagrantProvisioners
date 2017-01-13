#!/usr/bin/env bash

echo "Installing MongoDB"

echo "Adding Key Server"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6

echo "Adding List File"
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/testing multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list


echo "Updating apt packages"
sudo apt-get update

echo "Installing MongoDB"
sudo apt-get install -y mongodb-org

service mongod status
