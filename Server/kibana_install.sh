#!/bin/bash

echo "deb http://packages.elastic.co/kibana/4.4/debian stable main" | sudo tee -a /etc/apt/sources.list.d/kibana-4.4.x.list

sudo apt-get -y --force-yes update

sudo apt-get -y --force-yes install kibana

sudo update-rc.d kibana defaults 96 9

sudo service kibana start
