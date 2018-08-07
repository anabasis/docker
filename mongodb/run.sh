export MONGO_CONTAINER_NAME="mongodb347"

docker \
  run \
  --detach \
  --volume /Users/chojunseung/Workings/Containers/mongodb:/data/db \
  --name ${MONGO_CONTAINER_NAME} \
  --hostname mongodb.localdomain \
  --publish 27017:27017 \
  mongo:3.4.7;
