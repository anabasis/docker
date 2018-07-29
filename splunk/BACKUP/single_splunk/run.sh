export SPLUNK_CONTAINER_NAME="splunk663"

docker \
  run \
  --detach \
  --name ${SPLUNK_CONTAINER_NAME} \
  --hostname splunk663.localdomain \
  --env SPLUNK_START_ARGS="--accept-license --answer-yes " \
  --publish 18000:8000 \
  splunk663/splunk:1.0;
