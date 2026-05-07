#!/bin/bash


LOG_FILE="/var/log/syslog"
ERROR_EXPORT="critical_errors_$(date +%F).txt"
ARCHIVE_NAME="syslog_archive_$(date +%F).tar.gz"

echo "Scanning for critical issues.."

grep -iE "error|critical|failed" "$LOG_FILE" > "$ERROR_EXPORT"

echo "Errors exported to $ERROR_EXPORT"

tar -czf "$ARCHIVE_NAME" "$LOG_FILE"

echo "Original logs are archived as $ARCHIVE_NAME"

echo "Original size: $(du -sh $LOG_FILE)"
echo "Archived size: $(du -sh $ARCHIVE_NAME)"
