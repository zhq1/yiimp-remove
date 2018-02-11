#!/bin/bash
sudo service nginx stop
sudo service mysql stop
sudo service php7.0-fpm stop
killall -9 main.sh
killall -9 run.sh
killall -9 loop2.sh
killall -9 blocks.sh
killall -9 php
killall -9 mysql
killall -9 nginx
tar -cvjpf mycnfbak.tar.gz $HOME/.my.cnf
cd /var/lib/mysql && tar -cvjpf mysqlbak.tar.gz /var/lib/mysql/*
	sudo aptitude -y remove nginx
	sudo aptitude -y remove php7.0-fpm
	sudo aptitude -y remove php7.0-opcache php7.0-fpm php7.0 php7.0-common php7.0-gd php7.0-mysql php7.0-imap php7.0-cli php7.0-cgi php-pear php-auth php7.0-mcrypt mcrypt imagemagick libruby php7.0-curl php7.0-intl php7.0-pspell php7.0-recode php7.0-sqlite3 php7.0-tidy php7.0-xmlrpc php7.0-xsl memcached php-memcache php-imagick php-gettext php7.0-zip php7.0-mbstring
    sudo aptitude -y remove libgmp3-dev
    sudo aptitude -y remove libmysqlclient-dev
    sudo aptitude -y remove libcurl4-gnutls-dev
    sudo aptitude -y remove libkrb5-dev
    sudo aptitude -y remove libldap2-dev
    sudo aptitude -y remove libidn11-dev
    sudo aptitude -y remove gnutls-dev
    sudo aptitude -y remove librtmp-dev
    sudo aptitude -y remove build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils
    sudo aptitude -y remove sendmail
    sudo aptitude -y remove git
    sudo aptitude -y remove pwgen -y
	sudo aptitude -y remove fail2ban
	sudo aptitude -y remove mariadb-server
	sudo aptitude -y remove phpmyadmin
rm -rf $HOME/.my.cnf
rm -rf $HOME/my.cnf
rm -rf $HOME/yiimp*
rm -rf /etc/yiimp/*
rm -rf /$HOME/backup/*
rm -rf /var/web
rm -rf /var/www/*
rm -rf /var/stratum
