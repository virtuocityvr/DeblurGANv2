#!/usr/bin/env bash
docker ps --filter "status=exited" | grep 'weeks ago' | awk '{print $1}' | xargs --no-run-if-empty docker rm
docker ps --filter "status=exited" | grep 'days ago' | awk '{print $1}' | xargs --no-run-if-empty docker rm
docker ps --filter "status=exited" | grep 'hour ago' | awk '{print $1}' | xargs --no-run-if-empty docker rm
docker ps --filter "status=exited" | grep 'hours ago' | awk '{print $1}' | xargs --no-run-if-empty docker rm
docker ps --filter "status=exited" | grep 'minutes ago' | awk '{print $1}' | xargs --no-run-if-empty docker rm
docker images --filter "dangling=true" | awk '{print $3}' | xargs --no-run-if-empty docker rmi
docker images -aq -f 'dangling=true' | xargs docker rmi -f
docker images -a|grep '^<n one>'|tr -s ' '|cut -d' ' -f 3|xargs docker rmi