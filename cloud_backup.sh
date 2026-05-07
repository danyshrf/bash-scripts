#!/bin/bash

SOURCE="/home/danish/projects"
BACKUP_DIR="/mnt/backup_drive"
TIMESTAMP=$(date +%y-%m-%d_%H-%M-%S)
FINAL_BACKUP_PATH="$BACKUP_DIR/backup_$TIMESTAMP"

echo "Starting backup of $SOURCE..."

mkdir -p "$FINAL_BACKUP_PATH"

rsync -avz "$SOURCE/" "$FINAL_BACKUP_PATH"

if [ $? -eq 0 ]; then
	echo "Successfully backed up to $FINAL_BACKUP_PATH"
else
	echo "Backup FAILED! check network or permissions"
	exit 1
fi
