#https://docs.docker.com/engine/reference/commandline/build/
if [ -z $CURRENT ]; then
	CURRENT=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
fi
echo CURRENT

docker buildx build --platform=linux/arm64/v8 --no-cache=true -t splunk/splunk:latest ./
#docker build --no-cache=true -t splunk/splunk:latest ./
## --no-cache 캐쉬없이 재빌드, -t 태그, ./ Dockerfile 위치
