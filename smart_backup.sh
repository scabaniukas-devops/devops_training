#!/bin/bash

TARGET_DIR="$HOME/devops_training"
BACKUP_NAME="backup_$(date +%Y%m%d).tar.gz"

if [ -d "$TARGET_DIR" ]; then
	echo " Folder $TARGET_DIR exist. Start backup ..."
	tar -czf "$BACKUP_NAME" "$TARGET_DIR"
	echo "Succesfull, backup exist $BACKUP_NAME"

else
	echo "ERROR: Folder $TARGET_DIR is not find, stop job"
	exit 1
fi
