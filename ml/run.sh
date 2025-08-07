export OS_CONTAINER_NAME="mlcslac"

docker \
  run \
  --detach \
  --name ${OS_CONTAINER_NAME} \
  --hostname ml.localdomain \
  mlcslac/mlcslac:latest;
