set terminal svg size 1000,500 font "Arial,20"
set output "funcions-grans.svg"

set grid
set key outside right
set termoption linewidth 3

plot [0:100] [0:1000] log(x) title "log(n)", sqrt(x) title "√n", x title "n", x*log(x) title "n·log(n)", x**2 title "n²", x**3 title "n³", 2**x title "2ⁿ"

set output
