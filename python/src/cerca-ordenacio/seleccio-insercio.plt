set term "svg"
set output "seleccio-insercio.svg"
set xlabel "n" font "Arial, 16"
set ylabel "t (s)" font "Arial, 16"
plot "seleccio.txt" title "Selecció" with linespoints, "insercio.txt" title "Inserció" with linespoints
