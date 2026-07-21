#!/bin/bash

# Read the DISK_THRESHOLD variable from the environment.
# If it is NOT set, use the default value: 80.
THRESHOLD="${DISK_THRESHOLD:-10}"

# Read the server name from the environment; defaults to "Production-Server-1".
SERVER_NAME="${SERVER_NAME:-Production-Server-1}"

# Get the usage percentage of the current disk (root /).
USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

echo "[$TIMESTAMP] [$SERVER_NAME] Disk Check: ${USAGE}% Used (Threshold: ${THRESHOLD}%)"

# Checking whether the threshold has been exceeded
if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "⚠️ WARNING! Server $SERVER_NAME is running out of disk! Disk usage: ${USAGE}% ($ threshold exceeded){THRESHOLD}%)"
    # In the future, code to send a Telegram notification using TELEGRAM_BOT_TOKEN can be added here.
fi
