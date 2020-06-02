#!/bin/bash

NAME=ft_server
CNAME=narajaon/$NAME

if [ "$(docker container list | grep -c $CNAME)" ]; then
  docker rm --force $NAME
fi

docker build -t $CNAME .
docker run -p 80:80 --name ft_server $CNAME:latest
