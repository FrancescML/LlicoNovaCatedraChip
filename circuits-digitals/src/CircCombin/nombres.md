<!-- Posar aquesta imatge al començament de cada lliçó -->
<img src='../logos/illustracio1.png' alt="Circuits digitals" style=" float: left; border-radius: 8px; height: 120px; text-align: right;"/>
<img src='../logos/LogoCatedraCHIPBlanc.jpg' alt="Logo Càtedra Chip" style="float: right; border-radius: 8px; height: 120px; text-align: right;"/>
<div style="clear: both;"></div>
<br>

# Nombres
En els circuits digitals i la lògica digital els nombres s’implementen en binari. Les operacions matemàtiques es realitzen amb bits, des de les més bàsiques a les més complexes. Aquestes inclouen sumes, restes, comparar nombres (parells o imparells), multiplicacions, divisions o calcular el mòdul.


## EXEMPLE 1:  Nombre parell o imparell.

L'objectiu és dissenyar un circuit que rebi a l'entrada un número de 4 bits i produeixi una sortida que s'activi amb un '1' quan el número d'entrada sigui parell.

Un nombre parell és divisible per 2, i en notació binària es reconeix fàcilment perquè el seu bit menys significatiu (LSB) és 0.

La **variable d'entrada** al circuit és:

$number[3:0]= [number_3 \; number_2 \; number_1 \; number_0]$

El bit menys significatiu (**LSB**) és $number_0$.

La **variable de sortida** del circuit la és un sol bit $Parell$.

La següent taula recull uns quants exemples d'entrades i sortides que il·lustren el comportament desitjat del circuit. La taula de veritat completa tindria 16 files.

|**$number$**|**Nombre en decimal**|$number_0$ (LSB)|Paritat| $Parell$|
|:---:|:---:|:---:|---|:---:|
|0000 | 0  | 0 | és Parell| 1 
|0001 | 1  | 1 | és Senar | 0
|0010 | 2  | 0 | és Parell| 1 
|0011 | 3  | 1 | és Senar | 0
|1110 | 14 | 0 | és Parell| 1 
|1111 | 15 | 1 | és Senar | 0

Construir el circuit és força directe, la sortida $Parell$ s'ha d'activar (valor '1') si i només si $number[0]$ té el valor '0', independentment del valor de la resta de bits de $number$.

La sortida és doncs la negació de $number_0$:

$Parell=\overline{number_0}$

El circuit s'implementa amb una sola porta lògica NOT al bit $number_0$.



<img src='./nombres_exemple1.png' alt="Circuit desplaçador"  style="display:block; height:130px; margin:0 auto; border-radius: 8px;"/>

<center><i>Circuit digital que desplaça una posició cap a l'esquerra</i></center>


## EXEMPLE 2:  Mòdul 7 d’un número binari de 4 bits

L’objectiu d’aquest exemple és dissenyar un circuit que calculi el mòdul 7 d’un número binari $n$, de 4 bits. Calcular el mòdul 7 d’un número consisteix en trobar el residu quan aquest es divideix per 7. La notació per aquesta operació és:

$n \mod 7$

Un número de 4 bits $n[3:0]=[n_3 \; n_2 \; n_1 \; n_0]$ pot prendre 16 valors diferents des de 0000 a 1111 (de 0 a 15 en decimal).

Els residus després de dividir un nombre per 7  poden prendre valors de 0 a 6. Per tal de representar el resultat de l'operació, n’hi haurà prou amb un nombre de 3 bits, que pot prendre valors del 000 al 111 (del 0 al 7 en decimal).

$residu[2:0] = [residu_2 \; residu_1 \; residu_0]$

El primer pas per dissenyar aquest circuit és crear la taula de veritat que relaciona cada entrada n de 4 bits $n[3:0]$ amb el seu residu corresponent de 3 bits $residu[2:0]$.

$residu[2:0] = n[3:0] \mod 7$

