#https://docs.docker.com/engine/reference/commandline/build/
if [ -z $CURRENT ]; then
	CURRENT=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
fi
echo CURRENT

docker build --no-cache=true -t splunk/splunk:7.1.4 .
#docker tag splunk/splunk:7.1.4 splunk/splunk:latest
#docker tag splunk/splunk:7.1.4 registry.splunk.com/splunk/splunk:latest
#docker tag splunk/splunk:7.1.4 registry.splunk.com/splunk/splunk:7.1.4
