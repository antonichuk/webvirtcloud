#!/usr/bin/env bash
set -e

docker-compose -f compose-dev-backend.yml exec backend python3 manage.py migrate