#!/bin/bash

# Add the backup dir location, MySQL root password, MySQL and mysqldump location
DATE=$(date +%d-%m-%Y)
BACKUP_DIR="/app/mysql"
MYSQL_USER="apdev"
MYSQL_PASSWORD="Aut0t@t321"

# To create a new directory in the backup directory location based on the date
mkdir -p $BACKUP_DIR/BACKUPS/$DATE

#Connecting MySQL"
echo "Connecting the MySQL"
id=`docker ps | grep mysql | awk '{print $1}'`
#docker exec -it $id mysql --user=keycloak --password=password keycloak

# To dump each database in a separate file
#docker exec -it $id  mysqldump -u keycloak -p password  --databases keycloak --single-transaction --quick --lock-tables=false > /data_dump.sql

docker exec -it $id  mysqldump -u apdev  --password=Aut0t@t321  --all-databases --single-transaction --quick --lock-tables=false > $BACKUP_DIR/BACKUPS/$DATE/data_dump.sql

#docker cp $id:/keycloak.sql $BACKUP_DIR/BACKUPS/$DATE


