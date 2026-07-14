#!/bin/bash

THRESHOLD=1

USAGE=$(df / | awk 'NR==2 {gsub("%","",$5); print $5}')

if [ "$USAGE" -gt "$THRESHOLD" ]; then
	echo "[ WARNING] Disk a full ${USAGE}%!"
else
	echo "[ OK ] ${USAGE}%"
fi
