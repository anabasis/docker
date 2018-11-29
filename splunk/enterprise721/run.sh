export SPLUNK_CONTAINER_NAME="splunkpublic"

docker \
  run \
  --detach \
  --volume /Users/chojunseung/Workings/Repos/git/splunk_app:/opt/splunk/etc/apps \
  --name ${SPLUNK_CONTAINER_NAME} \
  --hostname splunkpublic.localdomain \
  --env "SPLUNK_START_ARGS=--accept-license  --seed-passwd welcome!1 " \
  --env "SPLUNK_USER=root" \
  --publish 18000:8000 \
  --publish 18089:8089 \
  splunk/splunk:7.1.2;
