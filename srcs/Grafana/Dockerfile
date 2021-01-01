FROM alpine:latest

RUN apk update \ 
		&& apk upgrade \
		&& apk add wget \
		&& wget https://dl.grafana.com/oss/release/grafana-7.3.6.linux-amd64.tar.gz \
		&& tar -zxvf grafana-7.3.6.linux-amd64.tar.gz \
		&& rm -rf grafana-7.3.6.linux-amd64.tar.gz
COPY ./defaults.ini /grafana-7.3.6/conf/
COPY ./setup.sh
RUN chmod 755 ./setup.sh

EXPOSE 3000

CMD sh ./setup.sh
