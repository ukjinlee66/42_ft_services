FROM alpine:latest

RUN apk update \
		&& apk upgrade \
		&& apk add wget \
		&& wget https://dl.influxdata.com/telegraf/releases/telegraf-1.14.1_linux_amd64.tar.gz \
		&& tar -xzf telegraf-1.14.1_linux_amd64.tar.gz \
		&& rm -rf telegraf-1.14.1_linux_amd64.tar.gz \
		&& mv telegraf /etc/ \
		&& chmod 755 /etc/telegraf/*
COPY	telegraf.conf /etc/telegraf/telegraf.conf

CMD sh ./etc/telegraf
