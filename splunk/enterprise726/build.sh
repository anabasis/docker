#https://docs.docker.com/engine/reference/commandline/build/
if [ -z $CURRENT ]; then
	CURRENT=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
fi
echo CURRENT

docker build --no-cache=true -t splunk/splunk:7.2.6 .
#docker tag splunk/splunk:7.2.3 splunk/splunk:latest
#docker tag splunk/splunk:7.2.3 registry.splunk.com/splunk/splunk:latest
#docker tag splunk/splunk:7.2.3 registry.splunk.com/splunk/splunk:7.2.3

#[Splunk Enterprise]
#wget -O splunk-7.2.3-be11b2c46e23-Linux-x86_64.tgz 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=7.2.3&product=splunk&filename=splunk-7.2.3-be11b2c46e23-Linux-x86_64.tgz&wget=true'

#[UF]
#wget -O splunkforwarder-7.2.3-be11b2c46e23-Linux-x86_64.tgz 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=7.2.3&product=universalforwarder&filename=splunkforwarder-7.2.3-be11b2c46e23-Linux-x86_64.tgz&wget=true'

#[Splunk Enterprise]
#wget -O splunk-7.1.4-5a7a840afcb3-Linux-x86_64.tgz 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=7.1.4&product=splunk&filename=splunk-7.1.4-5a7a840afcb3-Linux-x86_64.tgz&wget=true'

#[UF]
#wget -O splunkforwarder-7.1.4-5a7a840afcb3-Linux-x86_64.tgz 'https://www.splunk.com/page/download_track?file=7.1.4/linux/splunkforwarder-7.1.4-5a7a840afcb3-Linux-x86_64.tgz&ac=&wget=true&name=wget&platform=Linux&architecture=x86_64&version=7.1.4&product=universalforwarder&typed=release'
