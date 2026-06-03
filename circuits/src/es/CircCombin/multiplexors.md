<!-- Colocar esta imagen al inicio de cada lección -->
<img src="../../logos/illustracio1.png" alt="Digital circuits" style="float: left; border-radius: 8px; height: 120px;"/>
<img src="../../logos/LogoCatedraCHIPBlanc.jpg" alt="CHIP Chair Logo" style="float: right; border-radius: 8px; height: 120px;"/>
<div style="clear: both;"></div>
<br>




# Multiplexores

En esta lección verás el funcionamiento de los multiplexores y cómo se implementan con puertas lógicas.

En electrónica, un multiplexor (o MUX) es un dispositivo que selecciona una señal entre múltiples señales de entrada y la reenvía a una única línea de salida. En el contexto de los circuitos digitales, las entradas son digitales (bits), aunque también existen multiplexores para señales analógicas.

Un multiplexor permite que varias entradas compartan un mismo recurso, en lugar de disponer de uno para cada señal. Un ejemplo sería un convertidor analógico-digital o un medio de transmisión de comunicaciones.

Los multiplexores también se pueden utilizar para implementar funciones booleanas de múltiples variables.

## Ejemplo: Multiplexor de dos entradas

Imaginemos que tenemos dos fuentes de datos diferentes, posiblemente dos sensores, y necesitamos un circuito que seleccione cuál de dichas señales se enviará a un procesador.

Diseñaremos un multiplexor de **dos entradas** ($in_1$, $in_2$) y **una salida** ($out$). Una entrada especial es el **selector** ($Sel$), encargado de elegir cuál de las dos entradas se enviará a $out$.

En este ejemplo queremos que:

* Cuando **$Sel = 1$**, la salida sea **$in_1$**.
* Cuando **$Sel = 0$**, la salida sea **$in_2$**.

En primer lugar, construimos la tabla de verdad con todos los valores posibles de las entradas y el selector:

<i>Tabla de verdad</i>

| **$in_1$** | **$in_2$** | **$Sel$** | **$out$** |
| ---------- | ---------- | --------- | --------- |
| 0          | 0          | 0         | 0         |
| 0          | 1          | 0         | 1         |
| 1          | 0          | 0         | 0         |
| 1          | 1          | 0         | 1         |
| 0          | 0          | 1         | 0         |
| 0          | 1          | 1         | 0         |
| 1          | 0          | 1         | 1         |
| 1          | 1          | 1         | 1         |

La expresión booleana simplificada de la salida es:

$$
out = \overline{Sel} \cdot in_2 \;+\; Sel \cdot in_1
$$

A continuación dibujamos el circuito lógico asociado:

<img src="../../CircCombin/multiplexor_exemple.png" alt="ejemplo de circuito" style="display:block; height:150px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;" />
<center><i>Circuito multiplexor</i></center>

## Ejercicios en Jutge.org:[Introduction to Digital Circuit Design](https://jutge.org/courses/JordiCortadella:IntroCircuits)

- [Multiplexor de dos entradas](https://jutge.org/problems/X12031_en)
- [Barajar](https://jutge.org/problems/X07222_en)
- [Multiplexor de dos entradas (de 4 bits de ancho)](https://jutge.org/problems/X82780_en)
- [Multiplexor de cuatro entradas](https://jutge.org/problems/X45339_en)

<small>Recuerda que para acceder a los ejercicios y para que Jutge valore tus soluciones debes estar inscrito en el curso. Encontrarás todas las instrucciones [aquí](../Inici/instruccions.md).</small>


<!-- Esta imagen debe ir al final de cada lección, ya sea con esta línea o dentro de la firma. Dejar comentado si ya está a la firma-->
<br><br><img src="../../logos/TotsLogosBlanc.png" alt="CHIP Chair Logos" width="100%" style="display:block; margin:0 auto; border-radius:8px;"/>
<Autors autors="xcasas fmadrid"/>