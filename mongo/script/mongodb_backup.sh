#!/bin/sh

export CONTAINER_ID=`docker ps | grep mongo | awk '{print $1}'`
export DATABASE_NAME="flashcorp"
export BACKUP_LOCATION="/docker/mongodb/backups"

export TIMESTAMP=$(date +'%Y%m%d%H%M%S')

cd /docker/mongo
docker exec -t ${CONTAINER_ID} mongodump --out /data/${DATABASE_NAME}-backup-${TIMESTAMP} --db ${DATABASE_NAME} --username=flashcorp --authenticationDatabase=flashcorp --password=flashcorp@2021
docker cp ${CONTAINER_ID}:/data/${DATABASE_NAME}-backup-${TIMESTAMP} ${BACKUP_LOCATION}/${TIMESTAMP}



