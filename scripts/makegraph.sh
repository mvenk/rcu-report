#!/bin/bash
rcubranch="$HOME/click_rcu/race/macrobenchmarks/out"
rwlbranch="$HOME/click_rcu_master_tests/race/macrobenchmarks/out"
imgdir="../images/graphs"

# graph.sh takes  care of graphs with pure reader workload- takes 3 inputs one for RCU, RWL and no locks
#./graph.sh  $rcubranch/testsummary_micro_rcu_vr_0w.out $rwlbranch/testsummary_micro_rwl_vr_0w.out $rwlbranch/testsummary_micro_non_vr_0w.out $imgdir/micro_vr_0w.eps
./graph.sh  $rcubranch/testsummary_macro_rcu_vr_0w.out $rwlbranch/testsummary_macro_rwl_vr_0w.out $rwlbranch/testsummary_macro_non_vr_0w.out $imgdir/macro_vr_0w.eps
# graphwriter.sh is for graphs with at least one writer - takes 2 input files one for RCU and RWL.
./graphwriter.sh  $rcubranch/testsummary_macro_rcu_vr_1w.out $rwlbranch/testsummary_macro_rwl_vr_1w.out $imgdir/macro_vr_1w.eps
#./graphwriter.sh  $rcubranch/testsummary_micro_rcu_vr_1w.out $rwlbranch/testsummary_micro_rwl_vr_1w.out ../images/micro_vr_1w.eps
./graphwriter.sh  $rcubranch/testsummary_macro_rcu_1r_vw.out $rwlbranch/testsummary_macro_rwl_1r_vw.out $imgdir/macro_1r_vw.eps
#./graphwriter.sh  $rcubranch/testsummary_micro_rcu_1r_vw.out $rwlbranch/testsummary_micro_rwl_1r_vw.out ../images/micro_1r_vw.eps
#./graphwriter.sh  $rcubranch/testsummary_macro_rcu_0r_vw.out $rwlbranch/testsummary_macro_rwl_0r_vw.out ../images/macro_0r_vw.eps
#./graphwriter.sh  $rcubranch/testsummary_macro_rcu_0r_vw.out $rwlbranch/testsummary_micro_rwl_0r_vw.out ../images/micro_0r_vw.eps

#maintain a png version of each file for email
#elements=`ls -1 $imgdir *.eps | cut -d. -f1 | sed -e 's/\.click//g'`
#for k in $elements
#do
#	convert -geometry 2000 -density 2000 $k.eps $k.png
#done
