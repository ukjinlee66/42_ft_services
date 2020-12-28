FROM alpine:latest

RUN apk update \
	&& apk add wget \
	apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli \
	php7-zlib php7-curl php7-mbstring php7-json php7-session \
		&& wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz \
		&& tar -zxvf phpMyAdmin-5.0.2-all-languages.tar.gz \
		&& rm phpMyAdmin-5.0.2-all-languages.tar.gz \
		&& mv phpMyAdmin-5.0.2-all-languages phpmyadmin \
		&& mv phpmyadmin /etc/
RUN chmod 777 /etc/phpmyadmin
RUN rm -rf /var/cache/apk/*
COPY config.inc.php /etc/phpmyadmin/

EXPOSE 5000

CMD php -S 0.0.0.0:5000 -t /etc/phpmyadmin
