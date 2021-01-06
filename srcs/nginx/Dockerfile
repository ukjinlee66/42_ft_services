FROM alpine

RUN apk update \
		&& apk add nginx \
			&& apk add openssl \
			&& apk add jq && apk add curl
RUN apk add --no-cache openssh
RUN adduser -D -g 'test' test
RUN echo 'test:0000'|chpasswd
RUN ssh-keygen -f /etc/ssh/ssh_host_rsa_key -t rsa
RUN chmod 600 /etc/ssh/ssh_host_rsa_key
RUN chmod 600 /etc/ssh/ssh_host_rsa_key.pub
RUN chown -R test:test /var/lib/nginx
RUN mkdir /www
RUN chown -R test:test /www
COPY index.html /www/index.html
RUN chmod 755 /www/*
RUN mkdir -p /etc/nginx/ssl
RUN mkdir -p /run/nginx
RUN mkdir -p /var/run/sshd
COPY default /etc/nginx/nginx.conf
COPY ngstart.sh ./
COPY sshd_config /etc/ssh/sshd_config
RUN chmod 777 ./ngstart.sh

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=KR/ST=42/L=Seoul/O=42/CN=youlee' -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt


EXPOSE 80 443 30022

ENTRYPOINT ./ngstart.sh
