#!/bin/bash
# Simple disk usage alert checker


Threshold=80
DISK_USE=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

if [ $DISK_USE -gt $Threshold ]; then
	echo "Warning: Disk is ${DISK_USE}% - above limit"
else
	echo "Ok: Disk is ${DISK_USE}%"
fi
