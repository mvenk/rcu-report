imagedir="../images/graphs"
type="macro"
rwlbranch="$HOME/click_rcu_master_tests/race/${type}benchmarks/out"
# lock acquisition count-graphs
./make_profile_lock_dat.sh $rwlbranch/lockcountsummary_macro_rwl_vr_0w.out >profile4.tmp
./bargraph.pl profile4.tmp > ${imagedir}/profile_lockcount_macro_rwl_vr_0w.eps
./make_profile_lock_dat.sh $rwlbranch/lockcountsummary_macro_rwl_vr_1w.out >profile4.tmp
./bargraph.pl profile4.tmp > ${imagedir}/profile_lockcount_macro_rwl_vr_1w.eps
rm *.tmp
