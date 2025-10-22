#!/bin/bash

# Automated MySQL/MariaDB Backup Script
# Creates compressed backups with rotation

# Configuration
BACKUP_DIR="/backup/mysql"
MYSQL_USER="backup_user"
MYSQL_PASSWORD="your_password"
DATABASES="all" # or specify: "db1 db2 db3"
RETENTION_DAYS=7
DATE=$(date +%Y%m%d_%H%M%S)

echo "🗄️  Starting MySQL Backup - $DATE"

# Create backup directory
mkdir -p $BACKUP_DIR

if [ "$DATABASES" = "all" ]; then
    # Backup all databases
    echo "Backing up all databases..."
    mysqldump -u$MYSQL_USER -p$MYSQL_PASSWORD --all-databases | gzip > $BACKUP_DIR/full_backup_$DATE.sql.gz
else
    # Backup specific databases
    for DB in $DATABASES; do
        echo "Backing up database: $DB"
        mysqldump -u$MYSQL_USER -p$MYSQL_PASSWORD $DB | gzip > $BACKUP_DIR/${DB}_backup_$DATE.sql.gz
    done
fi

# Clean old backups
echo "Cleaning backups older than $RETENTION_DAYS days..."
find $BACKUP_DIR -name "*.sql.gz" -mtime +$RETENTION_DAYS -delete

# Verify backup
if [ -f "$BACKUP_DIR/full_backup_$DATE.sql.gz" ] || [ -n "$(ls $BACKUP_DIR/*_backup_$DATE.sql.gz 2>/dev/null)" ]; then
    echo "✅ Backup completed successfully"
    echo "📁 Backup location: $BACKUP_DIR"
    ls -lh $BACKUP_DIR/*_backup_$DATE.sql.gz
else
    echo "❌ Backup failed!"
    exit 1
fi
