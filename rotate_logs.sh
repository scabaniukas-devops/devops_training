#!/bin/bash

# Path to our working folder and log file
LOG_DIR="/home/ubuntu/devops_training/scripts"
LOG_FILE="$LOG_DIR/disk_monitor.log"
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
ARCHIVE_NAME="$LOG_DIR/disk_monitor_$TIMESTAMP.tar.gz"

echo "=== Starting log rotation: $(date) ==="

# 1. Check if the log file exists and is not empty.
if [ -s "$LOG_FILE" ]; then
    echo "Log file found. Starting archiving...."

    # 2. Creating a compressed archive using an archiver. tar
    # Flags: -c (create), -z (gzip compression), -f (file)
    tar -czf "$ARCHIVE_NAME" -C "$LOG_DIR" disk_monitor.log

    if [ $? -eq 0 ]; then
        echo "Archive successfully created: $ARCHIVE_NAME"

        # 3. Clear the original log file so that check_disk.sh can write to it again
        # Redirection (>) without a command simply empties the file while preserving access permissions
        > "$LOG_FILE"
        echo "The original log file has been cleared.."
    else
        echo "Error: Failed to create the archive!"
        exit 1
    fi
else
    echo "The log file is empty or does not exist. Rotation is not required."
fi

# 4. Delete archives older than 7 days so they don't accumulate indefinitely
# Find files matching the pattern with a modification time (+mtime) older than 7 days and delete them (-delete)
find "$LOG_DIR" -name "disk_monitor_*.tar.gz" -mtime +7 -delete

echo "=== The rotation has been successfully completed. ==="
