#!/bin/bash
set -m

wget -O mongo.tgz https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-rhel70-${VERSION}.tgz 
tar -xvf mongo.tgz -C /usr/local --strip-components=1 
rm -f mongo.tgz

mongodb_cmd="mongod --storageEngine wiredTiger"
if [ "${RS_NAME}" != "**None**" ]; then
	cmd="$mongodb_cmd --dbpath /var/lib/mongo --directoryperdb --replSet ${RS_NAME}"
else
	cmd="$mongodb_cmd --dbpath /var/lib/mongo --directoryperdb"
fi
$cmd &
fg
