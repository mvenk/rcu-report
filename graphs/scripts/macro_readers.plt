set ylabel "Time (s)"
set xlabel "Readers"
set output "read_output.eps"
set title "Performance vs No. of Readers"
set style data linespoints
set key spacing 1.5
set key left
set terminal postscript eps enhanced
plot "nonfile" using 2:xticlabels(1) title "No Locks" with linespoints lw 3, "rwlfile" using 2:xticlabels(1) title "Reader Writer Lock" with linespoints lw 3, "rcufile" using 2:xticlabels(1) title "Read Copy Update" with linespoints lw 3
