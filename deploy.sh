# config DOCKER_USER and DOCKER_PASS in jenkins env. 


#!/bin/bash
echo $DOCKERHUB_CREDS_PSW | docker login --username $DOCKERHUB_CREDS_USR --password-stdin
docker ps -q -f name=todo | xargs --no-run-if-empty docker stop && docker ps -a -q -f name=todo | xargs --no-run-if-empty docker rm
docker pull meameasuki/test-react-todo-frontend
docker run --name todo -dp 8000:80 meameasuki/test-react-todo-frontend

