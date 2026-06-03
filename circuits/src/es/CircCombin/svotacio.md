<!-- Colocar esta imagen al inicio de cada lección -->
<img src="../../logos/illustracio1.png" alt="Digital circuits" style="float: left; border-radius: 8px; height: 120px;"/>
<img src="../../logos/LogoCatedraCHIPBlanc.jpg" alt="CHIP Chair Logo" style="float: right; border-radius: 8px; height: 120px;"/>
<div style="clear: both;"></div>
<br>



# Sistemas de votación

En el contexto de los circuitos digitales, los sistemas de votación hacen referencia a implementaciones electrónicas o lógicas diseñadas para procesar múltiples entradas y determinar un resultado basado en una regla de mayoría de votos o en una lógica predefinida.

## Ejemplo: Sistema de votación para un comité

Diseñaremos un sistema electrónico de votación para el Comité Ejecutivo de un equipo de fútbol. Este comité tiene cuatro miembros: el Presidente, el Secretario, el Tesorero y el Vocal. Cada uno puede votar Sí (1) o No (0).

Las reglas de aprobación son:

1. Una propuesta se aprueba cuando tres o más miembros votan a favor.
2. En caso de empate (2 a favor y 2 en contra), el voto del presidente decide. Si el presidente vota "Sí", la propuesta se aprueba; si vota "No", se rechaza.

Diseñaremos un circuito lógico con cuatro entradas ($P$, $S$, $T$, $V$) y una salida ($A$) que indica si la propuesta queda aprobada.

Definimos las variables de entrada (1 significa "Sí", 0 significa "No"):

* $P$: voto del Presidente
* $S$: voto del Secretario
* $T$: voto del Tesorero
* $V$: voto del Vocal

La variable de salida es $A$ (Approved). 1 significa aprobada, 0 significa rechazada.

Analizaremos en qué supuestos la propuesta será aprobada; los llamaremos condiciones de aprobación y se derivan de las reglas de aprobación.

Condición 1: Tres o más votos a favor.

Identificamos todas las combinaciones en las que la suma de P, S, T y V es 3 o 4.

- Aprobado por tres votos a favor
    - $P=0$, $S=1$, $T=1$ y $V=1$ --> ($\bar{P}STV$)
    - $P=1$, $S=1$, $T=1$ y $V=0$ --> ($PST\bar{V}$)
    - $P=1$, $S=1$, $T=0$ y $V=1$ --> ($PS\bar{T}V$)
    - $P=1$, $S=0$, $T=1$ y $V=1$ --> ($P\bar{S}TV$)
- Aprobado por cuatro votos a favor
    - $P=1$, $S=1$, $T=1$ y $V=1$ --> ($PSTV$)

La propuesta se aprobará si se cumple cualquiera de estos supuestos (operación OR o suma lógica). La condición 1 se expresa de la siguiente manera en el álgebra de Boole:

$$
C_1 = \bar{P}STV + PST\bar{V} + PS\bar{T}V + P\bar{S}TV + PSTV
$$

Condición 2: Empate resuelto favorablemente por el presidente.

Es necesario identificar todas las combinaciones de dos votos a favor y dos en contra. Y de ellas, nos interesan aquellas con $P=1$.
- Aprobado
    - $P=1$, $S=1$, $T=0$ y $V=0$ --> ($PS\bar{T}\bar{V}$)
    - $P=1$, $S=0$, $T=1$ y $V=0$ --> ($P\bar{S}T\bar{V}$)
    - $P=1$, $S=0$, $T=0$ y $V=1$ --> ($P\bar{S}\bar{T}V$)
- No aprobado
    - $P=0$ , $S=1$, $T=1$ y $V=0$
    - $P=0$ , $T=0$, $S=1$ y $V=1$
    - $P=0$ , $S=0$, $T=1$ y $V=1$

La propuesta se aprobará si se cumple alguno de estos supuestos. La condición 2 se expresa como:

$$C_2 = PS\bar{T}\bar{V} + P\bar{S}T\bar{V} + P\bar{S}\bar{T}V$$

La salida $A$ será 1 si se cumple la condición $C_1$ o bien la condición $C_2$. La función booleana es una suma lógica (OR) de estas dos condiciones:

$$A=C_1+C_2$$

Y por tanto la expresión de $A$, en función de $P$, $S$, $T$ y $V$ es:

$$A = \bar{P}STV + PST\bar{V} + PS\bar{T}V + P\bar{S}TV + PSTV + PS\bar{T}\bar{V} + P\bar{S}T\bar{V} + P\bar{S}\bar{T}V$$

Construimos la tabla de verdad con todos los casos posibles:

| $P$ | $S$ | $T$ | $V$ | Votos favorables | $C_1$ | $C_2$ | $A$ |
| --- | --- | --- | --- | :-------------: | ----- | ----- | --- |
| 0   | 0   | 0   | 0   |        0        | 0     | 0     | 0   |
| 0   | 0   | 0   | 1   |        1        | 0     | 0     | 0   |
| 0   | 0   | 1   | 0   |        1        | 0     | 0     | 0   |
| 0   | 0   | 1   | 1   |        2        | 0     | 0     | 0   |
| 0   | 1   | 0   | 0   |        1        | 0     | 0     | 0   |
| 0   | 1   | 0   | 1   |        2        | 0     | 0     | 0   |
| 0   | 1   | 1   | 0   |        2        | 0     | 0     | 0   |
| 0   | 1   | 1   | 1   |        3        | 1     | 0     | 1   |
| 1   | 0   | 0   | 0   |        1        | 0     | 0     | 0   |
| 1   | 0   | 0   | 1   |        2        | 0     | 1     | 1   |
| 1   | 0   | 1   | 0   |        2        | 0     | 1     | 1   |
| 1   | 0   | 1   | 1   |        3        | 1     | 0     | 1   |
| 1   | 1   | 0   | 0   |        2        | 0     | 1     | 1   |
| 1   | 1   | 0   | 1   |        3        | 1     | 0     | 1   |
| 1   | 1   | 1   | 0   |        3        | 1     | 0     | 1   |
| 1   | 1   | 1   | 1   |        4        | 1     | 0     | 1   |

