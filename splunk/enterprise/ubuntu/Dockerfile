FROM ubuntu:latest
LABEL jscho <jscho@time-gate.com>

ENV SPLUNK_PRODUCT splunk
# ENV SPLUNK_PRODUCT=splunk 같은 문법
ENV SPLUNK_VERSION 8.2.3
ENV SPLUNK_BUILD cd0848707637
ENV SPLUNK_FILENAME splunk-$SPLUNK_VERSION-$SPLUNK_BUILD-Linux-x86_64.tgz
# wget -O splunk-8.2.3-cd0848707637-Linux-x86_64.tgz 'https://download.splunk.com/products/splunk/releases/8.2.3/linux/splunk-8.2.3-cd0848707637-Linux-x86_64.tgz'

ENV SPLUNK_HOME /opt/splunk
ENV SPLUNK_GROUP root
ENV SPLUNK_USER root
ENV SPLUNK_BACKUP_DEFAULT_ETC /var/opt/splunk

WORKDIR /opt
# add splunk:splunk user
#RUN groupadd -r $SPLUNK_GROUP \
#    && useradd -r -m -g $SPLUNK_GROUP $SPLUNK_USER \
#    && echo groupadd -r $SPLUNK_GROUP \
#    && echo useradd -r -m -g $SPLUNK_GROUP $SPLUNK_USER

#RUN yum install -y wget sudo tar net-tools
    #&& wget -O splunk-$SPLUNK_VERSION-$SPLUNK_BUILD-Linux-x86_64.tgz 'https://d7wz6hmoaavd0.cloudfront.net/products/splunk/releases/$SPLUNK_VERSION/linux/splunk-$SPLUNK_VERSION-$SPLUNK_BUILD-Linux-x86_64.tgz'
    # && wget -O splunk-8.1.3-63079c59e632-Linux-x86_64.tgz 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=8.1.3&product=splunk&filename=splunk-8.1.3-63079c59e632-Linux-x86_64.tgz&wget=true'
RUN cd /opt \
  && apt-get update \
  && apt install sudo \
  && sudo apt-get install -y wget tar net-tools

COPY ./file/$SPLUNK_FILENAME /opt/

#COPY $SPLUNK_FILENAME /opt/$SPLUNK_FILENAME
RUN chmod +x /opt/$SPLUNK_FILENAME

RUN tar xvfz $SPLUNK_FILENAME \
  && rm -rf $SPLUNK_FILENAME \
  && yes | cp -f /opt/splunk/etc/splunk-launch.conf.default /opt/splunk/etc/splunk-launch.conf \
  && echo -ne "\nOPTIMISTIC_ABOUT_FILE_LOCKING = 1" >> /opt/splunk/etc/splunk-launch.conf \
  && chmod u+x /etc/sudoers

RUN sudo rm -rf /opt/$SPLUNK_FILENAME

#&& echo -ne "\nsplunk  ALL=(ALL)       ALL" >> /etc/sudoers \
#&& chmod u-x /etc/sudoers \
#&& mkdir -p /var/opt/splunk \
#&& cp -R $SPLUNK_HOME/etc $SPLUNK_BACKUP_DEFAULT_ETC \
#&& rm -fR $SPLUNK_HOME/etc \
#&& chown -R $SPLUNK_USER:$SPLUNK_GROUP $SPLUNK_BACKUP_DEFAULT_ETC \
#&& chown -R $SPLUNK_USER:$SPLUNK_GROUP $SPLUNK_HOME

WORKDIR /opt/splunk

COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod +x /sbin/entrypoint.sh

# Copy new license
COPY ./license/Splunk_NFR_20211205.License /opt/splunk/etc/licenses/Splunk.License

# Ports Splunk Web, Splunk Daemon, KVStore, Splunk Indexing Port, Network Input, HTTP Event Collector
EXPOSE 8000/tcp 8089/tcp 8191/tcp 9997/tcp 1514 8088/tcp

# Configurations folder, var folder for everything (indexes, logs, kvstore)
#VOLUME [ "/opt/splunk/etc", "/opt/splunk/var" ]
#VOLUME /opt/splunk/etc

#ENTRYPOINT ["/sbin/entrypoint.sh"]
#CMD ["start-service"]

#./qemu-system-aarch64 \
#  -serial stdio \
#  -M virt,highmem=off \
#  -accel hvf \
#  -cpu cortex-a72 \
#  -smp 4 \
#  -m 4096 \
#  -bios /path/to/QEMU_EFI.fd \
#  -device virtio-gpu-pci \
#  -display default,show-cursor=on \
#  -device qemu-xhci \
#  -device usb-kbd \
#  -device usb-tablet \
#  -device intel-hda \
#  -device hda-duplex \
#  -drive file=/path/to/Ubuntu.qcow2,if=virtio,cache=writethrough
