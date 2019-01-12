export SPLUNK_CONTAINER_NAME="splunk723"

docker \
  run \
  --detach \
  --volume /Users/chojunseung/Workings/Repos/git/splunk723_app:/opt/splunk/etc/apps \
  --name ${SPLUNK_CONTAINER_NAME} \
  --hostname splunk723.localdomain \
  --env "SPLUNK_USER=root" \
  --env "SPLUNK_START_ARGS=--accept-license  --seed-passwd welcome!1 " \
  --publish 28000:8000 \
  --publish 28089:8089 \
  splunk/splunk:7.2.3;
