set term "svg"
set output "insercio.svg"
set xlabel "n" font "Arial, 16"
set ylabel "t (s)" font "Arial, 16"
plot "insercio.txt" title "" with linespoints
