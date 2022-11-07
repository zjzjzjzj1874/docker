#!/bin/bash

for port in $(seq 6379 6384); do
  export PORT="${port}"
  mkdir -p node-"${port}"/conf
  PORT=${port} envsubst <redis-cluster.tmpl >node-"${port}"/conf/redis.conf
  mkdir -p node-"${port}"/data
done
