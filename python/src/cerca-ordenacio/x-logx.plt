set term "svg"
set output "x-logx.svg"
set xlabel "n" font "Arial, 16"
plot [0:100] [0:20]  x title "x" with lines, log(x)/log(2) title "log2(x)" with lines
