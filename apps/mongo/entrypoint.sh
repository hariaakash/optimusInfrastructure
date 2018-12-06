#!/bin/sh

# Make sure that database is owned by user mongodb
[ "$(stat -c %U /data/db)" = mongodb ] || chown -R mongodb /data/db

#!/bin/sh

# Database owned by mongodb
[ "$(stat -c %U /data/db)" = mongodb ] || chown -R mongodb /data/db

mongod --fork --logpath /data/logs/mongodb.log --config /etc/mongod.conf

mongo admin --eval \
    "db.createUser({user: 'root',
        pwd: '12345678',
        roles: [{role: 'root', db: 'admin'}]
    });"

mongod --shutdown

exec mongod --bind_ip 0.0.0.0 --config /etc/mongod.conf