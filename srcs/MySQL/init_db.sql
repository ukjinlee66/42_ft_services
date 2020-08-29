CREATE DATABASE wordpressdb;

GRANT ALL PRIVILEGES ON wordpressdb.* TO 'root'@'%';

FLUSH PRIVILEGES;

update mysql.user set plugin='mysql_native_password' where
user='root'
