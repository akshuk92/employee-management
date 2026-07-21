#!/bin/bash
# =========================================
# backup.sh - Backup database and uploads
# =========================================
BACKUP_DIR="backup"
DATE=$(date +%Y%m%d_%H%M%S)

echo "Creating backup directory if not exists..."
mkdir -p "$BACKUP_DIR"

echo "Backing up uploads folder..."
tar -czf "$BACKUP_DIR/uploads_backup_$DATE.tar.gz" uploads/

echo "Backing up configuration files..."
cp -r config/ "$BACKUP_DIR/config_backup_$DATE/"

echo "Backing up database (simulated)..."
echo "-- Simulated SQL dump for employee_db --" > "$BACKUP_DIR/db_backup_$DATE.sql"

echo "Backup completed: $BACKUP_DIR/uploads_backup_$DATE.tar.gz"
