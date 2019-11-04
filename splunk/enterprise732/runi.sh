export SPLUNK_CONTAINER_NAME="splunk732"
export SPLUNK_VERSION="7.3.2"

docker \
  run \
  --interactive \
  --tty \
  --volume /Users/chojunseung/Workings/Containers/splunk/${SPLUNK_CONTAINER_NAME}_app:/opt/splunk/etc/apps \
  --name ${SPLUNK_CONTAINER_NAME} \
  --hostname splunk732.localdomain \
  --env "SPLUNK_USER=root" \
  --env "SPLUNK_START_ARGS=--accept-license  --seed-passwd welcome!1 " \
  --publish 28000:8000 \
  --publish 28089:8089 \
  splunk/splunk:${SPLUNK_VERSION};
