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
RUN mv wordpress /var/www/
RUN chmod 755 /var/www/wordpress
RUN mkdir -p /run/nginx
RUN mkdir -p /etc/wordpress
COPY ./wp-config.php /var/www/wordpress/
COPY start.sh .
COPY default /etc/nginx/conf.d/default.conf
RUN chmod 755 start.sh
EXPOSE 5050

CMD ./start.sh
