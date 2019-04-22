#!/bin/ash
set -e

cd /app/function

npm i

cd /app

exec "$@"