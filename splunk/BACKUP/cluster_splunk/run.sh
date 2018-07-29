export SPLUNK_CONTAINER_NAME="portainer"

docker \
  run \
  --detach \
  --volume /var/run/docker.sock:/var/run/docker.sock \
  --name ${PORTAINER_CONTAINER_NAME} \
  --hostname portainer.localdomain \
  --publish 9000:9000 \
  portainer/portainer;
