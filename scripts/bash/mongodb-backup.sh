#!/bin/bash

BACKUP_ROOT=/var/backups/mongodb
DATE=$(date +%F_%H%M%S)

mkdir -p "$BACKUP_ROOT"

mongodump --out "$BACKUP_ROOT/$DATE"
echo "$DATE: Backup completed successfully"

# Keep 30 days of backups
find "$BACKUP_ROOT" -mindepth 1 -maxdepth 1 -type d -mtime +30 -exec rm -rf {} \;
