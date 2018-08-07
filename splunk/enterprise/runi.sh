export SPLUNK_CONTAINER_NAME="splunkpublic"

docker \
  run \
  --interactive \
  --tty \
  --volume /Users/chojunseung/Workings/Containers/splunk/splunk_repo/splunk_etc:/opt/splunk/etc \
  --name ${SPLUNK_CONTAINER_NAME} \
  --hostname splunkpublic.localdomain \
  --env "SPLUNK_START_ARGS=--accept-license  --seed-passwd welcome!1 " \
  --env "SPLUNK_USER=root" \
  --publish 18000:8000 \
  splunk/splunk:7.1.2;
