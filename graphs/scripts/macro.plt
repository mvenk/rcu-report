set ylabel "Time (s)"
set xlabel "Readers"
set output "macro_readers.eps"
set title "Expected cache misses vs Actual cache misses"
set style data linespoints
set key spacing 1.5
set key left
set terminal postscript eps enhanced
plot "macro1.dat" using 2:xticlabels(1) title "no locks", "macro2.dat" using 2:xticlabels(1) title "rcu"
