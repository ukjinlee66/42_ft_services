FROM alpine

RUN	apk update
RUN apk add zip
RUN apk add vim
RUN apk add openrc
RUN rc default

RUN mkdir /var/www
RUN mkdir /var/www/html

COPY wordpress.zip /var/www/html/
# COPY wordpressdb.sql /var/
RUN unzip /var/www/html/wordpress.zip -d /var/www/html
RUN rm -rf /var/www/html/wordpress.zip
