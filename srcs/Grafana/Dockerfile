FROM alpine:latest

RUN apk update \ 
		&& apk upgrade \
		&& apk add wget \
		&& wget https://dl.grafana.com/oss/release/grafana-7.1.3.linux-amd64.tar.gz \
		&& tar -zxvf grafana-7.1.3.linux-amd64.tar.gz \
		&& rm -rf grafana-7.1.3.linux-amd64.tar.gz \
		&& apk add --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat
COPY ./defaults.ini /grafana-7.1.3/conf/
COPY ./setup.sh ./
RUN mkdir -p /etc/grafana/provisioning/dashboards
COPY ./dashboards grafana-7.1.3/conf/provisioning/dashboards/
COPY provisioning/datasources.yaml grafana-7.1.3/conf/provisioning/datasources/
COPY provisioning/dashboards.yaml grafana-7.1.3/conf/provisioning/dashboards/
RUN chmod 755 ./setup.sh

EXPOSE 3000

CMD ./setup.sh
# CMD ["/usr/sbin/grafana-server", "--homepath=/usr/share/grafana"]
