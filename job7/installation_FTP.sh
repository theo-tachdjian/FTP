apt-get install -y sudo

sudo apt-get -y update

sudo systemctl unmask proftpd
sudo mkdir /etc/proftpd
sudo mkdir /etc/proftpd/conf.d

sudo apt-get install -y proftpd
if [ ! $? == 0 ]; then
	echo "Cannot install package \"proftpd\". Exiting..."
	exit 1
fi

sudo apt-get install -y proftpd-mod-crypto
if [ ! $? == 0 ]; then
	echo "Cannot install package \"proftpd-mod-crypto\". Exiting..."
	exit 1
fi

echo "Generating certificate..."
sudo openssl req -x509 -newkey rsa:2048 -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=www.example.com" -keyout /etc/ssl/private/proftpd.key -out /etc/ssl/certs/proftpd.crt -nodes -days 3650

sudo chmod 0600 /etc/ssl/private/proftpd.key

sudo cp proftpd_tls.conf /etc/proftpd/conf.d
if [ ! $? == 0 ]; then
	echo "Warning: Could not copy config file to \"/etc/proftpd/conf.d\""
	exit 1
fi

echo -e "\nInstallation successful !"
