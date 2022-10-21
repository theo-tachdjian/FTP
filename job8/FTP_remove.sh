sudo apt-get autoremove -y proftpd-*

sudo rm -rf /etc/proftpd

sudo rm -rf /usr/lib/proftpd

sudo rm -rf /srv/ftp

sudo rm /etc/ssl/private/proftpd.key
sudo rm /etc/ssl/certs/proftpd.crt
