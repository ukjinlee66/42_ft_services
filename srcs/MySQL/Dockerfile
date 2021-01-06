FROM alpine:latest

RUN apk update
RUN apk add mysql mysql-client
RUN rm  -rf /var/cache/apk/*
COPY setup.sh .
COPY init_db.sh . 
COPY wordpress.sql .
COPY my.cnf ./etc/my.cnf
RUN chmod 755 setup.sh
RUN chmod 755 init_db.sh

EXPOSE 3306

CMD sh ./setup.sh
