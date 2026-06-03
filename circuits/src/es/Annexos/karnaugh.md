<!-- Colocar esta imagen al inicio de cada lección -->
<img src="../../logos/illustracio1.png" alt="Digital circuits" style="float: left; border-radius: 8px; height: 120px;"/>
<img src="../../logos/LogoCatedraCHIPBlanc.jpg" alt="CHIP Chair Logo" style="float: right; border-radius: 8px; height: 120px;"/>
<div style="clear: both;"></div>
<br>




# Introducción a los Mapas de Karnaugh

Un mapa de Karnaugh (también conocido como *K-map* o diagrama de Veitch) es una herramienta gráfica utilizada en electrónica digital para simplificar funciones lógicas booleanas de forma visual y sistemática.

El objetivo principal es encontrar la expresión booleana más simple posible para una función lógica determinada. Una función lógica más simple se traduce directamente en un circuito digital más sencillo.

Se trata de un método alternativo a la simplificación con las leyes del álgebra de Boole y es válido para cualquier número de variables. Resulta, sin embargo, más práctico e intuitivo para pocas variables, típicamente de 2 a 4. Más allá de 6 variables, los mapas de Karnaugh dejan de ser prácticos.

Un mapa de Karnaugh es una cuadrícula que organiza todas las combinaciones posibles de las variables de entrada de una función booleana. Cada celda representa una combinación de las variables de entrada de la función, es decir, una fila de la tabla de verdad.

Este mapa se debe ordenar de modo que entre dos celdas adyacentes verticalmente o horizontalmente solo cambie el valor de una única variable. Esto facilita la identificación de patrones y la agrupación para reducir la expresión lógica.

## Ejemplo:

Veamos la siguiente tabla de verdad de un circuito digital hipotético. Esta representa las variables de entrada $A$, $B$ y $C$ y la salida $S$.

<i>Tabla de verdad</i>
<!--
|**$A$**|**$B$**|**$C$**|**$S$**
|------    |------    |------   |------
|0|0|0|1|
|0|0|1|0|
|0|1|0|1|
|0|1|1|1|
|1|0|0|1|
|1|0|1|1|
|1|1|0|1|
|1|1|1|1|
-->

<table style="border-collapse: collapse; text-align: center;">
  <thead>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">A</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">B</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">C</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">S</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
    </tr>
    <tr>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
    </tr>
    <tr>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
    </tr>
    <tr>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
    </tr>
    <tr>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
    </tr>
    <tr>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
    </tr>
    <tr>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
    </tr>
    <tr>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
    </tr>
  </tbody>
</table>


El mapa de Karnaugh resultant, agrupant les variables B i C, és el següent:

<!-- 
<i>Mapa de Karnaugh</i>

|           |**$BC=00$**|**$BC=01$**|**$BC=11$**|**$BC=10$**
|------     |------     |------     |------     |------
|**$A=0$**  |1|0|1|1|
|**$A=1$**  |1|1|1|1|
 -->
<table style="border-collapse: collapse; text-align: center;">
  <thead>
    <tr>
      <th style="border: 1px solid #ccc; position: relative; width: 60px; height: 60px;">
        <div style="position: absolute; top: 5px; right: 5px;">    </div>
        <div style="position: absolute; bottom: 5px; left: 5px;">  </div>
      </th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">BC=00</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">BC=01</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">BC=11</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">BC=10</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">A=0</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">A=1</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
    </tr>
  </tbody>
</table>

Los valores de cada celda son los valores que toma la salida $S$ en función de $A$, $B$ y $C$ en una fila de la tabla.



## Reglas para el Mapa de Karnaugh

### **Código Gray:**
Las filas y columnas del mapa no se ordenan de forma convencional (00, 01, 10, 11), sino que siguen el código Gray (00, 01, 11, 10).
Es decir, entre dos celdas adyacentes (vertical u horizontalmente) solo cambia el valor de una única variable.

### **Rellenar la tabla:**
Se debe rellenar la tabla con los resultados de la variable de salida correspondientes a la combinación de valores de entrada de cada celda.

### **Agrupar los $1$ adyacentes:**
El objetivo es hacer grupos tan extensos como sea posible.
* Se agrupan los $1$ adyacentes en forma de fila, cuadrado o rectángulo.
* El tamaño de los grupos debe ser una potencia de dos. Es decir 1, 2, 4, 8, etc.
* Se deben ir formando grupos hasta que todos los $1$ de la tabla formen parte de al menos uno de ellos.
* Los bordes del mapa se consideran adyacentes con el borde opuesto, como si el mapa se extendiera repetido más allá de los bordes.

