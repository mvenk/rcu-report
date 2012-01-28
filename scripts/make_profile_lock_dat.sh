#!/bin/bash
# Usage:
# ./testrunner.sh <n> <out>
# 
# n             = number of times the test should be run
# out   = directory for output log files


if [ $# -ne 1 ]; then
    echo "Usage: "
    echo "$0 <filename>"
    exit
fi

filename=$1

echo "=table
=stacked;Lock Acquisition Attempts
colors=grey1,grey4,grey6,grey7,white
yformat=%g
max=500000000
fontsz=10
=norotate
title= Lock Acquisition Attempts.
ylabel=Number of Attempts
legendx=right
legendy=top
"
echo "# $5"
tail -n+2 $filename |cut -d " " -f1,2|sed 's/,//g' |sed 's/rwl_//g'|sed 's/_//g'