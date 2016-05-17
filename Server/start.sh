#!/bin/bash

ELK_IP=$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/')

NODE_IP= localhost

./elasticsearch_install.sh
./kibana_install.sh
./nginx_install.sh
./logstash_install.sh
./gene_certificate.sh
./kibana_dashboard.sh