### **Obtención de la expresión lógica simplificada:**
Cada grupo de $1$ se traduce en un término de la función booleana simplificada. Para hacerlo, se observan qué variables no cambian de valor dentro del grupo; estas formarán parte del término de la expresión. Las variables que cambian de valor dentro del grupo no aparecerán en la expresión.



## Estructuras para mapas de Karnaugh de 2 a 5 variables

A continuación se muestran las estructuras de los mapas de Karnaugh para diferentes números de variables de entrada. Las tablas más comunes suelen ser las de 2 a 4 variables de entrada, pero se pueden utilizar para funciones de hasta 5 o 6 variables.


### Mapa de Karnaugh de 2 variables de entrada

<!-- Taula de 2 variables -->
<table style="border-collapse: collapse; text-align: center;">
  <thead>
    <tr>
      <th style="border: 1px solid #ccc; position: relative; width: 60px; height: 60px;">
        <div style="position: absolute; top: 5px; right: 5px;">   A </div>
        <div style="position: absolute; bottom: 5px; left: 5px;"> B </div>
        <div style="position: absolute; bottom: 0; left: 0; width: 100%; height: 1px; background: #ccc; transform-origin: top right; transform: rotate(+45deg);"></div>
      </th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">0</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">1</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">0</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">1</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
    </tr>
  </tbody>
</table>


### Mapa de Karnaugh de 3 variables de entrada

En este caso, las variables se pueden agrupar de diferentes maneras; A\BC (ejemplo anterior), B\AC o C\AB (este ejemplo). En cualquier caso, el mapa de valores es el mismo (Código Gray).

<!-- Taula de 3 variables -->
<table style="border-collapse: collapse; text-align: center;">
  <thead>
    <tr>
      <th style="border: 1px solid #ccc; position: relative; width: 60px; height: 60px;">
        <div style="position: absolute; top: 5px; right: 5px;">   AB </div>
        <div style="position: absolute; bottom: 5px; left: 5px;"> C </div>
        <div style="position: absolute; bottom: 0; left: 0; width: 100%; height: 1px; background: #ccc; transform-origin: top right; transform: rotate(+45deg);"></div>
      </th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">00</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">01</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">11</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">10</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">0</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">1</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
    </tr>
  </tbody>
</table>


### Mapa de Karnaugh de 4 variables de entrada

El mapa de valores es invariable, lo que cambia es el agrupamiento de las variables $A$, $B$, $C$ y $D$, que se puede hacer como convenga en cada caso.

<!-- Taula de 4 variables -->
<table style="border-collapse: collapse; text-align: center;">
  <thead>
    <tr>
      <th style="border: 1px solid #ccc; position: relative; width: 60px; height: 60px;">
        <div style="position: absolute; top: 5px; right: 5px;">   AB </div>
        <div style="position: absolute; bottom: 5px; left: 5px;"> CD </div>
        <div style="position: absolute; bottom: 0; left: 0; width: 100%; height: 1px; background: #ccc; transform-origin: top right; transform: rotate(+45deg);"></div>
      </th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">00</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">01</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">11</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">10</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">00</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">01</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">11</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">10</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
    </tr>
  </tbody>
</table>


### Mapa de Karnaugh de 5 variables de entrada

Utilizando el código Gray, el mapa de Karnaugh de 5 variables se estructura de la siguiente manera:

<!-- Taula de 5 variables -->
<table style="border-collapse: collapse; text-align: center;">
  <thead>
    <tr>
      <th style="border: 1px solid #ccc; position: relative; width: 60px; height: 60px;">
        <div style="position: absolute; top: 5px; right: 5px;">   ABC </div>
        <div style="position: absolute; bottom: 5px; left: 5px;"> DE </div>
        <div style="position: absolute; bottom: 0; left: 0; width: 100%; height: 1px; background: #ccc; transform-origin: top right; transform: rotate(+45deg);"></div>
      </th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">000</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">001</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">011</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">010</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px; border-left: 4px double #444;">110</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">111</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">101</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">100</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">00</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px; border-left: 4px double #444;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">01</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px; border-left: 4px double #444;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">11</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px; border-left: 4px double #444;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">10</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px; border-left: 4px double #444;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
    </tr>
  </tbody>
</table>

Este mapa es utilizable, pero omite que las columnas siguientes también pueden considerarse adyacentes.
+ 000 con 010
+ 110 con 100
+ 001 con 101
+ 011 con 111

