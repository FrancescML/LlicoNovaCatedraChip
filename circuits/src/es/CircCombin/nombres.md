<!-- Colocar esta imagen al inicio de cada lección -->
<img src="../../logos/illustracio1.png" alt="Digital circuits" style="float: left; border-radius: 8px; height: 120px;"/>
<img src="../../logos/LogoCatedraCHIPBlanc.jpg" alt="CHIP Chair Logo" style="float: right; border-radius: 8px; height: 120px;"/>
<div style="clear: both;"></div>
<br>



# Números

En los circuitos digitales, los números se implementan en notación binaria y todas las operaciones matemáticas (suma, resta, comparación, multiplicación, división o módulo) se realizan manipulando bits.

## Ejemplo: Número par o impar

Diseñaremos un circuito que reciba a la entrada un número de 4 bits y active la salida (Par=1) cuando el número de entrada sea par.

Un número binario es par si su bit menos significativo (LSB) vale 0.

Definimos la variable de entrada:

$$numero[3:0] = [numero_3\ numero_2\ numero_1\ numero_0]$$

El bit menos significativo es $numero_0$.

La salida es un solo bit:
- $Par = 1$ si el número es par.
- $Par = 0$ si el número es impar.

Tabla parcial de ejemplos (la completa tendría 16 filas):

|**número**|**Número en decimal**|$numero_0$ (LSB)|Paridad| $Par$|
|:---:|:---:|:---:|:---|:---:|
| 0000 | 0  | 0 | Par | 1 |
| 0001 | 1  | 1 | Impar  | 0 |
| 0010 | 2  | 0 | Par | 1 |
| 0011 | 3  | 1 | Impar  | 0 |
| 1110 | 14 | 0 | Par | 1 |
| 1111 | 15 | 1 | Impar  | 0 |


Construir el circuito es bastante directo; la salida $Par$ debe activarse (valor $1$) si y solo si $numero_0$ tiene el valor $0$, independientemente del valor del resto de bits del número.

La salida es por tanto la negación de $numero_0$.

$$Par = \overline{numero_0}$$

Por tanto, solo hace falta una puerta NOT.

<img src="../../CircCombin/nombres_exemple1.png" alt="Circuito de paridad" style="display:block; height:130px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;"/>
<center><i>Circuito que determina la paridad de un número</i></center>

## Ejemplo: Módulo 7 de un número de 4 bits

Diseñaremos un circuito que calcule el módulo 7 de un número binario $n$, de 4 bits. Calcular el módulo 7 de un número consiste en hallar el residuo cuando este se divide por 7. La notación para esta operación es:

$$residuo = n \bmod 7$$

Un número de 4 bits $n[3:0]=[n_3 \; n_2 \; n_1 \; n_0]$ puede tomar 16 valores diferentes desde 0000 a 1111 (de 0 a 15 en decimal).

Los residuos tras dividir un número por 7 pueden tomar valores de 0 a 6. Para representar el resultado de la operación, bastará con un número de 3 bits, que puede tomar valores del 000 al 111 (del 0 al 7 en decimal).

$$residuo[2:0] = [residuo_2\ residuo_1\ residuo_0]$$

El primer paso para diseñar este circuito es crear la tabla de verdad completa que relacione cada entrada $n$ de 4 bits $n[3:0]$ con su residuo correspondiente de 3 bits $residuo[2:0]$.

$residuo[2:0] = n[3:0] \bmod 7$

| $n$ (decimal) | $n_3 \; n_2 \; n_1 \; n_0$ | $residuo$ (decimal) | $residuo_2 \; residuo_1 \; residuo_0$ |
|---|---|---|---|
| 0  | 0000 | 0 | 000 |
| 1  | 0001 | 1 | 001 |
| 2  | 0010 | 2 | 010 |
| 3  | 0011 | 3 | 011 |
| 4  | 0100 | 4 | 100 |
| 5  | 0101 | 5 | 101 |
| 6  | 0110 | 6 | 110 |
| 7  | 0111 | 0 | 000 |
| 8  | 1000 | 1 | 001 |
| 9  | 1001 | 2 | 010 |
| 10 | 1010 | 3 | 011 |
| 11 | 1011 | 4 | 100 |
| 12 | 1100 | 5 | 101 |
| 13 | 1101 | 6 | 110 |
| 14 | 1110 | 0 | 000 |
| 15 | 1111 | 1 | 001 |


Para cada salida ($residuo_0$, $residuo_1$, $residuo_2$) se construye un mapa de Karnaugh de 4 variables para obtener su expresión booleana simplificada.

### Salida residuo_0
Armamos el mapa de Karnaugh de 4 variables de entrada para la salida residuo_0 e identificamos 3 grupos.

<!-- VERDE -->
<table style="border-collapse: collapse; text-align: center;">
  <thead>
    <tr>
      <th style="border: 1px solid #ccc; position: relative; width: 60px; height: 60px;">
        <div style="position: absolute; top: 5px; right: 5px;">   n1 n0 </div>
        <div style="position: absolute; bottom: 5px; left: 5px;"> n3 n2 </div>
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
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightgreen;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">01</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightgreen;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">11</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightgreen;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">10</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightgreen;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
    </tr>
  </tbody>
