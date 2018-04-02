#!/bin/bash

# Dienste starten
/etc/init.d/mysql start
/etc/init.d/apache2 start

# mysql betanken
mysql --defaults-file=/etc/mysql/debian.cnf <<.eof
create database vexim default character set utf8 default collate utf8_bin;
GRANT ALL PRIVILEGES ON vexim.* to vexim@'%' IDENTIFIED BY 'eximtest';
GRANT ALL PRIVILEGES ON vexim.* to vexim@'localhost' IDENTIFIED BY 'eximtest';
flush privileges;
.eof

mysql --defaults-file=/etc/mysql/debian.cnf -D vexim < /tmp/mysql.sql
rm /tmp/mysql.sql

# loop forever
while true
do
  sleep 600
done