Por ello, se suele representar con una línea en el centro que separa dos mapas 4×4 independientes y que crea adyacencias “cruzadas” entre los dos mapas, como si hubiera un espejo vertical en el centro.
Este mapa se puede llamar mapa de reflexión (*reflection map*).

Otra forma muy efectiva de estructurar un mapa de Karnaugh de 5 variables es hacer dos de 4 variables: uno representa $A=0$ y el otro $A=1$, considerando superpuestos en una tercera dimensión.

<table style="width: 100%; margin: 0 auto; border-collapse: collapse; text-align: center; background-color: transparent;">

  <tbody>
    <tr>
      <td>
        A=0
        <!-- Taula de 4 variables -->
        <table style="border-collapse: collapse; text-align: center;">
        <thead>
            <tr>
            <th style="border: 1px solid #ccc; position: relative; width: 60px; height: 60px;">
                <div style="position: absolute; top: 5px; right: 5px;">   BC </div>
                <div style="position: absolute; bottom: 5px; left: 5px;"> DE </div>
                <div style="position: absolute; bottom: 0; left: 0; width: 100%; height: 1px; background: #ccc; transform-origin: top right; transform: rotate(+45deg);"></div>
            </th>
            <th style="border: 1px solid #ccc; padding: 5px 10px;">00</th>
            <th style="border: 1px solid #ccc; padding: 5px 10px;">01</th>
            <th style="border: 1px solid #ccc; padding: 5px 10px;">11</th>
            <th style="border: 1px solid #ccc; padding: 5px 10px;">10</th>
            </tr>
        </thead>
        <tbody>
            <tr>
            <th style="border: 1px solid #ccc; padding: 5px 10px;">00</th>
            <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
            <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
            <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
            <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
            </tr>
            <tr>
            <th style="border: 1px solid #ccc; padding: 5px 10px;">01</th>
            <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
            <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
            <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
            <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
            </tr>
            <tr>
            <th style="border: 1px solid #ccc; padding: 5px 10px;">11</th>
            <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
            <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
            <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
            <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
            </tr>
            <tr>
            <th style="border: 1px solid #ccc; padding: 5px 10px;">10</th>
            <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
            <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
            <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
            <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
            </tr>
        </tbody>
        </table>
      </td>
      <td>
        A=1
        <!-- Taula de 4 variables -->
        <table style="border-collapse: collapse; text-align: center;">
        <thead>
            <tr>
            <th style="border: 1px solid #ccc; position: relative; width: 60px; height: 60px;">
                <div style="position: absolute; top: 5px; right: 5px;">   BC </div>
                <div style="position: absolute; bottom: 5px; left: 5px;"> DE </div>
                <div style="position: absolute; bottom: 0; left: 0; width: 100%; height: 1px; background: #ccc; transform-origin: top right; transform: rotate(+45deg);"></div>
            </th>
            <th style="border: 1px solid #ccc; padding: 5px 10px;">00</th>
            <th style="border: 1px solid #ccc; padding: 5px 10px;">01</th>
            <th style="border: 1px solid #ccc; padding: 5px 10px;">11</th>
            <th style="border: 1px solid #ccc; padding: 5px 10px;">10</th>
            </tr>
        </thead>
        <tbody>
            <tr>
            <th style="border: 1px solid #ccc; padding: 5px 10px;">00</th>
            <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
            <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
            <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
            <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
            </tr>
            <tr>
            <th style="border: 1px solid #ccc; padding: 5px 10px;">01</th>
            <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
            <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
            <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
            <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
            </tr>
            <tr>
            <th style="border: 1px solid #ccc; padding: 5px 10px;">11</th>
            <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
            <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
            <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
            <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
            </tr>
            <tr>
            <th style="border: 1px solid #ccc; padding: 5px 10px;">10</th>
            <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
            <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
            <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
            <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
            </tr>
        </tbody>
        </table>
    </td>
    </tr>
  </tbody>
</table>

I visualizarlos de la siguiente manera.

<img src='../../Annexos/kmap5var.png' alt="Karnaugh de 5 variables" style="display:block; width:400px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;"/>
<center><i>Mapa de Karnaugh de 5 variables</i></center>


## Ejemplo: 
Buscamos en nuestro ejemplo las agrupaciones más extensas posibles de $1$. Debemos continuar con el proceso hasta que todos los $1$ hayan sido considerados.


