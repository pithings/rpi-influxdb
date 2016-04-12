FROM resin/rpi-raspbian:jessie

ENV INFLUXDB_VERSION 0.12.0
ADD package/influxdb_${INFLUXDB_VERSION}_armhf.deb /tmp/influxdb_${INFLUXDB_VERSION}_armhf.dep
RUN mkdir -p /var/lib/influxdb
RUN mkdir -p /var/log/influxdb
RUN dpkg -i /tmp/influxdb_${INFLUXDB_VERSION}_armhf.dep && \
  rm /tmp/influxdb_${INFLUXDB_VERSION}_armhf.dep && \
  rm -rf /var/lib/apt/lists/*

EXPOSE 8083
EXPOSE 8086
#EXPOSE 8099

VOLUME ["/etc/influxdb"]

CMD ["/usr/bin/influxd","-config","/etc/influxdb/influxdb.conf"]
