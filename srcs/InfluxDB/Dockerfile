FROM alpine:latest

RUN apk update \
		&& apk upgrade \
		&& apk add influxdb \
		&& rm -rf /var/cache/apk/*
COPY ./influxdb.conf /etc/influxdb.conf
EXPOSE 8086
ENTRYPOINT ["/usr/sbin/influxd"]