<table style="border-collapse: collapse; text-align: center;">
  <thead>
    <tr>
      <th style="border: 1px solid #ccc; position: relative; width: 60px; height: 60px;">
        <div style="position: absolute; top: 5px; right: 5px;">    </div>
        <div style="position: absolute; bottom: 5px; left: 5px;">  </div>
        <div style="position: absolute; bottom: 0; left: 0; width: 100%; height: 1px; background: #ccc; transform-origin: top right; transform: rotate(+45deg);"></div>
      </th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">BC=00</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">BC=01</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">BC=11</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">BC=10</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">A=0</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
    </tr>
    <tr style="background-color: lightblue;">
      <th style="border: 1px solid #ccc; padding: 5px 10px;">A=1</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
    </tr>
  </tbody>
</table>

En azul tenemos cuatro $1$ adyacentes en forma de fila. La variable común en todos ellos es $A=1$, las variables $B$ y $C$ cambian de valor. Así pues, el primer término de la expresión de $S$ será $A$.

$S=A+···$


<table style="border-collapse: collapse; text-align: center;">
  <thead>
    <tr>
      <th style="border: 1px solid #ccc; position: relative; width: 60px; height: 60px;">
        <div style="position: absolute; top: 5px; right: 5px;">    </div>
        <div style="position: absolute; bottom: 5px; left: 5px;">  </div>
        <div style="position: absolute; bottom: 0; left: 0; width: 100%; height: 1px; background: #ccc; transform-origin: top right; transform: rotate(+45deg);"></div>
      </th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">BC=00</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">BC=01</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">BC=11</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">BC=10</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">A=0</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px; background-color: red;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px; background-color: red;">1</td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">A=1</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px; background-color: red;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px; background-color: red;">1</td>
    </tr>
  </tbody>
</table>

En amarillo tenemos un grupo de cuatro $1$ adyacentes en forma de cuadrado. La variable común es $B=1$. Por lo tanto el segundo término de la expresión de $S$ es $B$.

$S=A+B+···$

<table style="border-collapse: collapse; text-align: center;">
  <thead>
    <tr>
      <th style="border: 1px solid #ccc; position: relative; width: 60px; height: 60px;">
        <div style="position: absolute; top: 5px; right: 5px;">    </div>
        <div style="position: absolute; bottom: 5px; left: 5px;">  </div>
        <div style="position: absolute; bottom: 0; left: 0; width: 100%; height: 1px; background: #ccc; transform-origin: top right; transform: rotate(+45deg);"></div>
      </th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">BC=00</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">BC=01</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">BC=11</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">BC=10</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">A=0</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px; background-color: red;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px; background-color: red;">1</td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">A=1</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px; background-color: red;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px; background-color: red;">1</td>
    </tr>
  </tbody>
</table>

Encara queden $1$ per agrupar, així que en vermell temos un altre grupo de cuatro $1$ adyacentes en forma de cuadrado. Aquest agrupament s'extén a través d'una vora de la taula. La variable que manté el seu valor és $C=0$, de manera que cal afegir el término $C$ negado, $\bar{C}$.

$S=A+B+\bar{C}$

Aquesta és doncs l'expressió booleana simplificada que engendra la taula de veritat d'exemple.
A partir d'aquesta es deduceix el circuit digital, tres entrades a una porta OR, una de ellas negada.

<img src='../../Annexos/kmap5var.png' alt="Agrupaciones de ejemplo" style="display:block; height:100px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;"/>
<center><i>Circuito resultado del ejemplo</i></center>


## Otros ejemplos
Los siguientes ejemplos nos ayudarán a entender todas las reglas.

## Ejemplo: 

<!-- Taula de 3 variables -->
<table style="border-collapse: collapse; text-align: center;">
  <thead>
    <tr>
      <th style="border: 1px solid #ccc; position: relative; width: 60px; height: 60px;">
        <div style="position: absolute; top: 5px; right: 5px;">   AB </div>
        <div style="position: absolute; bottom: 5px; left: 5px;"> C </div>
        <div style="position: absolute; bottom: 0; left: 0; width: 100%; height: 1px; background: #ccc; transform-origin: top right; transform: rotate(+45deg);"></div>
      </th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">00</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">01</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">11</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">10</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">0</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: red;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: red;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">1</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightblue;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightblue;">1</td>
    </tr>
  </tbody>
</table>



El grupo rojo engendra el término $\bar{A}\bar{C}$ porque las variables constantes son $A=0$ y $C=0$. Tanto $A$ como $C$ deben aparecer negadas porque toman el valor $0$.

En el grupo azul $A=1$ y $C=1$, por lo tanto su término en la expresión booleana es $AC$.

La expresión simplificada final es la siguiente.

$S=\bar{A}\bar{C} + AC$

El hecho de que no aparezca la variable $B$ significa que esta no tiene ningún efecto sobre el resultado $S$.

## Ejemplo: 

