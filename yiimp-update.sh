#!/bin/bash
sudo service nginx stop
sudo service php7.0-fpm stop
sudo service mysql stop
killall -9 main.sh
killall -9 run.sh
killall -9 loop2.sh
killall -9 blocks.sh
tar -cvjpf stratumbak.tar.gz /var/stratum/*
tar -cvjpf webbak.tar.gz /var/web/*
tar -cvjpf mysqlbak.tar.gz /var/lib/mysql/*
tar -cvjpf mysqlbak.tar.gz /usr/lib/mysql/*
sudo service mysql start

cd $HOME/
git clone https://github.com/tpruvot/yiimp.git
cd $HOME/yiimp/stratum/iniparser
rm -rf *.o
sudo make

cd $HOME/yiimp/stratum/algos
rm -rf *.o
sudo make

cd $HOME/yiimp/stratum
rm -rf *.o
sudo make

rm -rf /var/web/yaamp
rm -rf /var/web/images
rm -rf /var/web/framework
rm -rf /var/web/extensions
tar -cvjpf stratumbak.tar.gz /var/stratum/stratum

sudo cp -r $HOME/yiimp/web/yaamp /var/web/yaamp
sudo cp -r $HOME/yiimp/web/images /var/web/images
sudo cp -r $HOME/yiimp/web/framework /var/web/framework
sudo cp -r $HOME/yiimp/web/extensions /var/web/extensions
sudo cp -r $HOME/yiimp/stratum/stratum /var/stratum/
rm -rf /var/stratum/*.log
rm -rf /var/stratum/config/*.log


cd ~
cd $HOME/yiimp/sql
sudo mysql --defaults-group-suffix=host1 --force < 2017-11-segwit.sql
sudo mysql --defaults-group-suffix=host1 --force < 2018-01-stratums_ports.sql
sudo mysql --defaults-group-suffix=host1 --force < 2018-02-coins_getinfo.sql


sudo chmod -R 775 /var/www/$server_name/html
sudo chmod -R 775 /var/web
sudo chmod -R 775 /var/stratum
sudo chmod -R 775 /var/web/yaamp/runtime
sudo chmod -R 664 /root/backup/
sudo chmod -R 644 /var/log/debug.log
sudo chmod -R 775 /var/web/serverconfig.php
sudo service nginx restart
sudo service php7.0-fpm reload

