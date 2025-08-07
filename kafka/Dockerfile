FROM centos:7.4.1708
MAINTAINER jscho <jscho@time-gate.com>

ENV ZOOKEEPER_PRODUCT zookeeper
ENV ZOOKEEPER_VERSION 3.4.12
ENV ZOOKEEPER_FILENAME zookeeper-3.4.12.tar.gz
ENV ZOOKEEPER_HOME /opt/zookeeper
ENV ZOOKEEPER_GROUP root
ENV ZOOKEEPER_USER root
ENV ZOOKEEPER_BACKUP_DEFAULT_ETC /var/opt/zookeeper

RUN echo $ZOOKEEPER_VERSION \
    && echo $ZOOKEEPER_FILENAME

WORKDIR /opt

RUN cd /opt

RUN yum install -y wget sudo tar net-tools java-1.8.0-openjdk \
  && wget http://apache.mirror.cdnetworks.com/zookeeper/stable/zookeeper-3.4.12.tar.gz

##COPY $ZOOKEEPER_FILENAME /opt/$ZOOKEEPER_FILENAME
RUN chmod +x /opt/$ZOOKEEPER_FILENAME

#WORKDIR /opt/splunk

#COPY entrypoint.sh /sbin/entrypoint.sh
#RUN chmod +x /sbin/entrypoint.sh

# Ports Splunk Web, Splunk Daemon, KVStore, Splunk Indexing Port, Network Input, HTTP Event Collector
#EXPOSE 8000/tcp 8089/tcp 8191/tcp 9997/tcp 1514 8088/tcp

#ENTRYPOINT ["/sbin/entrypoint.sh"]
#CMD ["start-service"]

ENV LANG=ko_KR.utf8 TZ=Asia/Seoul

# 컨테이너 실행시 실행될 명령
CMD ["/bin/bash"]
