#!/bin/ash
set -e

cd /app

if [[ -n "$GIT_URL" ]]; then
    wget --no-check-certificate -O master.zip $GIT_URL/archive/master.zip && \
        unzip master.zip && \
        rm master.zip && \
        mv $GIT_REPO-master/* . && \
        rm -rf $GIT_REPO-master
fi

exec "$@"