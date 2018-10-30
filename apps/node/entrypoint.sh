#!/bin/ash
set -e

cd /app

npm i

exec "$@"