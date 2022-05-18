# Docker Mysql backup

## Build image
```bash
sudo docker build -t mysqlbk
```

## Create Backup
```bash
sudo docker run --rm -v /opt/mysql-backup/:/backup mysqlbk
```
* backup path: `/opt/mysql-backup/`


