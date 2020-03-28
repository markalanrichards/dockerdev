#!/usr/bin/env bash
set -xe

source /opt/docker-compose/bin/activate
cd /opt/docker-compose/compose
docker-compose down
docker-compose build --pull --no-cache
docker-compose up --force-recreate -d
docker system prune -a -f
