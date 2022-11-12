#!/usr/bin/env bash
set -e

docker-compose -f compose-dev-backend.yml up -d
sleep 5
docker-compose -f compose-dev-backend.yml exec mariadb mysql -uroot -proot -e "CREATE DATABASE webvirtcloud CHARACTER SET utf8 COLLATE utf8_general_ci"
docker-compose -f compose-dev-backend.yml exec backend python3 manage.py migrate
docker-compose -f compose-dev-backend.yml exec backend bash -c "python3 manage.py loaddata */fixtures/*.json"
