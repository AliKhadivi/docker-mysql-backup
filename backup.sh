#!/bin/bash
echo " |------------------------| "
echo " | Start backup creating! | "
BACKUP=/backup
NOW="$(date +"%d-%m-%Y_%H%M")"
OLD="$(date +"%d-%m-%Y" -d '-7 day')"
# create directory
mkdir -p "$BACKUP/sql/$NOW/"
# all databases
mysqldump -u root --host=$MYSQL_PORT_3306_TCP_ADDR --protocol=$MYSQL_PORT_3306_TCP_PROTO --password=$MPASS --all-databases --single-transaction > "$BACKUP/sql/$NOW/all_databases.sql"
# backup each base of the database
DBS="$(mysql -u $MUSER --host=$MYSQL_PORT_3306_TCP_ADDR --protocol=$MYSQL_PORT_3306_TCP_PROTO -p$MPASS -Bse 'show databases')"
for db in $DBS
do
	mysqldump -u root --host=$MYSQL_PORT_3306_TCP_ADDR --protocol=$MYSQL_PORT_3306_TCP_PROTO --password=$MPASS $db --single-transaction > "$BACKUP/sql/$NOW/$db.sql"
done
# delete old sql
rm -r $BACKUP/sql/$OLD*


echo " |------------------------| "
echo " |  -> Backup created!    | "
echo " |------------------------| "
echo " |     Backup Paths:      | "
for db in $DBS
do
	echo " | -> sql/$NOW/$db.sql "
done
echo " |------------------------| "
echo " |          Bye!          | "
echo " | Powered By Ali Khadivi | "
echo " |------------------------| "

