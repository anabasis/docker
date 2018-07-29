export POSTGRES_CONTAINER_NAME="postgres964"
export POSTGRES_DB="insightboard"
export POSTGRES_USER="admin"
export POSTGRES_PASSWORD="1"


docker \
  run \
  --detach \
  --env POSTGRES_DB=${POSTGRES_DB} \
  --env POSTGRES_USER=${POSTGRES_USER} \
  --env POSTGRES_PASSWORD=${POSTGRES_PASSWORD} \
  --volume /Users/chojunseung/Workings/Containers/postgresql:/var/lib/postgresql/data \
  --name ${POSTGRES_CONTAINER_NAME} \
  --hostname postgresql.localdomain \
  --publish 5432:5432 \
  postgres:9.6.4;
