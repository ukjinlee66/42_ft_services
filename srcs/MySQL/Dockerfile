FROM alpine

RUN apk update
RUN apk add openrc
RUN apk add mysql mysql-client
RUN apk add vim
RUN apk add bash
RUN rc default
RUN mkdir var/www
RUN mkdir var/www/html

COPY setup.sh ./
COPY init_db.sh ./ 
RUN chmod 777 ./setup.sh
RUN chmod 777 ./init_db.sh

EXPOSE 3306

ENTRYPOINT ["./setup.sh"]
