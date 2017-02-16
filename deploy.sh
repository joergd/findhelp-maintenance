#! /bin/bash

MHOST=$1

ssh root@$MHOST mkdir -p /secrets

scp ../findhelp/config/host/findhelp.co.za.* root@$MHOST:/secrets
scp nginx-maintenance.conf root@$MHOST:/etc/nginx/sites-available/maintenance.conf

ssh root@$MHOST << EOSSH

  rm /etc/nginx/sites-enabled/digitalocean
  ln -s /etc/nginx/sites-available/maintenance.conf /etc/nginx/sites-enabled/maintenance
  sudo systemctl reload nginx

EOSSH

middleman build
middleman deploy

