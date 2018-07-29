export MYSQL_USER="admin"
export MYSQL_DATABASE="insightboard"
export MYSQL_CONTAINER_NAME="mysql802"
export MYSQL_ROOT_PASSWORD="1"
export MYSQL_PASSWORD="1"

docker \
  run \
  --detach \
  --volume /Users/chojunseung/Workings/Containers/mysql:/var/lib/mysql \
  --env MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} \
  --env MYSQL_USER=${MYSQL_USER} \
  --env MYSQL_PASSWORD=${MYSQL_PASSWORD} \
  --env MYSQL_DATABASE=${MYSQL_DATABASE} \
  --name ${MYSQL_CONTAINER_NAME} \
  --hostname mysql.localdomain \
  --publish 3306:3306 \
  mysql:8.0.2;
