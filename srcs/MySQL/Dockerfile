FROM alpine

RUN apk update
RUN apk add openrc
RUN apk add mariadb
RUN apk add mysql mysql-client
RUN apk add vim
RUN rc default
RUN apk add zip
RUN mkdir var/www
RUN mkdir var/www/html

COPY wordpress.zip /var/www/html
RUN unzip /var/www/html/wordpress.zip -d /var/www/html/
RUN rm -rf /var/www/html/wordpress.zip

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql
