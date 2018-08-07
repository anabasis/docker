export JENKINS_CONTAINER_NAME="jenkins"

docker \
  run \
  --detach \
  --volume /Users/chojunseung/Workings/Containers/jenkins:/var/jenkins_home \
  --name ${JENKINS_CONTAINER_NAME} \
  --hostname jenkins.localdomain \
  --publish 18080:8080 \
  --publish 50000:50000 \
  jenkins;
