export NGINX_CONTAINER_NAME="nginxweb"

sudo docker \
  run \
  --detach \
  --volume /Users/chojunseung/Workings/Containers/nginx:/etc/nginx \
  --name ${NGINX_CONTAINER_NAME} \
  --hostname nginx.localdomain \
  --publish 8080:80 \
  nginx:latest;
