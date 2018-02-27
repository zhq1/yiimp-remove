#!/bin/bash
sudo service nginx stop
sudo service php7.0-fpm stop
sudo service mysql stop
killall -9 main.sh
killall -9 run.sh
killall -9 loop2.sh
killall -9 blocks.sh
tar zcvf stratumbak.tar.gz /var/stratum/*
tar zcvf webbak.tar.gz /var/web/*
tar zcvf mysqlbak.tar.gz /var/lib/mysql/*
tar zcvf mysqlbak.tar.gz /usr/lib/mysql/*
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
tar zcvf stratumbak.tar.gz /var/stratum/stratum

sudo cp -r $HOME/yiimp/web/yaamp /var/web/yaamp
sudo cp -r $HOME/yiimp/web/images /var/web/images
sudo cp -r $HOME/yiimp/web/framework /var/web/framework
sudo cp -r $HOME/yiimp/web/extensions /var/web/extensions
sudo cp -r $HOME/yiimp/stratum/stratum /var/stratum/
