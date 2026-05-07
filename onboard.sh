#!/bin/bash


if [ -z "$1" ]; then
	echo "usage: $0 <user_list_file>"
	exit 1
fi

USER_FILE=$1

for USERNAME in $(cat "$USER_FILE")
do
	if id "$USERNAME" &>/dev/null; then
		echo "[SKIP] User '$USERNAME' already exists."
	else
	
		sudo useradd -m -s /bin/bash "$USERNAME"

		if [$? -eq 0 ]; then
			echo "[SUCCESS] Created user: $USERNAME"
		else
			echo "[ERROR] Failed to create user: $USERNAME"
		fi
	fi
done
