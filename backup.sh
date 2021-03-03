#!/bin/bash

cd $PWD/$(dirname $0)
#HOSTNAME=$(cat /etc/hostname)
BACKUP_PATH=backup

if [ -z $1 ] || [ "local" = "$1" ]; then
	rsync --delete -arv --files-from=list.txt ~/ .
	rsync --delete -rv /usr/local/bin/ bin/
else
	rsync list.txt $1:~/$BACKUP_PATH/
	rsync --delete -arv --files-from=list.txt ~/ $1:~/$BACKUP_PATH
	rsync --delete -rv /usr/local/bin/ $1:~/$BACKUP_PATH/bin/
fi
