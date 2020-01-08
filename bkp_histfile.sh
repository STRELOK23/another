#!/bin/bash

WTCFILE="$HOME/.bash_history"
BKPFILE="$HOME/.bkp_histfile"
TMPFILE="$HOME/.tmp_histfile"

function handl {
    cat $1 | sort | uniq > $2
}

if [[ ! -f $BKPFILE ]]; then touch $BKPFILE; fi

CHFILEA=$(ls -las --time-style=+%m%d%H%M $WTCFILE | awk '{print $7}')
CHFILEB=$(ls -las --time-style=+%m%d%H%M $BKPFILE | awk '{print $7}')

if (( 10#$CHFILEA > 10#$CHFILEB )); then
    handl $WTCFILE $TMPFILE
    cat $BKPFILE >> $TMPFILE
    handl $TMPFILE $BKPFILE
    rm $TMPFILE
fi

