export SPLUNK_CONTAINER_NAME="splunkpublic"

docker \
  run \
  --detach \
  --volume /Users/chojunseung/Workings/Containers/splunk/single_splunk/splunk_etc:/opt/splunk/etc \
  --volume /Users/chojunseung/Workings/Containers/splunk/single_splunk/splunk_var:/opt/splunk/var \
  --name ${SPLUNK_CONTAINER_NAME} \
  --hostname splunkpublic.localdomain \
  --env SPLUNK_START_ARGS=--accept-license \
  --publish 18000:8000 \
  splunk/splunk:latest;
