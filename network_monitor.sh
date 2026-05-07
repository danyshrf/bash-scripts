#!/bin/bash
# define the list of ips and servers to check

TARGETS=("8.8.8.8" "google.com" "192.168.1.1")

echo "Starting network check at ($date)...."

for SERVER in "${TARGETS[@]}"
do
	# -c 1: send 1 packet
    # -W 1: wait 1 second for response
    # > /dev/null 2>&1: hide the ping output from the terminal
    ping -c 1 -W 1 "$SERVER" > /dev/null 2>&1

    if [ $? -eq 0 ]; then
	 echo "[ ok ] $SERVER is Reachable"
    else
	 echo "[ Fail ] $SERVER is Down"
    fi
done

echo "---check Complete---"
