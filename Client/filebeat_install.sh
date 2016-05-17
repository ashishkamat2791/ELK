#!/bin/bash
apt-get -y --fore-yes install wget curl
sudo mkdir -p /etc/pki/tls/certs
sudo cp /tmp/logstash-forwarder.crt /etc/pki/tls/certs/
echo "deb https://packages.elastic.co/beats/apt stable main" |  sudo tee -a /etc/apt/sources.list.d/beats.list
sudo apt-get -y --force-yes update
sudo apt-get -y --force-yes install filebeat
rm /etc/filebeat/filebeat.yml
cp filebeat.yml /etc/filebeat/filebeat.yml
sudo service filebeat restart
sudo update-rc.d filebeat defaults 95 10
# Testing
curl -XGET 'http://localhost:9200/filebeat-*/_search?pretty'

