#!/usr/bin/env bash

echo "Installing postgresql"

echo "Adding List File"
echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main"  | sudo tee /etc/apt/sources.list.d/docker.list

echo "Adding Key Server"
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

echo "Updating apt packages"
apt-get update

echo "Installing Postgres"
apt-get install -y postgresql-9.4

echo "Setting Up"
sudo -u postgres psql -U postgres -d postgres -c "alter user postgres with password 'postgres';"
echo "host  all   all   0.0.0.0/0   md5" >> /etc/postgresql/9.4/main/pg_hba.conf
echo "listen_addresses = '*'" >> /etc/postgresql/9.4/main/postgresql.conf
service postgresql restart
