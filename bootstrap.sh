#!/bin/bash
#
# Script to install any left-overs

# Add the lxc-docker package and other requirements
wget -q -O - https://get.docker.io/gpg | apt-key add -
echo "deb http://get.docker.io/ubuntu docker main" > /etc/apt/sources.list.d/docker.list
apt-get update -qq
apt-get install -q -y --force-yes lxc-docker git ruby1.9.3 openvswitch-switch

# Add vagrant to the docker group, so we don't have to sudo everything.
gpasswd -a vagrant docker

# Install docker-api for our provisioning script
gem install docker-api

# Link our script into the path - set your env variable if you want a default config file
ln -s /vagrant/dctl.rb /usr/local/bin/dctl