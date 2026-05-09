#!/bin/bash

LOGS=("/var/log/syslog" "/var/log/auth.log" "/var/log/kern.log")
BACKUP_DIR="/home/danish/backups"

mkdir -p "$BACKUP_DIR"

echo " Starting log rotation"

for FILE in "${LOGS[@]}"
do
	FILENAME=$(basename "$FILE")
	TIMESTAMP=$(date +%y%m%d)
	DEST="$BACKUP_DIR/${FILENAME}_${TIMESTAMP}.gz"

	echo "Processing: $FILENAME"

	tar -czf "$DEST" "$FILE" 2>/dev/null

	if [ $? -eq 0 ]; then
		echo "successfully archived $FILENAME to $DEST"

	else
		echo "ERROR: Failed to archive $FILENAME. Check permissions."
	fi
done
