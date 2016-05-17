#!/bin/bash

rm -rf /etc/logstash

echo 'deb http://packages.elastic.co/logstash/2.2/debian stable main' | sudo tee /etc/apt/sources.list.d/logstash-2.2.x.list

sudo apt-get update

sudo apt-get -y --force-yes install logstash

./gene_certificate.sh

cp -r 02-beats-input.conf /etc/logstash/conf.d/02-beats-input.conf
cp -r 10-syslog-filter.conf /etc/logstash/conf.d/10-syslog-filter.conf
cp -r 30-elasticsearch-output.conf /etc/logstash/conf.d/30-elasticsearch-output.conf

sudo service logstash configtest
sudo service logstash restart
sudo update-rc.d logstash defaults 96 9
