#!/bin/bash

DATE=$(date +%d%m%Y)
WHAT=/home/c/cu76377/public_html
WHERE=/home/c/cu76377/backups

cp -r $WHAT $WHERE/backup_html_${DATE}

for (( CNT=`ls $WHERE | wc -l`; CNT > 7; CNT-- ))
do rm -r $WHERE/`ls -1t $WHERE | tail -1`
done
