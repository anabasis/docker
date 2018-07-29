FROM centos:7.3.1611
MAINTAINER jscho <jscho@time-gate.com>

ENV SPLUNK_PRODUCT splunk
ENV SPLUNK_VERSION 6.6.3
ENV SPLUNK_BUILD e21ee54bc796
ENV SPLUNK_FILENAME splunk-${SPLUNK_VERSION}-${SPLUNK_BUILD}-Linux-x86_64.tgz

ENV SPLUNK_HOME /opt/splunk
ENV SPLUNK_GROUP splunk
ENV SPLUNK_USER splunk
ENV SPLUNK_BACKUP_DEFAULT_ETC /var/opt/splunk

# add splunk:splunk user
#RUN groupadd -r ${SPLUNK_GROUP} \
#    && useradd -r -m -g ${SPLUNK_GROUP} ${SPLUNK_USER}
RUN groupadd -r ${SPLUNK_GROUP}
RUN useradd -r -m -g ${SPLUNK_GROUP} ${SPLUNK_USER}

RUN yum install -y wget \
WORKDIR cd /opt \

RUN wget -O ${SPLUNK_FILENAME} 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=${SPLUNK_VERSION}&product=splunk&filename=${SPLUNK_FILENAME}&wget=true' \
RUN tar xvfz ${SPLUNK_FILENAME} \
RUN rm -rf ${SPLUNK_FILENAME} \
RUN chown -R ${SPLUNK_USER}:${SPLUNK_GROUP} ${SPLUNK_HOME} \

COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod +x /sbin/entrypoint.sh

# Ports Splunk Web, Splunk Daemon, KVStore, Splunk Indexing Port, Network Input, HTTP Event Collector
EXPOSE 8000/tcp 8089/tcp 8191/tcp 9997/tcp 1514 8088/tcp

WORKDIR /opt/splunk

# Configurations folder, var folder for everything (indexes, logs, kvstore)
VOLUME [ "/opt/splunk/etc", "/opt/splunk/var" ]

ENTRYPOINT ["/sbin/entrypoint.sh"]
CMD ["start-service"]
