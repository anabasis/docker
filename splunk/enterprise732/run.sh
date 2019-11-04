export SPLUNK_CONTAINER_NAME="splunk732"
export SPLUNK_VERSION="7.3.2"

docker \
  run \
  --detach \
  --volume /Users/chojunseung/Workings/Containers/splunk/${SPLUNK_CONTAINER_NAME}_app:/opt/splunk/etc/apps \
  --name ${SPLUNK_CONTAINER_NAME} \
  --hostname ${SPLUNK_CONTAINER_NAME}.localdomain \
  --env "SPLUNK_USER=root" \
  --env "SPLUNK_START_ARGS=--accept-license  --seed-passwd welcome!1 " \
  --publish 18000:8000 \
  --publish 18089:8089 \
  splunk/splunk:${SPLUNK_VERSION};
