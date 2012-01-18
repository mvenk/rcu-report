#!/bin/bash
imagedir="../images/graphs"
./make_profile_dat.sh 8 rwl v 1 "Master::check_driver" "click.ReadWriteLockUser::acquire_read" "RouterThread::lock_tasks" > profile1.dat
./bargraph.pl profile1.dat > ${imagedir}/profile_macro_rwl_vr_1w.eps
./make_profile_dat.sh 8 rcu v 1 "Master::check_driver" "ReadRadixIPLookupM106::run_task" "RouterThread::lock_tasks"> profile2.dat
./bargraph.pl profile2.dat > ${imagedir}/profile_macro_rcu_vr_1w.eps

