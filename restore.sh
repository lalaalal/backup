#!/bin/bash

cd $PWD/$(dirname $0)

BACKUP_PATH=backup

if [ -z $1 ] || [ "local" = "$1" ]; then
	rsync -arv --files-from=list.txt . ~/
	rsync -rv bin/ /usr/local/bin/
elif [ "server" = "$1" ]; then
	rsync -azzv note3:~/$BACKUP_PATH .
fi
