set term "svg"
set output "insercio-ordenat.svg"
set xlabel "n" font "Arial, 16"
set ylabel "t (s)" font "Arial, 16"
plot  "insercio-ordenat.txt" title "Inserció amb dades ordenades" with linespoints, "insercio.txt" title "Inserció amb dades aleatòries" with linespoints