<!-- Taula de 3 variables -->
<table style="border-collapse: collapse; text-align: center;">
  <thead>
    <tr>
      <th style="border: 1px solid #ccc; position: relative; width: 60px; height: 60px;">
        <div style="position: absolute; top: 5px; right: 5px;">   AB </div>
        <div style="position: absolute; bottom: 5px; left: 5px;"> C </div>
        <div style="position: absolute; bottom: 0; left: 0; width: 100%; height: 1px; background: #ccc; transform-origin: top right; transform: rotate(+45deg);"></div>
      </th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">00</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">01</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">11</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">10</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">0</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightblue;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightblue;">1</td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">1</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
    </tr>
  </tbody>
</table>

Con un solo grupo basta en este ejemplo. Las variables constantes son $B=0$ y $C=0$. La expresión simplificada final tiene un solo término.

$S=\bar{B}\bar{C}$

## Ejemplo: 

<!-- Taula de 3 variables -->
<table style="border-collapse: collapse; text-align: center;">
  <thead>
    <tr>
      <th style="border: 1px solid #ccc; position: relative; width: 60px; height: 60px;">
        <div style="position: absolute; top: 5px; right: 5px;">   AB </div>
        <div style="position: absolute; bottom: 5px; left: 5px;"> C </div>
        <div style="position: absolute; bottom: 0; left: 0; width: 100%; height: 1px; background: #ccc; transform-origin: top right; transform: rotate(+45deg);"></div>
      </th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">00</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">01</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">11</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">10</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">0</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
    </tr>
    <tr style="background-color: lightblue;">
      <th style="border: 1px solid #ccc; padding: 5px 10px;">1</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
    </tr>
  </tbody>
</table>

Altre cop, amb un sol grup en tenim prou. L'única variable que no canvia és $C=1$, d'aquesta manera $S$ només dependrà de $C$.

$S=C$

## Ejemplo: 

<!-- Taula de 4 variables -->
<table style="border-collapse: collapse; text-align: center;">
  <thead>
    <tr>
      <th style="border: 1px solid #ccc; position: relative; width: 60px; height: 60px;">
        <div style="position: absolute; top: 5px; right: 5px;">   AB </div>
        <div style="position: absolute; bottom: 5px; left: 5px;"> CD </div>
        <div style="position: absolute; bottom: 0; left: 0; width: 100%; height: 1px; background: #ccc; transform-origin: top right; transform: rotate(+45deg);"></div>
      </th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">00</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">01</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">11</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">10</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">00</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: red;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: red;">1</td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">01</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightblue;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightblue;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">11</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightblue;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightblue;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">10</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: red;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: red;">1</td>
    </tr>
  </tbody>
</table>

En este ejemplo, el grupo rojo agrupa $B=0$ y $D=0$, el grupo azul agrupa $B=1$ y $D=1$.

$S=\bar{B}\bar{D}+BD$

## Ejemplo: 

<!-- Taula de 3 variables -->
<table style="border-collapse: collapse; text-align: center;">
  <thead>
    <tr>
      <th style="border: 1px solid #ccc; position: relative; width: 60px; height: 60px;">
        <div style="position: absolute; top: 5px; right: 5px;">   AB </div>
        <div style="position: absolute; bottom: 5px; left: 5px;"> C </div>
        <div style="position: absolute; bottom: 0; left: 0; width: 100%; height: 1px; background: #ccc; transform-origin: top right; transform: rotate(+45deg);"></div>
      </th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">00</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">01</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">11</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">10</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">0</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightgreen;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;color: red; font-weight: bold;-webkit-text-stroke: 1px red;background-color: lightgreen;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;color: red; font-weight: bold;-webkit-text-stroke: 1px red;background-color: lightgreen;">1</td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">1</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightblue;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;color: red; font-weight: bold;-webkit-text-stroke: 1px red;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;color: red; font-weight: bold;background-color: lightblue;-webkit-text-stroke: 1px red;">1</td>
    </tr>
  </tbody>
</table>

Este ejemplo se puede resolver con tres grupos. El rojo es $A$, el verde es $B\bar{C}$ y el azul $\bar{B}C$.

$S=A+B\bar{C}+\bar{B}C$


<!-- Esta imagen debe ir al final de cada lección, ya sea con esta línea o dentro de la firma. Dejar comentado si ya está a la firma-->
<br><br><img src="../../logos/TotsLogosBlanc.png" alt="CHIP Chair Logos" width="100%" style="display:block; margin:0 auto; border-radius:8px;"/>
<Autors autors="xcasas fmadrid"/>
