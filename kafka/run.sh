export KAFKA_CONTAINER_NAME="kafka2112"

docker \
  run \
  --detach \
#  --volume /Users/chojunseung/Workings/Repos/git/splunk_app:/opt/splunk/etc/apps \
  --name ${KAFKA_CONTAINER_NAME} \
  --hostname kafka2112.localdomain \
#  --env "SPLUNK_USER=root" \
#  --env "SPLUNK_START_ARGS=--accept-license  --seed-passwd welcome!1 " \
#  --publish 18000:8000 \
#  --publish 18089:8089 \
  kafka/kafka:2.11.2;
