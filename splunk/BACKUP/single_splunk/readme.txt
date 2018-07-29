docker search splunk

docker pull httpd:2.2.34
docker pull httpd:2.4.27
docker pull tomcat:7.0.79-jre7
docker pull tomcat:7.0.79-jre8
docker pull tomcat:8.0.45-jre7
docker pull tomcat:8.0.45-jre8
docker pull tomcat:9.0.0.M26-jre8

docker pull mysql:8.0.2
docker pull postgres:9.6.4

docker pull centos:6.9
docker pull centos:7.3.1611
docker pull ubuntu:17.10

docker images

docker run --name centos6 -i -t centos:6.9 /bin/bash
docker run --name centos7 -i -t centos:7.3.1611 /bin/bash
docker run --name centos6 --hostname centos6.localdomain -i -t centos:6.9 /bin/bash
docker run --name centos7 --hostname centos7.localdomain -i -t centos:7.3.1611 /bin/bash

docker ps -a

docker start centos6
docker restart centos6
docker stop centos6
docker attach centos6

docker start centos7
docker restart centos7
docker stop centos7
docker attach centos7

docker exec centos7 echo "Hello World"

[DOCKER Splunk 설치]

docker run --name splunk663test --hostname splunk663.centos7 -p 18000:8000 -i -t centos:7.3.1611 /bin/bash
cd /opt
yum install -y wget
yum install -y sudo

groupadd -r splunk
useradd -r -m -g splunk splunk

wget -O splunk-6.6.3-e21ee54bc796-Linux-x86_64.tgz 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=6.6.3&product=splunk&filename=splunk-6.6.3-e21ee54bc796-Linux-x86_64.tgz&wget=true'
tar xvfz splunk-6.6.3-e21ee54bc796-Linux-x86_64.tgz
rm -rf splunk-6.6.3-e21ee54bc796-Linux-x86_64.tgz

chown -R splunk:splunk splunk

export SPLUNK_HOME=/opt/splunk

#cp -f $SPLUNK_HOME/etc/splunk-launch.conf.default $SPLUNK_HOME/etc/splunk-launch.conf
yes | cp -f $SPLUNK_HOME/etc/splunk-launch.conf.default $SPLUNK_HOME/etc/splunk-launch.conf
echo -ne "\nOPTIMISTIC_ABOUT_FILE_LOCKING = 1" >> $SPLUNK_HOME/etc/splunk-launch.conf

vi $SPLUNK_HOME/etc/splunk-launch.conf

$SPLUNK_HOME/etc/splunk-launch.conf:
OPTIMISTIC_ABOUT_FILE_LOCKING = 1

export SPLUNK_PRODUCT=splunk
export SPLUNK_VERSION=6.6.3
export SPLUNK_BUILD=e21ee54bc796
export SPLUNK_FILENAME=splunk-${SPLUNK_VERSION}-${SPLUNK_BUILD}-Linux-x86_64.tgz

export SPLUNK_HOME=/opt/splunk
export SPLUNK_GROUP=splunk
export SPLUNK_USER=splunk
export SPLUNK_BACKUP_DEFAULT_ETC=/var/opt/splunk
export SPLUNK_START_ARGS=--accept-license

./splunk start

docker build -t splunk663/splunk:1.0 .
docker build -t splunk/splunk:7.1.2 .

ps -elf | grep sosal | grep exec | awk '{print $1,$2,$3,$4,$5}'
docker ps -a | grep " hours ago" | awk '{print $1}'
docker images | grep " hours ago" | awk '{print $3}'

torm=`docker ps -a | grep " hours ago" | awk '{print $1}'`; docker rm $torm;
torm=`docker images | grep " hours ago" | awk '{print $3}'`; docker rmi $torm;

docker run -i -t --env SPLUNK_START_ARGS=--accept-license splunk663/splunk:1.0 /sbin/entrypoint.sh splunk-bash
docker run -i -t --env SPLUNK_START_ARGS=--accept-license splunk663/splunk:1.0 /bin/bash
docker run -i -t --env SPLUNK_START_ARGS=--accept-license splunk663/splunk:1.0 /sbin/entrypoint.sh start-service

docker attach splunk663

docker run -i -t --env SPLUNK_START_ARGS=--accept-license splunk/splunk /sbin/entrypoint.sh splunk-bash
docker run -i -t --env SPLUNK_START_ARGS=--accept-license splunk/splunk /bin/bash
docker run -i -t --env SPLUNK_START_ARGS=--accept-license splunk/splunk /sbin/entrypoint.sh start-service
