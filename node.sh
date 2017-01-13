#!/usr/bin/env bash
echo "Installing Nodejs"

curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get update
sudo apt-get install -y nodejs
sudo apt-get install -y build-essential
sudo npm install npm -g