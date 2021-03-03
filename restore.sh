#!/bin/bash

cd $PWD/$(dirname $0)

BACKUP_PATH=backup

if [ -z $1 ] || [ "local" = "$1" ]; then
	rsync -arv --delete --files-from=list.txt . ~/
	rsync -rv --delete bin/ /usr/local/bin/
else
	rsync $1:~/$BACKUP_PATH/list.txt .
	rsync -avr --delete --files-from=list.txt $1:~/$BACKUP_PATH ~/
	rsync -rv --delete $1:~/$BACKUP_PATH/bin/ /usr/local/bin/
#	rsync -azzv $1:~/$BACKUP_PATH/ ./
fi
