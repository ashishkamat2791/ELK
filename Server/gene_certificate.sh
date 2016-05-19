#!/bin/bash
sudo mkdir -p /etc/pki/tls/certs
sudo mkdir -p /etc/pki/tls/private
rm -rf /etc/ssl/openssl.cnf
cp openssl.cnf /etc/ssl/openssl.cnf
cd /etc/pki/tls
sudo openssl req -config /etc/ssl/openssl.cnf -x509 -days 3650 -batch -nodes -newkey rsa:2048 -keyout private/logstash-forwarder.key -out certs/logstash-forwarder.crt
