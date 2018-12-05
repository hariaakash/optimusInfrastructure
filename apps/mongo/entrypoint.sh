#!/bin/sh

# Make sure that database is owned by user mongodb
[ "$(stat -c %U /data/db)" = mongodb ] || chown -R mongodb /data/db

exec mongod --bind_ip 0.0.0.0