| $n$ (decimal) | $n_3 \; n_2 \; n_1 \; n_0$ | $residu$ (decimal) | $residu_2 \; residu_1 \; residu_0$ |
|--- |---|---|---|
| 0  | 0000 | 0 | 000
| 1  | 0001 | 1 | 001
| 2  | 0010 | 2 | 010
| 3  | 0011 | 3 | 011
| 4  | 0100 | 4 | 100
| 5  | 0101 | 5 | 101
| 6  | 0110 | 6 | 110
| 7  | 0111 | 0 | 000
| 8  | 1000 | 1 | 001
| 9  | 1001 | 2 | 010
| 10 | 1010 | 3 | 011
| 11 | 1011 | 4 | 100
| 12 | 1100 | 5 | 101
| 13 | 1101 | 6 | 110
| 14 | 1110 | 0 | 000
| 15 | 1111 | 1 | 001

Aquest circuit té 3 bits de sortida; $residu_2$, $residu_1$ i $residu_0$. Emprarem un mapa de Karnaugh de 4 variables d'entrada per a cadascun d’aquests bits i obtenir la seva expressió booleana simplificada .

Muntem el mapa de Karnaugh de 4 variables d'entrada per a la sortida $residu_0$ i n'identifiquem 3 grups.
<!-- Taula de 4 variables 
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
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1 </td>
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
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
    </tr>
  </tbody>
</table>
-->

<!-- VERD -->
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

<!-- VERMELL -->
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
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: red;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: red;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">01</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: red;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: red;">1 </td>
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
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
    </tr>
  </tbody>
</table>

<!-- BLAU -->
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


L'expressió booleana simplificada per a $residu_0$ tindrà 3 termes:

$residu_0= \overline{n_1} n_0 + \overline{n_3} n_0 + \overline{n_2} n_0$


Muntem el mapa de Karnaugh de 4 variables d'entrada per a la sortida $residu_1$ i n'identifiquem 2 grups.

<!-- Taula de 4 variables 
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
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1 </td>
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
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1 </td>
    </tr>
  </tbody>
</table>
-->

<!-- VERMELL -->
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

<!-- BLAU -->
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
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightblue;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightblue;">1 </td>
    </tr>
  </tbody>
</table>


L'expressió booleana simplificada per a $residu_1$ tindrà 2 termes:

$residu_1= \overline{n_3} n_1 + \overline{n_2} n_1$



Per a la sortida $residu_2$ identifiquem 2 grups en el seu mapa de Karnaugh.


<!-- VERMELL -->
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
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">01</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: red;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: red;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1 </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">11</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: red;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: red;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">10</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
    </tr>
  </tbody>
</table>


<!-- BLAU -->
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
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">01</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightblue;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightblue;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightblue;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightblue;">1 </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">11</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">10</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
    </tr>
  </tbody>
</table>


Així doncs, l'expressió booleana simplificada per a $residu_2$ tindrà 2 termes:

$residu_2=  n_2 \overline{n_1} + \overline{n_3} n_2$

A partir d'aquestes tres expressions podem emprar les portes lògiques per crear el circuit digital que implementarà la funció $n \mod{7}$.


<img src='./nombres_exemple2.png' alt="Circuit digital" style="display:block; height:600px; margin:0 auto; border-radius: 8px;"/>

<center><i>Circuit digital que implementa la funció n mod 7</i></center>


## Exercicis de [Introduction to Digital Circuit Design](https://jutge.org/courses/JordiCortadella:IntroCircuits)

[Even number](https://jutge.org/problems/X36253_en)

[Prime number](https://jutge.org/problems/X07160_en)

[Max of two numbers](https://jutge.org/problems/X37473_en)

[Residue mod 7](https://jutge.org/problems/X91814_en)

<small>*Recorda (troba-ho a la pàgina d'[inici](../Intro/inici.md)) que per accedir als exercicis i que el **Jutge** valori les teves solucions has d'estar inscrit al [curs](https://jutge.org/courses/JordiCortadella:IntroCircuits).*</small>

<!-- Aquesta imatge ha d'anar al final de cada lliçó, ja sigui amb aquesta línia o dins la signatura. Deixar comentat si ja està a la signatura-->
<br>
<br>
<img src='../logos/TotsLogosBlanc.png ' alt="Logos Càtedra Chip" width="100%" style="display:block; margin:0 auto; border-radius: 8px;"/>


<Autors autors="xcasas fmadrid jordic"/>