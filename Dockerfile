FROM resin/rpi-raspbian:jessie

RUN apt-get update && \
    apt-get install curl ca-certificates

RUN curl -s https://packagecloud.io/install/repositories/pithings/rpi/script.deb.sh | bash

RUN mkdir -p /var/lib/influxdb
RUN mkdir -p /var/log/influxdb
RUN apt-get install influxdb && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 8083
EXPOSE 8086
#EXPOSE 8099

VOLUME ["/etc/influxdb"]

CMD ["/usr/bin/influxd","-config","/etc/influxdb/influxdb.conf"]
