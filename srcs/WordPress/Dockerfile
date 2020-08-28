FROM alpine

RUN	apk update
RUN apk add zip
RUN mkdir /var/www/html
COPY wordpress.zip /var/www/html/
COPY wordpressdb.sql /var/
RUN unzip /var/www/html/wordpress.zip
RUN rm -rf /var/www/html/wordpress.zip

