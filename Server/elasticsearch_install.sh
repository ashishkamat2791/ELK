#!/bin/bash

apt-get update

apt-get install -y --force-yes wget curl

sudo add-apt-repository -y ppa:webupd8team/java

sudo apt-get update

sudo apt-get -y --force-yes install oracle-java8-installer

wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

echo "deb http://packages.elastic.co/elasticsearch/2.x/debian stable main" | sudo tee -a /etc/apt/sources.list.d/elasticsearch-2.x.list

sudo apt-get update

sudo apt-get -y --force-yes install elasticsearch

sudo service elasticsearch restart

sudo update-rc.d elasticsearch defaults 95 10
