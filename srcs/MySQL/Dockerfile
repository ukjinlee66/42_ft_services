FROM alpine

RUN apk update
RUN apk add openrc
RUN apk add mysql mysql-client
RUN apk add vim
RUN apk add bash
RUN rc default
RUN mkdir var/www
RUN mkdir var/www/html

COPY setup.sh /var/
COPY init_db.sql /var/ 
RUN chmod 777 /var/setup.sh
RUN chmod 777 /var/init_db.sql

# RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql
EXPOSE 3306

# ENTRYPOINT ["/var/setup.sh"]
