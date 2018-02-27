#!/bin/bash
su
sudo service nginx stop
sudo service php7.0-fpm stop
killall -9 main.sh
killall -9 run.sh
killall -9 loop2.sh
killall -9 blocks.sh
rm -rf /var/stratum/*.log
rm -rf /var/stratum/config/*.log

cd $HOME/
sudo mkdir yiimpbackup
cd yiimpbackup
cp -r $HOME/.my.cnf $HOME/yiimpbackup
su
tar -cvjpf stratumbak.tar.gz /var/stratum/*
tar -cvjpf webbak.tar.gz /var/web/*
tar -cvjpf mysqlbak.tar.gz /var/lib/mysql/*
tar -cvjpf mysqlbak222.tar.gz /usr/lib/mysql/*



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
sudo service php7.0-fpm restart

screen -dmS main /var/web/main.sh
screen -dmS loop2 /var/web/loop2.sh
screen -dmS blocks /var/web/blocks.sh
screen -dmS debug tail -f /var/web/debug.log

screen -dmS c11 /var/stratum/run.sh c11
#screen -dmS deep /var/stratum/run.sh deep

screen -dmS x11 /var/stratum/run.sh x11
#screen -dmS x11evo /var/stratum/run.sh x11evo
screen -dmS x13 /var/stratum/run.sh x13
#screen -dmS x14 /var/stratum/run.sh x14
screen -dmS x15 /var/stratum/run.sh x15
#screen -dmS x17 /var/stratum/run.sh x17
screen -dmS xevan /var/stratum/run.sh xevan
#screen -dmS timetravel /var/stratum/run.sh timetravel
#screen -dmS bitcore /var/stratum/run.sh bitcore
#screen -dmS hmq1725 /var/stratum/run.sh hmq1725
screen -dmS tribus /var/stratum/run.sh tribus

screen -dmS sha /var/stratum/run.sh sha
screen -dmS sha256t /var/stratum/run.sh sha256t
screen -dmS scrypt /var/stratum/run.sh scrypt
#screen -dmS scryptn /var/stratum/run.sh scryptn
#screen -dmS luffa /var/stratum/run.sh luffa
screen -dmS neo /var/stratum/run.sh neo
screen -dmS nist5 /var/stratum/run.sh nist5
#screen -dmS penta /var/stratum/run.sh penta
screen -dmS quark /var/stratum/run.sh quark
screen -dmS qubit /var/stratum/run.sh qubit
#screen -dmS jha /var/stratum/run.sh jha
#screen -dmS dmd-gr /var/stratum/run.sh dmd-gr
screen -dmS myr-gr /var/stratum/run.sh myr-gr
#screen -dmS lbry /var/stratum/run.sh lbry
screen -dmS lyra2 /var/stratum/run.sh lyra2
screen -dmS lyra2v2 /var/stratum/run.sh lyra2v2
screen -dmS zero /var/stratum/run.sh lyra2z

screen -dmS blakecoin /var/stratum/run.sh blakecoin
#screen -dmS blake /var/stratum/run.sh blake
#screen -dmS blake2s /var/stratum/run.sh blake2
#screen -dmS vanilla /var/stratum/run.sh vanilla
#screen -dmS decred /var/stratum/run.sh decred

#screen -dmS keccak /var/stratum/run.sh keccak
#screen -dmS whirlpool /var/stratum/run.sh whirlpool

screen -dmS skein /var/stratum/run.sh skein
#screen -dmS skein2 /var/stratum/run.sh skein2
#screen -dmS yescrypt /var/stratum/run.sh yescrypt
#screen -dmS zr5 /var/stratum/run.sh zr5
#screen -dmS sib /var/stratum/run.sh sib
#screen -dmS m7m /var/stratum/run.sh m7m
#screen -dmS veltor /var/stratum/run.sh veltor
#screen -dmS velvet /var/stratum/run.sh velvet
#screen -dmS argon2 /var/stratum/run.sh argon2

screen -dmS polytimos /var/stratum/run.sh polytimos
screen -dmS yescryptR16 /var/stratum/run.sh yescryptR16
screen -dmS phi /var/stratum/run.sh phi











