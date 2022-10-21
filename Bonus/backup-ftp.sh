time=$(date +"%d-%m-%y_%H:%M")
archive="backup_${time}.tar.gz"

tar -zcvf "/var/tmp/${archive}" "/etc/proftpd" "/srv/ftp" "/ftpshare"	

scp "/var/tmp/${archive}" erwan@192.168.19.130:"/backup/$archive" && rm "/var/tmp/${archive}"
