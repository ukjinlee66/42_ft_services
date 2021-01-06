#!/bin/sh
until mysql

do
	echo "NOT"
done

echo "CREATE DATABASE wordpress;" | mysql -u root --skip-password
echo "CREATE USER 'user'@'%' IDENTIFIED BY 'password';" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON *.* TO 'user'@'%' WITH GRANT OPTION;" | mysql -u root --skip-password
# echo "update mysql.user set plugin='mysql_native_password' where user='root';" | mysql -u root --skip-password
echo "DROP DATABASE test;" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
mysql wordpress -u root --skip-password < wordpress.sql
