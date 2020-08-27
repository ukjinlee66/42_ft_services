FROM alpine

RUN apk update
RUN apk add bash
RUN apk add nginx
RUN apk add openssl

RUN mkdir /run/nginx
COPY default /etc/nginx/nginx.conf
COPY setup.sh ./
RUN chmod 777 ./setup.sh

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=KR/ST=42/L=Seoul/O=42/CN=youlee' -keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.crt

EXPOSE 80 443

ENTRYPOINT ["./setup.sh"]
# CMD ["nginx", "-g", "daemon off;"]
