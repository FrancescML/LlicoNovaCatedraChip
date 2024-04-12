set term "svg"
set output "fusio1.svg"
set xlabel "n" font "Arial, 16"
set ylabel "t (s)" font "Arial, 16"
plot "sel1.txt" title "Selecció" with linespoints, "ins1.txt" title "Inserció" with linespoints, "fus1.txt" title "Fusió" with linespoints
