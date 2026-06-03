<!-- Colocar esta imagen al inicio de cada lección -->
<img src="../../logos/illustracio1.png" alt="Digital circuits" style="float: left; border-radius: 8px; height: 120px;"/>
<img src="../../logos/LogoCatedraCHIPBlanc.jpg" alt="CHIP Chair Logo" style="float: right; border-radius: 8px; height: 120px;"/>
<div style="clear: both;"></div>
<br>




# Buses

En circuitos digitales, un **bus de bits** (o simplemente *bus*) es un conjunto de líneas de comunicación que transportan bits de datos de forma paralela. Sirve para interconectar diferentes componentes de un sistema transferiendo señales digitales.

El **desplazamiento de bits** es una operación fundamental en el procesamiento de datos de un bus. Consiste en mover todos los bits de un registro (o palabra binaria) hacia la izquierda o hacia la derecha.

## Notación

En este apartado trabajaremos con variables que representan números binarios de $N$ bits. Para referirnos a una variable, utilizaremos una notación como $A[3:0]$, que describe un conjunto de 4 bits llamado $A$.

El rango $[3:0]$ especifica que los bits están indexados desde el 3 hasta el 0. Esta variable se puede descomponer en sus bits individuales:

$$A = A[3:0] = [A_3\ A_2\ A_1\ A_0]$$

Donde $A_3$ es el bit de mayor peso (*Bit más significativo* o **MSB**) y $A_0$ es el bit de menor peso (*Bit menos significativo* o **LSB**).
Esta notación permite referirse tanto al conjunto completo ($A$) como a cada uno de sus bits ($A_i$).

## Ejemplo: Diseño de un circuito desplazador de bus a la izquierda (N bits)

Supongamos que trabajamos con datos binarios y necesitamos desplazar todos los bits de una secuencia una posición a la izquierda.

Por ejemplo, 1010 binario es 10 en decimal:

$$1010_2 = 10_{10}$$

Si lo desplazamos una posición a la izquierda obtenemos 10100, lo que equivale a multiplicar su valor por 2.

$$10100_2 = 20_{10}$$


Una tabla de verdad completa para un número de bits $N$ elevado es inviable (tendría $2^N$ filas). Nos centraremos en un caso de $N=4$ bits, donde la tabla aún es manejable.

A continuación se muestra la tabla de verdad de un circuito desplazador a la izquierda. La entrada es $A[3:0] = [A_3 A_2 A_1 A_0]$ y la salida es $B[3:0] = [B_3 B_2 B_1 B_0]$.

| **Entrada A** | **Salida B** |
|:---:|:---:|
|0000|0000|
|0001|0010|
|0010|0100|
|0011|0110|
|0100|1000|
|0101|1010|
|0110|1100|
|0111|1110|
|1000|0000|
|1001|0010|
|1010|0100|
|1011|0110|
|1100|1000|
|1101|1010|
|1110|1100|
|1111|1110|

Nuestro objetivo es diseñar un circuito desplazador de 4 bits. Tenemos dos opciones:

* Usar [multiplexores](./multiplexors.md), que son [circuitos combinacionales](../CircCombin/intro.md): Esta es la forma más habitual y flexible para desplazamientos fijos o controlados.

* Usar registros de desplazamiento, que son [circuitos secuenciales](../CircSeq/intro.md) y adecuados para desplazamientos sucesivos sincronizados con reloj.

En esta sección utilizaremos multiplexores. El circuito es el siguiente:

<img src="../../CircCombin/bus_exemple.png" alt="Circuito desplazador" style="display:block; height:400px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;"/>
<center><i>Circuito digital que desplaza una posición hacia la izquierda</i></center>

La señal de control $Sel$ determina si se efectúa el desplazamiento:

* Si $Sel = 0$, la salida es igual a la entrada (no hay desplazamiento).
* Si $Sel = 1$, los multiplexores realizan un desplazamiento a la izquierda de una posición.

Para cada bit de salida $B_i$, utilizaremos un multiplexor 2-a-1:

* **MUX para $B_3$**
  * Entrada 0: $A_3$
  * Entrada 1: $A_2$
  * Salida: $B_3$
* **MUX para $B_2$**
  * Entrada 0: $A_2$
  * Entrada 1: $A_1$
  * Salida: $B_2$
* **MUX para $B_1$**
  * Entrada 0: $A_1$
  * Entrada 1: $A_0$
  * Salida: $B_1$
* **MUX para $B_0$**
  * Entrada 0: $A_0$
  * Entrada 1: $0$ (bit de entrada)
  * Salida: $B_0$



## Ejercicios en Jutge.org:[Introduction to Digital Circuit Design](https://jutge.org/courses/JordiCortadella:IntroCircuits)

- [Bus invert](https://jutge.org/problems/X29475_en)
- [Bus transfer or invert](https://jutge.org/problems/X00341_en)
- [Shift left](https://jutge.org/problems/X26035_en)
- [Shift left or right](https://jutge.org/problems/X25794_en)

<small>Recorda que per accedir als exercicis i perquè el Jutge valori les teves solucions has d'estar inscrit al [curs](https://jutge.org/courses/JordiCortadella:IntroCircuits). Trobaràs totes les instruccions [aquí](../Inici/instruccions.md).</small>

<!-- Esta imagen debe ir al final de cada lección, ya sea con esta línea o dentro de la firma. Dejar comentado si ya está a la firma-->
<br><br><img src="../../logos/TotsLogosBlanc.png" alt="CHIP Chair Logos" width="100%" style="display:block; margin:0 auto; border-radius:8px;"/>
<Autors autors="xcasas fmadrid"/>
