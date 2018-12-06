export KAFKA_CONTAINER_NAME="kafka2112"

docker \
  run \
  --interactive \
  --tty \
  --name ${KAFKA_CONTAINER_NAME} \
  --hostname kafka2112.localdomain \
  kafka/kafka:2.11.2;
