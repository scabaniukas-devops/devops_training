#!/bin/bash

#1. Path
SRC_LOG="/home/ubuntu/devops_training/server.log"
BACKUP_DIR="/home/ubuntu/devops_training/backups"

#2 Get Date and archive name
CURRENT_DATE=$(date +%Y-%m-%d_%H-%M-%S)
ARCHIVE_NAME="server_$CURRENT_DATE.tar.gz"

echo "==== Start backup logs ==="

if [ ! -f "$SRC_LOG" ]; then
	echo "[ ERROR ] File is lost $SRC_LOG! Backup is down"
	exit 1
fi

mkdir -p "$BACKUP_DIR"

tar -czf "$BACKUP_DIR/$ARCHIVE_NAME" -C "$(dirname "$SRC_LOG")"  "$(basename "$SRC_LOG")" 2>/dev/null

if [ $? -eq 0 ]; then
	echo "[ SUCCESS ] Backup created and saved: $BACKUP_DIR/$ARCHIVE_NAME"
else
	echo "[ ERROR ] Bakup is not created"
fi

echo "=== Done ==="
