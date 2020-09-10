FROM alpine

RUN	apk update
RUN apk add zip
RUN apk add vim
RUN apk add openrc
RUN apk add bash
RUN rc default
RUN apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-curl php7-mbstring php7-json php7-session
RUN rm -fr /var/cache/apk/*
RUN mkdir /var/www
RUN mkdir /var/www/html

COPY setup.sh .
RUN chmod 777 setup.sh
COPY wordpress.zip /var/www/html/
# COPY wordpressdb.sql /var/
RUN unzip /var/www/html/wordpress.zip -d /var/www/html
RUN rm -rf /var/www/html/wordpress.zip

EXPOSE 5050
ENTRYPOINT ["./setup.sh"]
