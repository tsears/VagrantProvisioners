#!/usr/bin/env bash

echo "Installing proftpd"
echo "proftpd-basic	shared/proftpd/inetd_or_standalone	select	standalone" | debconf-set-selections

apt-get install -y proftpd
service proftpd stop
rm /etc/proftpd/proftpd.conf
ln -fs /vagrant/conf/proftpd/proftpd.conf /etc/proftpd/proftpd.conf
ln -fs /vagrant/conf/proftpd/conf.d/sftp.conf /etc/proftpd/conf.d/sftp.conf

service proftpd start