#!/bin/bash
./graph.sh  ../results/testsummary_micro_rcu_vr_0w.out ../results/testsummary_micro_rwl_vr_0w.out ../results/testsummary_micro_non_vr_0w.out ../images/micro_vr_0w.eps
./graph.sh  ../results/testsummary_macro_rcu_vr_0w.out ../results/testsummary_macro_rwl_vr_0w.out ../results/testsummary_macro_non_vr_0w.out ../images/macro_vr_0w.eps
./graphwriter.sh  ../results/testsummary_macro_rcu_vr_1w.out ../results/testsummary_macro_rwl_vr_1w.out ../images/macro_vr_1w.eps
./graphwriter.sh  ../results/testsummary_micro_rcu_vr_1w.out ../results/testsummary_micro_rwl_vr_1w.out ../images/micro_vr_1w.eps
./graphwriter.sh  ../results/testsummary_macro_rcu_1r_vw.out ../results/testsummary_macro_rwl_1r_vw.out ../images/macro_1r_vw.eps
./graphwriter.sh  ../results/testsummary_macro_rcu_1r_vw.out ../results/testsummary_micro_rwl_1r_vw.out ../images/micro_1r_vw.eps
#./graphwriter.sh  ../results/testsummary_macro_rcu_0r_vw.out ../results/testsummary_macro_rwl_0r_vw.out ../images/macro_0r_vw.eps
#./graphwriter.sh  ../results/testsummary_macro_rcu_0r_vw.out ../results/testsummary_micro_rwl_0r_vw.out ../images/micro_0r_vw.eps

#maintain a png version of each file for email
elements=`ls -1 *.eps | cut -d. -f1 | sed -e 's/\.click//g'`
for k in $elements
do
	convert -geometry 2000 -density 2000 $k.eps $k.png
