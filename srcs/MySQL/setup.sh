#!/bin/bash
rc-service mariadb restart
/usr/bin/mysqld_safe --skip-grant-tables &
sleep 5
mysql -u root -e "CREATE DATABASE wordpressdb"
mysql -u root wordpressdb < /var/init_db.sql
