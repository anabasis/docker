export SPLUNK_CONTAINER_NAME="splunk726"

docker \
  run \
  --detach \
  --volume /Users/chojunseung/Workings/Repos/git/splunk726_app:/opt/splunk/etc/apps \
  --name ${SPLUNK_CONTAINER_NAME} \
  --hostname splunk726.localdomain \
  --env "SPLUNK_USER=root" \
  --env "SPLUNK_START_ARGS=--accept-license  --seed-passwd welcome!1 " \
  --publish 28000:8000 \
  --publish 28089:8089 \
  splunk/splunk:7.2.6;