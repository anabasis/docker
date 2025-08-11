
export MYSQL_DATABASE="mysql"
export MYSQL_CONTAINER_NAME="mysql"
export MYSQL_USER="admin"
export MYSQL_ROOT_PASSWORD="1"
export MYSQL_PASSWORD="1"

docker \
  run \
  --detach \
  --volume ~/Working/Containers/mysql:/var/lib/mysql \
  --env MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} \
  --env MYSQL_USER=${MYSQL_USER} \
  --env MYSQL_PASSWORD=${MYSQL_PASSWORD} \
  --env MYSQL_DATABASE=${MYSQL_DATABASE} \
  --name ${MYSQL_CONTAINER_NAME} \
  --hostname mysql.localdomain \
  --publish 3306:3306 \
  mysql:latest;
