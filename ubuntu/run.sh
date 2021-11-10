export OS_CONTAINER_NAME="ubuntu"

docker \
  run \
  --detach \
  --name ${OS_CONTAINER_NAME} \
  --hostname ubuntu.localdomain \
  ubuntu/ubuntu:latest;
