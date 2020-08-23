#!/bin/bash

NAME=ft_server
CNAME=narajaon/$NAME
SRCS=srcs

# DOWNLOAD WORDPRESS
if ! [ "$(find . -name latest.tar.gz)" ]; then
  echo "downloading wordpress"
  wget https://wordpress.org/latest.tar.gz > /dev/null 2>&1
  rm -rf wordpress
  echo "decompressing wordpress"
  tar -xzvf latest.tar.gz > /dev/null 2>&1
else
  echo "wordpress is already present, proceding installation"
fi

# CLEAN DIRECTORY
[ ! "$(ls $SRCS | grep -c wordpress)" ] && mv wordpress/* $SRCS
rm -rf latest.tar.gz.1

# KILL PREVIOUS DOCKER
if [ "$(docker container list | grep -c $CNAME)" ]; then
  docker rm --force $NAME
fi

# LAUNCH DOCKER
docker build -t $CNAME .
docker run -it -p 80:80 --name ft_server -e MYSQL_ROOT_PASSWORD=testpwd $CNAME:latest bash
