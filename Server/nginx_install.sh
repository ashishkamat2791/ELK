#!/bin/bash

sudo apt-get install -y nginx apache2-utils

echo kibana | sudo htpasswd -c /etc/nginx/htpasswd.users kibanaadmin

sudo rm /etc/nginx/sites-available/default

sudo cp default /etc/nginx/sites-available/default

sudo service nginx restart
