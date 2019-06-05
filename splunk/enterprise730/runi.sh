export SPLUNK_CONTAINER_NAME="splunk730"

docker \
  run \
  --interactive \
  --tty \
  --volume /Users/chojunseung/Workings/Containers/splunk/splunk730_app:/opt/splunk/etc/apps \
  --name ${SPLUNK_CONTAINER_NAME} \
  --hostname splunk730.localdomain \
  --env "SPLUNK_USER=root" \
  --env "SPLUNK_START_ARGS=--accept-license  --seed-passwd welcome!1 " \
  --publish 28000:8000 \
  --publish 28089:8089 \
  splunk/splunk:7.3.0;
