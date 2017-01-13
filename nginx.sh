#!/usr/bin/env bash

echo "Installing nginx"
apt-get install -y nginx
echo "Moving nginx root to shared folder"
rm -fR /usr/share/nginx/html
ln -fs /vagrant/site /usr/share/nginx/html
echo "Setting nginx configuration to shared"
rm -f /etc/nginx/sites-enabled/default
ln -fs /vagrant/conf/nginx/wp-test /etc/nginx/sites-enabled/wp-test
service nginx restart