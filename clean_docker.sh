#!/bin/bash
case $1 in
  'containers')
    STATUS=$2
    docker rm $(docker ps -a -q -f status=$STATUS) ;;
  'images')
    REPO_PATTERN=$2
    TAG=$3
    docker rmi $(docker images |grep ${REPO_PATTERN} |grep $TAG |awk '{print $3}') ;;
esac

