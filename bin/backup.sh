#!/bin/bash
set -e
cd $HOME

DATE=`date -u +"%Y-%m-%d"`
TIME=`date -u +"%H:%M:%S"`
UUID=`uuidgen -r | sed s/-//g`
USER=`whoami`
HOST=`hostname`

EXCLUDE=""
if [ -f $HOME/.nobackup ]; then
	EXCLUDE="--exclude-from=$HOME/.nobackup"
fi

LIST=`find -maxdepth 1 | sed -n 's:./::p'`

rm -f backup.tar.bz2
tar cjf backup.tar.bz2 --exclude=.s3up --exclude=s3up --exclude=.nobackup $EXCLUDE $LIST
$HOME/bin/s3up backup.tar.bz2 "labix-backup/${DATE}/${USER}_${TIME}_${UUID}.tar.bz2"
rm backup.tar.bz2
