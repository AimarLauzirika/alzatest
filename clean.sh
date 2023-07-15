#!/bin/bash

APP_CONTAINER_NAME=integration-test

if [ ($(docker ps -a | grep $APP_CONTAINER_NAME)) != 0 ]
then
  echo true
else
  echo false
fi

# if [ $(docker ps -a | grep $APP_CONTAINER_NAME) != 0 ]
# then
#   echo "hay contenedores"
#   docker stop $(APP_CONTAINER_NAME)
#   docker rm $(APP_CONTAINER_NAME)
# else
#   echo "no hay contenedores"
# fi