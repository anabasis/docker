export OS_CONTAINER_NAME="ubuntu"

docker \
  run \
  --interactive \
  --tty \
  --name ${OS_CONTAINER_NAME} \
  --hostname ubuntu.localdomain \
  ubuntu/ubuntu:latest;
