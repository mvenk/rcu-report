#!/bin/bash
# Usage:
# ./graph.sh rcufilename rwlfilename nonfilename



if [ $# -ne 4 ]; then
    echo "Usage: "
    echo "$0 rcufilename rwlfilename nonfilename outputfilename"
    exit
fi

rcufile=$1
rwlfile=$2
nonfile=$3
rcuout="rcuinit.dat"
rwlout="rwlinit.dat"
nonout="noninit.dat"

tail -n+2 $rcufile|cut -d " " -f1,2|sed 's/,//g' |sed 's/rcu_//g'|sed 's/_//g'> $rcuout
tail -n+2 $rwlfile |cut -d " " -f1,2|sed 's/,//g' |sed 's/rwl_//g'|sed 's/_//g'> $rwlout
tail -n+2 $nonfile |cut -d " " -f1,2|sed 's/,//g' |sed 's/non_//g'|sed 's/_//g'> $nonout

#plot readers
cat macro_readers.plt |sed "s/rcufile/$rcuout/g" | sed "s/rwlfile/$rwlout/g"|sed "s/nonfile/$nonout/g"> macro_readers.plt.tmp
gnuplot macro_readers.plt.tmp
mv read_output.eps $4
#clean up
rm *.dat
rm *.tmp
