FROM alpine

RUN apk update
RUN apk add vim
RUN apk add nginx
RUN apk add openssl

RUN mkdir /run/nginx
# COPY nginx.conf /etc/nginx/
# RUN mkdir /etc/nginx/sites
COPY default /etc/nginx/nginx.conf

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=KR/ST=42/L=Seoul/O=42/CN=youlee' -keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.crt

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
