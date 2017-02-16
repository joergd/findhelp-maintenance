# findhelp-maintenance

* Spin up server (based on LEMP 16.04 image)
* scp ../findhelp/config/host/findhelp.co.za.crt root@138.197.117.137:/secrets/site.crt
* scp ../findhelp/config/host/findhelp.co.za.key root@138.197.117.137:/secrets/site.key
* scp nginx-maintenance.conf root@138.197.117.137:/etc/nginx/sites-available/maintenance.conf
* ssh root@
* rm /etc/nginx/sites-enabled/digitalocean
* ln -s /etc/nginx/sites-available/maintenance.conf maintenance
* sudo systemctl reload nginx
* Check public IP address
* Set it in config.rb
* middleman build
* middleman deploy
* Change floating IP address