La expresión para $A$ en función de $P$, $S$, $T$ y $V$ es muy larga. Hacer una simplificación lógica mediante álgebra booleana sería compleja. Alternativamente, podemos usar un [mapa de Karnaugh](../Annexos/karnaugh.md) para la función de salida $A$, con las entradas $P$, $S$, $T$ y $V$ agrupadas.

<!-- 
| PS\TV | 00 | 01 | 11 | 10 |
| --- | --- | --- | --- | --- | 
| 00 | 0 | 0 | 0 | 0 |  
| 01 | 0 | 0 | 1 | 0 | 
| 11 | 1 | 1 | 1 | 1 |
| 10 | 0 | 1 | 1 | 1 |
-->

<table style="border-collapse: collapse; text-align: center;">
  <thead>
    <tr>
      <th style="border: 1px solid #ccc; position: relative; width: 60px; height: 60px;">
        <div style="position: absolute; top: 5px; right: 5px;">TV</div>
        <div style="position: absolute; bottom: 5px; left: 5px;">PS</div>
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
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">01</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">11</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px; background-color: lightblue;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px; background-color: lightblue;">1</td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">10</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px; background-color: lightblue;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px; background-color: lightblue;">1</td>
    </tr>
  </tbody>
</table>

Las variables constantes en el grupo azul son $P=1$ y $T=1$, esto se traduce en el término $PT$ en la solución.

$$A=PT+···$$

<table style="border-collapse: collapse; text-align: center;">
  <thead>
    <tr>
      <th style="border: 1px solid #ccc; position: relative; width: 60px; height: 60px;">
        <div style="position: absolute; top: 5px; right: 5px;">TV</div>
        <div style="position: absolute; bottom: 5px; left: 5px;">PS</div>
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
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">01</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">11</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightgreen;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightgreen;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightgreen;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightgreen;">1</td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">10</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
    </tr>
  </tbody>
</table>

Las variables constantes en el grupo amarillo son $P=1$ y $V=1$, añadimos el término $PV$ a la solución.

$$A=PT + PV + ···$$


<table style="border-collapse: collapse; text-align: center;">
  <thead>
    <tr>
      <th style="border: 1px solid #ccc; position: relative; width: 60px; height: 60px;">
        <div style="position: absolute; top: 5px; right: 5px;">TV</div>
        <div style="position: absolute; bottom: 5px; left: 5px;">PS</div>
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
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">01</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">11</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightgreen;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightgreen;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightgreen;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightgreen;">1</td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">10</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
    </tr>
  </tbody>
</table>

Las variables constantes en el grupo verde tienen en común $P=1$ y $S=1$, añadimos el término $PS$ a la solución

$$A=PT + PV + PS + ···$$


<table style="border-collapse: collapse; text-align: center;">
  <thead>
    <tr>
      <th style="border: 1px solid #ccc; position: relative; width: 60px; height: 60px;">
        <div style="position: absolute; top: 5px; right: 5px;">TV</div>
        <div style="position: absolute; bottom: 5px; left: 5px;">PS</div>
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
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">01</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: red;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">11</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: red;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">10</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
    </tr>
  </tbody>
</table>

El agrupamiento de color verde tiene en común $P=1$ y $S=1$, añadimos el término $PS$ a la solución

$$A=PT + PV + PS + ···$$


<table style="border-collapse: collapse; text-align: center;">
  <thead>
    <tr>
      <th style="border: 1px solid #ccc; position: relative; width: 60px; height: 60px;">
        <div style="position: absolute; top: 5px; right: 5px;">TV</div>
        <div style="position: absolute; bottom: 5px; left: 5px;">PS</div>
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
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">01</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: red;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">11</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: red;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">10</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
    </tr>
  </tbody>
</table>

Finalment, en el grupo rojo las variables constantes son $S=1$, $T=1$ y $V=1$, añadimos el término $STV$ a la solución.

$$A = PT + PV + PS + STV$$

Esta es la expresión booleana simplificada final, porque todos los '1' ya han sido considerados en algún grupo.

El circuito digital derivado de esta expresión es el siguiente:


<img src='../../CircCombin/svotacio_exemple.png' alt="Circuito digital" style="display:block; height:280px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;"/>
<center><i>Circuito digital que implementa el sistema de votación para comité Ejecutivo</i></center>

## Ejercicios en Jutge.org:[Introduction to Digital Circuit Design](https://jutge.org/courses/JordiCortadella:IntroCircuits)

- [Executive Committee](https://jutge.org/problems/X16063_en)
- [Two or more ones](https://jutge.org/problems/X67345_en)
- [4-input majority voter](https://jutge.org/problems/X42168_en)
- [Majority of 5 inputs](https://jutge.org/problems/X72286_en)

<small>*Recuerda que para acceder a los ejercicios y para que el Jutge valore tus soluciones debes estar inscrito en el curso. Encontrarás todas las instrucciones aquí (../Inici/instruccions.md).* </small>

<!-- Esta imagen debe ir al final de cada lección, ya sea con esta línea o dentro de la firma. Dejar comentado si ya está a la firma-->
<br><br><img src="../../logos/TotsLogosBlanc.png" alt="CHIP Chair Logos" width="100%" style="display:block; margin:0 auto; border-radius:8px;"/>
<Autors autors="xcasas fmadrid"/>