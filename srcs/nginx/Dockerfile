FROM alpine

RUN apk update \
	&& apk add bash \
		&& apk add nginx \
			&& apk add openssl \
				&& apk add --no-cache openssh

RUN mkdir /run/nginx
COPY default /etc/nginx/nginx.conf
COPY ngstart.sh ./
RUN chmod 777 ./ngstart.sh

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=KR/ST=42/L=Seoul/O=42/CN=youlee' -keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.crt

EXPOSE 80 443 30022


# CMD ["/usr/sbin/sshd"]
# CMD ["nginx","-g", "daemon off;"]
# ENTRYPOINT ["./ngstart.sh"]
# CMD bash ./ngstart.sh
