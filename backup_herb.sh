#!/bin/bash

BNAME=backup_html_$(date +%d%m%Y)
WHAT=$HOME/public_html
WHERE=$HOME/backups

cp -r $WHAT $WHERE/$BNAME

mysqldump -ucu76377_new -p`find $HOME/public_html/ -type f -name connect.php | tail -1 | xargs cat | \
grep -Po "(?<=rd\s\=\s').*(?=')"` cu76377_new > $WHERE/$BNAME/cu76377_new.sql 2>&1 >> /dev/null

for (( CNT=`ls $WHERE | wc -l`; CNT > 7; CNT-- ))
do rm -r $WHERE/`ls -1t $WHERE | tail -1`
done
