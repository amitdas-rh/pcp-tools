#!/bin/bash

#To check pcp archival files Commencing and End time.
if [ -n "$1" ]
        then
                 pmdumplog -L $1
        else
                echo -e "====\nTo verify Commenting and End date-time, please enter .xz pcp log filename.\n==="
        fi

# To verify system uptime while pcp .xz file was captured.
pminfo -a . -f kernel.all.uptime

# To verify system uptime while pcp .xz file was captured.
pminfo -a . -f kernel.all.load
