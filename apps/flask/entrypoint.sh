#!/bin/ash
set -e

cd /app

pip install -r requirements.txt

exec "$@"