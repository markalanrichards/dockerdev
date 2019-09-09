#!/usr/bin/env bash
set -xe

source /opt/docker-compose/bin/activate
cd /opt/docker-compose/compose
docker-compose build --pull --no-cache

