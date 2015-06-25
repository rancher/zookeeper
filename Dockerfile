FROM debian:jessie

RUN apt-get update && \
    apt-get install -y --no-install-recommends openjdk-7-jre-headless

ADD entry.sh /entry.sh

ADD zoo.cfg.toml /etc/confd/conf.d/
ADD myid.toml /etc/confd/conf.d/
ADD myid.tmpl /etc/confd/templates/
ADD zoo.cfg.tmpl /etc/confd/templates/

ADD http://mirror.metrocast.net/apache/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz /opt/
RUN cd /opt && \
    tar -zxvf zookeeper-3.4.6.tar.gz && \
    mv zookeeper-3.4.6 zookeeper && \
    rm -rf ./zookeeper-*tar.gz && \
    mkdir -p /var/lib/zookeeper

ADD https://github.com/kelseyhightower/confd/releases/download/v0.9.0/confd-0.9.0-linux-amd64 /confd
RUN chmod +x /confd

WORKDIR /opt/zookeeper
EXPOSE 2181 2888 3888
VOLUME ["/opt/zookeeper/conf", "/tmp/zookeeper"]

ENTRYPOINT ["/entry.sh"]
