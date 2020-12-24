FROM alpine

RUN apk update \
	&& apk add bash \
		&& apk add nginx \
			&& apk add openssl
# && apk add --no-cache openssh
RUN apk add --no-cache openssh
RUN adduser -D tester
RUN echo 'tester:0000'|chpasswd
RUN ssh-keygen -f /etc/ssh/ssh_host_rsa_key -t rsa
RUN chmod 600 /etc/ssh/ssh_host_rsa_key
RUN chmod 600 /etc/ssh/ssh_host_rsa_key.pub
# && sed 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' -i /etc/ssh/sshd_config \
# && echo 'root:0000' | chpasswd \
# && ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa \
# && ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa \
# && echo "Port 30022" >> /etc/ssh/sshd_config \
# && mkdir -p /var/run/sshd


RUN mkdir -p /var/run/sshd
RUN mkdir /run/nginx
COPY default /etc/nginx/nginx.conf
COPY ngstart.sh ./
COPY sshd_config /etc/ssh/sshd_config
RUN chmod 777 ./ngstart.sh

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=KR/ST=42/L=Seoul/O=42/CN=youlee' -keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.crt

EXPOSE 80 443 30022

# CMD ["/usr/sbin/sshd"]
# CMD ["nginx","-g", "daemon off;"]
# ENTRYPOINT ["./ngstart.sh"]
CMD sh ./ngstart.sh
