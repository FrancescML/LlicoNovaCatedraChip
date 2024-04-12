set term "svg"
set output "insercio-quasi-ordenat.svg"
set xlabel "n" font "Arial, 16"
set ylabel "t (s)" font "Arial, 16"
plot  "insercio-ordenat.txt" title "Inserció amb dades quasi ordenades" with linespoints, "seleccio.txt" title "Selecció amb dades quasi ordenades" with linespoints
