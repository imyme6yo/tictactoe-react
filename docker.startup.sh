#!/bin/sh
# @AUTHOR: imyme6yo "imyme6yo@gmail.com"
# @DRAFT: 20200320

# remove docker image
docker ps -a | grep tictactoe | awk '{print $1}'| xargs docker stop
# stop & rm docker container
docker ps -a | grep tictactoe | awk '{print $1}'| xargs docker rm
docker images | grep tictactoe | awk '{print $3}'| xargs docker rmi
# build image
docker build -t tictactoe:dev .
# run container
docker run --rm -it -v $(pwd):/code -p 9214:3000  tictactoe:dev sh /code/startup.sh