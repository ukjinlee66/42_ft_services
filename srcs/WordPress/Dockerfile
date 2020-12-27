FROM alpine

RUN	apk update
RUN apk add openrc
RUN apk add wget
RUN wget http://wordpress.org/latest.tar.gz
RUN rc default
RUN apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-curl php7-mbstring php7-json php7-session
RUN rm -fr /var/cache/apk/*
RUN tar -xzvf latest.tar.gz
RUN rm latest.tar.gz
RUN mv wordpress /etc/
RUN chown -R test:test /etc/wordpress/*
COPY ./wp-config.php /etc/wordpress/
COPY setup.sh .
RUN chmod 777 setup.sh

EXPOSE 5050

ENTRYPOINT ["./setup.sh"]
