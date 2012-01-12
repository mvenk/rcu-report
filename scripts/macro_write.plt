set ylabel "Time (s)"
set xlabel "Workload"
set output "write_output.eps"
set title "Performance vs Workload"
set style data linespoints
set key spacing 1.5
set key left
set terminal postscript eps enhanced
plot "rwlfile" using 2:xticlabels(1) with linespoints lw 3 title "Reader Writer Lock", "rcufile" using 2:xticlabels(1) title "RCU" with linespoints lw 3
