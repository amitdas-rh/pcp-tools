#!/bin/bash
# Written by Amit Das
# To list processes with most cpu usage

# DEFAULT_TM_INVL	default time interval
# DEFAULT_PS_COUNT	default top process count
# pcparchival		pcp archival name or .xz file
# tminvl		time interval
# pscount		number of top processes listed 

DEFAULT_TM_INVL="1h"
DEFAULT_PS_COUNT=5

# usage

usage() {
	echo "usage: $0 <archive-file> <10h:10m:10s> <ps-count>"
}

# pcp archival file

if [ -n "$1" ]
	then
		pcparchival="$1"
	else
		usage
		exit 0
fi

# time interal

if [ -n "$2" ]
	then
		tminvl="$2"
	else
		echo "Default interval '1h' set. Enter time format :  10h, 10m, 10s"
		tminvl=$DEFAULT_TM_INVL
fi

# Number of top processes count list

if [ -n "$3" ]
	then
		pscount="$3"
	else
		pscount=$DEFAULT_PS_COUNT
fi

# Execute pmrep to list processes with most cpu usage
pmrep -z -x -a $pcparchival -p -g -t$tminvl proc.hog.cpu -1 -J $pscount

#EOF
