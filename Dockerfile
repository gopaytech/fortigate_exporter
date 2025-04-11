ARG ARCH="arm64"
ARG OS="linux"
FROM quay.io/prometheus/busybox-${OS}-${ARCH}:glibc
LABEL maintainer="The Prometheus Authors <prometheus-developers@googlegroups.com>"

ARG ARCH="arm64"
ARG OS="linux"
ARG FORTIGATE_KEY_FILE
COPY .build/${OS}-${ARCH}/fortigate_exporter /bin/fortigate_exporter
COPY $FORTIGATE_KEY_FILE /fortigate-key.yaml

EXPOSE      9710
USER        nobody
ENTRYPOINT  [ "/bin/fortigate_exporter" ]
