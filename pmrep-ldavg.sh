#!/bin/bash
# To list all the loadavg from pcp archival.

# DEFAULT_TM_INVL       default time interval
# pcparchival           pcp archival name or .xz file
# tminvl                time interval

DEFAULT_TM_INVL="30m"

if [ -n "$1" ]
        then
                pcparchival="$1"
        else
                echo "Exiting: Enter pcp archival file name"
                exit 0
fi

if [ -n "$2" ]
        then
                tminvl="$2"
        else
                echo "Default 30 minutes interval: 30m set now"
                echo "Enter time interval as : 10d, 10h, 10m, 10s ." 
                tminvl=$DEFAULT_TM_INVL
fi


# Execute pmrep command to list load average.
pmrep -z -x -p -a $pcparchival -t$tminvl kernel.all.load

# EOF
