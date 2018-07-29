export REGISTRY_CONTAINER_NAME="docker-registry"

docker \
  run \
  --detach \
  --name ${REGISTRY_CONTAINER_NAME} \
  --volume /Users/chojunseung/Workings/Containers/registry:/tmp/registry \
  --hostname registry.localdomain \
  --publish 5000:5000 \
  registry:latest;
