FROM alpine:latest

RUN apk update \
	&& apk add wget \
	&& apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli \
	php7-zlib php7-curl php7-mbstring php7-json php7-session \
		&& wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz \
		&& tar -zxvf phpMyAdmin-5.0.2-all-languages.tar.gz \
		&& rm phpMyAdmin-5.0.2-all-languages.tar.gz \
		&& mv phpMyAdmin-5.0.2-all-languages phpmyadmin
RUN apk add nginx
RUN rm -rf /var/cache/apk/*
RUN mkdir -p /run/nginx
RUN mkdir -p /etc/phpmyadmin
RUN mv phpmyadmin /var/www/
RUN chmod 755 /var/www/phpmyadmin
COPY config.inc.php /var/www/phpmyadmin/
COPY default /etc/nginx/conf.d/default.conf
RUN ln -s /var/www/phpmyadmin /etc/phpmyadmin
COPY start.sh ./
RUN chmod 755 start.sh
EXPOSE 5000

CMD ./start.sh
