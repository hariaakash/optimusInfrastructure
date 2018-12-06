#!/bin/sh

# Make sure that database is owned by user mongodb
[ "$(stat -c %U /data/db)" = mongodb ] || chown -R mongodb /data/db

#!/bin/sh

# Database owned by mongodb
[ "$(stat -c %U /data/db)" = mongodb ] || chown -R mongodb /data/db

echo "Start Mongo"
mongod --fork --logpath /data/logs/mongodb.log

echo "Exec Mongo"
mongo admin --eval \
    "db.createUser({user: 'root',
        pwd: '12345678',
        roles: [{role: 'root', db: 'admin'}]
    });"

echo "Stop Mongo"
mongod --shutdown

echo "Start Mongo"
exec mongod --bind_ip 0.0.0.0