</table>

<!-- ROJO -->
<table style="border-collapse: collapse; text-align: center;">
  <thead>
    <tr>
      <th style="border: 1px solid #ccc; position: relative; width: 60px; height: 60px;">
        <div style="position: absolute; top: 5px; right: 5px;">   n1 n0 </div>
        <div style="position: absolute; bottom: 5px; left: 5px;"> n3 n2 </div>
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
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: red;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: red;">1 </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">01</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: red;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: red;">1 </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">11</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">10</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: red;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: red;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
    </tr>
  </tbody>
</table>

<!-- VERDE -->
<h4>Sortida residuo_0</h4>
La expresión booleana simplificada para residuo_0 tendrá 3 términos:

$$residuo_0 = \overline{n_1}n_0 + \overline{n_3}n_0 + \overline{n_2}n_0$$

### Salida residuo_1
Armamos el mapa de Karnaugh de 4 variables de entrada para la salida residuo_1 e identificamos 2 grupos.

<!-- ROJO -->
<table style="border-collapse: collapse; text-align: center;">
  <thead>
    <tr>
      <th style="border: 1px solid #ccc; position: relative; width: 60px; height: 60px;">
        <div style="position: absolute; top: 5px; right: 5px;">   n1 n0 </div>
        <div style="position: absolute; bottom: 5px; left: 5px;"> n3 n2 </div>
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
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: red;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: red;">1 </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">01</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: red;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: red;">1 </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">11</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">10</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1 </td>
    </tr>
  </tbody>
</table>

<!-- AZUL -->
<table style="border-collapse: collapse; text-align: center;">
  <thead>
    <tr>
      <th style="border: 1px solid #ccc; position: relative; width: 60px; height: 60px;">
        <div style="position: absolute; top: 5px; right: 5px;">   n1 n0 </div>
        <div style="position: absolute; bottom: 5px; left: 5px;"> n3 n2 </div>
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
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightblue;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightblue;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">01</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">11</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">10</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightblue;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightblue;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
    </tr>
  </tbody>
</table>


Així doncs, l'expressió booleana simplificada per a residuo_0 tindrà 3 termes:


$$residuo_0 = \overline{n_1}n_0 + \overline{n_3}n_0 + \overline{n_2}n_0$$

### Salida residuo_1
Armamos el mapa de Karnaugh de 4 variables de entrada para la salida residuo_1 e identificamos 2 grupos.

<!-- ROJO -->
<table style="border-collapse: collapse; text-align: center;">
  <thead>
    <tr>
      <th style="border: 1px solid #ccc; position: relative; width: 60px; height: 60px;">
        <div style="position: absolute; top: 5px; right: 5px;">   n1 n0 </div>
        <div style="position: absolute; bottom: 5px; left: 5px;"> n3 n2 </div>
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
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: red;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: red;">1 </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">01</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: red;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: red;">1 </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">11</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">10</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1 </td>
    </tr>
  </tbody>
</table>

<!-- AZUL -->
<table style="border-collapse: collapse; text-align: center;">
  <thead>
    <tr>
      <th style="border: 1px solid #ccc; position: relative; width: 60px; height: 60px;">
        <div style="position: absolute; top: 5px; right: 5px;">   n1 n0 </div>
        <div style="position: absolute; bottom: 5px; left: 5px;"> n3 n2 </div>
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
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightblue;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightblue;">1 </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">01</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1 </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">11</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">10</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightblue;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightblue;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
    </tr>
  </tbody>
</table>

A partir de estas tres expresiones podemos usar las puertas lógicas para crear el circuito digital que implementará la función $n \bmod 7$.

<img src="../../CircCombin/nombres_exemple2.png" alt="Circuito módulo 7" style="display:block; height:500px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;"/>
<center><i>Circuito digital que implementa la función $n \bmod 7$</i></center>

## Ejercicios en Jutge.org:[Introduction to Digital Circuit Design](https://jutge.org/courses/JordiCortadella:IntroCircuits)

- [Número par](https://jutge.org/problems/X36253_en)
- [Número primo](https://jutge.org/problems/X07160_en)
- [Máximo de dos números](https://jutge.org/problems/X37473_en)
- [Residuo módulo 7](https://jutge.org/problems/X91814_en)

<small>*Recuerda que para acceder a los ejercicios y para que el Jutge valore tus soluciones debes estar inscrito en el [curso](https://jutge.org/courses/JordiCortadella:IntroCircuits). Encontrarás todas las instrucciones [aquí](../Inici/instruccions.md).*</small>

<!-- Esta imagen debe ir al final de cada lección, ya sea con esta línea o dentro de la firma. Dejar comentado si ya está a la firma-->
<br><br><img src="../../logos/TotsLogosBlanc.png" alt="CHIP Chair Logos" width="100%" style="display:block; margin:0 auto; border-radius:8px;"/>
<Autors autors="xcasas fmadrid"/>