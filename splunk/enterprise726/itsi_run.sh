export SPLUNK_CONTAINER_NAME="splunk726itsi"

docker \
  run \
  --detach \
  --volume /Users/chojunseung/Workings/Repos/git/splunk726_itsi:/opt/splunk/etc/apps \
  --name ${SPLUNK_CONTAINER_NAME} \
  --hostname splunk726itsi.localdomain \
  --env "SPLUNK_USER=root" \
  --env "SPLUNK_START_ARGS=--accept-license  --seed-passwd welcome!1 " \
  --publish 38000:8000 \
  --publish 38089:8089 \
  splunk/splunk:7.2.6;
