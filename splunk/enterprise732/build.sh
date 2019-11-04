export SPLUNK_VERSION=7.3.2

#https://docs.docker.com/engine/reference/commandline/build/
if [ -z $CURRENT ]; then
	CURRENT=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
fi
echo CURRENT

docker build --no-cache=true -t splunk/splunk:${SPLUNK_VERSION} .
#docker tag splunk/splunk:7.3.0 splunk/splunk:latest

#[Splunk Enterprise]
#wget -O splunk-7.3.2-c60db69f8e32-darwin-64.tgz 'https://www.splunk.com/page/download_track?file=7.3.2/osx/splunk-7.3.2-c60db69f8e32-darwin-64.tgz&ac=&wget=true&name=wget&platform=MacOS&architecture=x86&version=7.3.2&product=splunk&typed=release'
#wget -O splunk-7.3.2-c60db69f8e32-Linux-x86_64.tgz 'https://www.splunk.com/page/download_track?file=7.3.2/linux/splunk-7.3.2-c60db69f8e32-Linux-x86_64.tgz&ac=&wget=true&name=wget&platform=Linux&architecture=x86_64&version=7.3.2&product=splunk&typed=release'

#[UF]
#wget -O splunkforwarder-7.3.0-657388c7a488-Linux-x86_64.tgz 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=7.3.0&product=universalforwarder&filename=splunkforwarder-7.3.0-657388c7a488-Linux-x86_64.tgz&wget=true'

