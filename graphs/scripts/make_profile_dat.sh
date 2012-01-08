#!/bin/bash
# Usage:
# ./testrunner.sh <n> <out>
# 
# n             = number of times the test should be run
# out   = directory for output log files


if [ $# -ne 7 ]; then
    echo "Usage: "
    echo "$0 <threads> <n> <out>"
    echo "threads = maximum number of threads that the test can use"
    echo "prefix = the prefix of the test to run"
    echo "reader count= 0 to maxthreds, v if it varies"
    echo "writer count = 0 to maxthreads, v if it varies"
    echo "sorted arg1"
    echo "sorted arg2"
    echo "sorted arg3"
    exit
fi

maxthreads=$1
prefix=$2

if [ "$prefix" == "rcu" ]
then
	branch="click_rcu"
	sync="RCU"
else
	branch="click_rcu_master_tests"
	sync="reader-writer lock"
fi

if [ $3 == 'v' ]; then
    minreaders=1
    maxreaders=$maxthreads
else
    minreaders=$3
    maxreaders=$(($3 +1))
fi

if [ $4 == 'v' ]; then
    minwriters=1
    maxwriters=$maxthreads
else
    minwriters=$4
    maxwriters=$(($4 +1))
fi
echo "=table
=stacked;$5;$6;$7;other
colors=yellow,blue,black,grey4,grey6,grey7,white
yformat=%g
max=100
fontsz=10
=norotate
title=Distribution of time using $sync synchronization.
ylabel=%time
legendx=right
legendy=top
"
echo "# $5 $6 $7 other"
for (( j = $minreaders; j < $maxreaders; j++ ))
do
    reader_threads=$j
    for (( m = $minwriters; m < $maxwriters; m++ ))
    do
        writer_threads=$m
        threads=$[$writer_threads + $reader_threads]
        k="${prefix}_${reader_threads}r_${writer_threads}w"
        if (( threads > maxthreads )); then
            continue
        fi
        profile_file="$HOME/$branch/race/macrobenchmarks/out/167k_profile_$k.out"
        for i in $(seq 1 $n);
        do
	    echo -n "${reader_threads}r_${writer_threads}w "
            val1=`cat $profile_file |grep $5|sed 's/\( \)\{1,\}/,/g'|cut -d',' -f3|sed 's/%//g'`
	    val2=`cat $profile_file |grep $6|sed 's/\( \)\{1,\}/,/g'|cut -d',' -f3|sed 's/%//g'`
	    val3=`cat $profile_file |grep $7|sed 's/\( \)\{1,\}/,/g'|cut -d',' -f3|sed 's/%//g'`
	    if [ "$val1" == '' ]; then
    		val1=0 
	    fi
	    otherp=$(echo "100 - ($val1 + $val2 + $val3)" |bc)
	    echo "$val1 $val2 $val3 $otherp"
        done
    done
done


