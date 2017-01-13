#!/usr/bin/env bash

echo "Installing Wordpress"
wget -q http://wordpress.org/latest.tar.gz
tar -zxf latest.tar.gz
rm -fR /usr/share/nginx/html/*
mv wordpress/* /usr/share/nginx/html
ln -fs /vagrant/conf/wordpress/wp-config.php /usr/share/nginx/html/wp-config.php