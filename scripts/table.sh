#!/bin/bash
# Usage:
# ./graph.sh rcufilename rwlnonfilename
# 
# n             = number of times the test should be run
# out   = directory for output log files


if [ $# -ne 2 ]; then
    echo "Usage: "
    echo "$0 rcufilename rwlfilename"
    exit
fi

rcufile=$1
rwlnonfile=$2
rcuout="rcuinit.dat"
rwlout="rwlinit.dat"

tail -n+2 $rcufile|cut -d " " -f1,2|sed 's/,//g' |sed 's/rcu_//g' > $rcuout
tail -n+2 $rwlnonfile |cut -d " " -f1,2|sed 's/,//g' > $rwlout
grep non -i $rwlout > macro_non_read.dat
grep rwl -i $rwlout > macro_rwl.dat
grep 0w -i macro_rwl.dat > macro_rwl_read.dat
grep 1w -i macro_rwl.dat > macro_rwl_write.dat
grep 0w -i $rcuout > macro_rcu_read.dat
grep 1w -i $rcuout > macro_rcu_write.dat

python macrotable.py macro_rcu_read.dat macro_rwl_read.dat macro_non_read.dat tmptable.txt

python macrotable.py macro_rcu_write.dat macro_rwl_write.dat tmp2.txt

cat tmptable.txt|sed 's/_/ /g'
cat tmp2.txt|sed 's/_/ /g'
rm tmp*.txt
