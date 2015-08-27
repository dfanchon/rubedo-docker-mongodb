#!/bin/bash
set -m

wget -O mongo.tgz https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-rhel70-${VERSION}.tgz 
tar -xvf mongo.tgz -C /usr/local --strip-components=1 
rm -f mongo.tgz

mongodb_cmd="mongod --storageEngine wiredTiger --dbpath /var/lib/mongo --directoryperdb"

if [ "${RS_NAME}" != "" ]; then
    cmd="$cmd --replSet ${RS_NAME}"
fi

$cmd &
fg
