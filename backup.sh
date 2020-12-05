#!/bin/bash

cd $PWD/$(dirname $0)
#HOSTNAME=$(cat /etc/hostname)
BACKUP_PATH=backup

if [ -z $1 ] || [ "local" = "$1" ]; then
	rsync --delete -arv --files-from=list.txt ~/ .
	rsync /usr/local/bin/ bin/
elif [ "server" = "$1" ]; then
	rsync --delete -arv --files-from=list.txt ~/ note3:~/$BACKUP_PATH
	rsync /usr/local/bin/ note3:~/$BACKUP_PATH/bin/
fi
