#!/bin/bash
# Usage:
# ./graphwriter.sh rcufilename rwlfilename nonfilename


if [ $# -ne 3 ]; then
    echo "Usage: "
    echo "$0 rcufilename rwlfilename outputfilename"
    exit
fi

rcufile=$1
rwlfile=$2

rcuout="rcuinit.dat"
rwlout="rwlinit.dat"

tail -n+2 $rcufile|cut -d " " -f1,2|sed 's/,//g' |sed 's/rcu_//g'|sed 's/_//g'> $rcuout
tail -n+2 $rwlfile |cut -d " " -f1,2|sed 's/,//g' |sed 's/rwl_//g'|sed 's/_//g'> $rwlout

#plot writers
cat macro_write.plt |sed "s/rcufile/$rcuout/g" | sed "s/rwlfile/$rwlout/g" > macro_write.plt.tmp
gnuplot macro_write.plt.tmp
mv write_output.eps $3

#clean up
rm *.dat
rm *.tmp
