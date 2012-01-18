#!/bin/bash
imgdir="../images/graphs"
array="macro micro"

for type in $array;
do
rcubranch="$HOME/click_rcu/race/${type}benchmarks/out"
rwlbranch="$HOME/click_rcu_master_tests/race/${type}benchmarks/out"
# graph.sh takes  care of graphs with pure reader workload- takes 3 inputs one for RCU, RWL and no locks
#./graph.sh  $rcubranch/testsummary_micro_rcu_vr_0w.out $rwlbranch/testsummary_micro_rwl_vr_0w.out $rwlbranch/testsummary_micro_non_vr_0w.out $imgdir/micro_vr_0w.eps
./graph.sh  $rcubranch/testsummary_${type}_rcu_vr_0w.out $rwlbranch/testsummary_${type}_rwl_vr_0w.out $rwlbranch/testsummary_${type}_non_vr_0w.out $imgdir/${type}_vr_0w.eps
# graphwriter.sh is for graphs with at least one writer - takes 2 input files one for RCU and RWL.
./graphwriter.sh  $rcubranch/testsummary_${type}_rcu_vr_1w.out $rwlbranch/testsummary_${type}_rwl_vr_1w.out $imgdir/${type}_vr_1w.eps
./graphwriter.sh  $rcubranch/testsummary_${type}_rcu_1r_vw.out $rwlbranch/testsummary_${type}_rwl_1r_vw.out $imgdir/${type}_1r_vw.eps
./graphwriter.sh  $rcubranch/testsummary_${type}_rcu_0r_vw.out $rwlbranch/testsummary_${type}_rwl_0r_vw.out ../images/$imgdir/${type}_0r_vw.eps
done

#maintain a png version of each file for email
#elements=`ls -1 $imgdir *.eps | cut -d. -f1 | sed -e 's/\.click//g'`
#for k in $elements
#do
#	convert -geometry 2000 -density 2000 $k.eps $k.png
#done
