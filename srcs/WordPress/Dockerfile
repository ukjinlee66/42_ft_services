FROM alpine

RUN	apk update
RUN apk add wget
RUN apk add bash
RUN apk add nginx
RUN wget http://wordpress.org/latest.tar.gz
RUN apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-curl php7-mbstring php7-json php7-session
RUN rm -fr /var/cache/apk/*
RUN tar -xzvf latest.tar.gz
RUN rm latest.tar.gz
RUN mv wordpress /etc/
RUN mkdir -p /run/nginx
RUN mkdir -p /var/www/phpmyadmin
COPY ./wp-config.php /etc/wordpress/
EXPOSE 5050

CMD php -S 0.0.0.0:5050 -t /etc/wordpress/
