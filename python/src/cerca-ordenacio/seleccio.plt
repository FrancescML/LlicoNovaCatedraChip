set term "svg"
set output "seleccio.svg"
set xlabel "n" font "Arial, 16"
set ylabel "t (s)" font "Arial, 16"
plot "seleccio.txt" title "" with linespoints
