export SPLUNK_CONTAINER_NAME="splunk"

docker \
  run \
  --interactive \
  --tty \
  --name ${SPLUNK_CONTAINER_NAME} \
  --hostname splunk.localdomain \
  --env "SPLUNK_USER=root" \
  --env "SPLUNK_START_ARGS=--accept-license  --seed-passwd welcome!1 " \
  --publish 18000:8000 \
  --publish 18089:8089 \
  splunk/splunk:latest;
