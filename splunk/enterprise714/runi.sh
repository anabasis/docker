export SPLUNK_CONTAINER_NAME="splunkpublic"

docker \
  run \
  --interactive \
  --tty \
  --volume /Users/chojunseung/Workings/Repos/git/splunk_app:/opt/splunk/etc/apps \
  --name ${SPLUNK_CONTAINER_NAME} \
  --hostname splunkpublic.localdomain \
  --env "SPLUNK_USER=root" \
  --env "SPLUNK_START_ARGS=--accept-license  --seed-passwd welcome!1 " \
  --publish 18000:8000 \
  --publish 18089:8089 \
  splunk/splunk:7.1.4;
