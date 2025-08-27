
<!-- Posar aquesta imatge al començament de cada lliçó -->
<img src='../logos/illustracio1.png' alt="Circuits digitals" style=" float: left; border-radius: 8px; height: 120px; text-align: right;"/>
<img src='../logos/LogoCatedraCHIPBlanc.jpg' alt="Logo Càtedra Chip" style="float: right; border-radius: 8px; height: 120px; text-align: right;"/>
<div style="clear: both;"></div>
<br>

## Mapes de Karnaugh

Un mapa de Karnaugh (també conegut com a K-map o diagrama de Veitch) és una eina gràfica utilitzada en electrònica digital per simplificar funcions lògiques booleanes de manera visual i sistemàtica. 

L'objectiu principal és trobar l'expressió algebraica més simple possible per a una funció lògica determinada. Una funció lògica més simple es tradueix directament en un circuit digital més senzill.

Es tracta d’un mètode alternatiu a la simplificació amb les lleis de l'àlgebra de Boole que sovint resulta més ràpid i menys propens a errors per a funcions de poques variables (típicament de 2 a 4, però es poden utilitzar per a funcions de fins a 6 variables).

Un mapa de Karnaugh és una graella que organitza totes les possibles combinacions de les variables d’entrada d’una funció booleana. Cada cel·la representa una combinació de les variables d'entrada de la funció (una fila de la taula de la veritat).

Aquest mapa s’ha d’ordenar de manera que entre dues cel·les adjacents (verticalment o horitzontalment) canvia el valor d'una única variable. Això facilita identificar patrons i fer agrupacions per reduir l’expressió lògica.

## Exemple

Vegem la següent taula de veritat d'un circuit digital hipotètic. Aquesta representa les variables d’entrada $A$, $B$ i $C$ i la sortida $S$.

<i>Taula de veritat</i>
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

<i>Mapa de Karnaugh</i>
<!-- 
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




Els valors de cada cel·la són els valors que pren la sortida $S$ en funció de $A$, $B$ i $C$.

## Estructures per a mapes de Karnaugh de 2 a 5 variables

A continuació es mostren les estructures dels mapes de Karnaugh per diferents nombres de variables d'entrada. Les taules més comunes solen ser les de 2 a 4 variables d'entrada, però es poden utilitzar per a funcions de fins a 5 o 6 variables.


### Mapa de Karnaugh de 2 variables d'entrada

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


### Mapa de Karnaugh de 3 variables d'entrada

En aquest cas, les variables es poden agrupar de diferents maneres; $A\backslash BC$ (exemple anterior), $B\backslash AC$  o $C\backslash AB$ (aquest exemple). En qualsevol cas, el mapa de valors és el mateix.

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


### Mapa de Karnaugh de 4 variables d'entrada

El mapa de valors és invariable, l'agrupament de les variables $A$, $B$, $C$ i $D$ es pot fer com convingui en cada cas.

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

### Mapa de Karnaugh de 5 variables d'entrada

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
      <th style="border: 1px solid #ccc; padding: 5px 10px;">110</th>
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
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
    </tr>
  </tbody>
</table>


<!--
### Mapa de Karnaugh de 6 variables d'entrada
Mapa de valors per a 6 variables.
<table style="border-collapse: collapse; text-align: center;">
  <thead>
    <tr>
      <th style="border: 1px solid #ccc; position: relative; width: 60px; height: 60px;">
        <div style="position: absolute; top: 5px; right: 5px;">   ABC </div>
        <div style="position: absolute; bottom: 5px; left: 5px;"> DEF </div>
        <div style="position: absolute; bottom: 0; left: 0; width: 100%; height: 1px; background: #ccc; transform-origin: top right; transform: rotate(+45deg);"></div>
      </th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">000</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">001</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">011</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">010</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">110</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">111</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">101</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">100</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">000</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">001</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">011</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">010</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
    </tr>    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">110</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">111</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">101</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">100</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
    </tr>
  </tbody>
</table>
-->


## Regles de Mapa de Karnaugh

### **Codi Gray:**
Les files i columnes del mapa no s'ordenen de manera convencional (00, 01, 10, 11), sinó que segueixen el codi Gray (00, 01, 11, 10). 
És a dir, entre dues cel·les adjacents (verticalment o horitzontalment) només canvia el valor d'una única variable.

### **Omplir la taula:**
Cal omplir la taula amb els resultats de la variable de sortida corresponents a la combinació de valors d'entrada de cada cel.la.

### **Agrupar els '1' ajacents:**
L'objectiu és fer els grups tan extensos com sigui possible.
* S'agrupen els '1' adjacents en forma de fila, quadrat o rectangle.
* La mida dels grups ha de ser una potència de dos (1, 2, 4, 8, ...).
* S'han d'anar fent grups fins que tots els '1' de la taula formin part d'almenys un d'ells.
* Les vores del mapa es consideren adjacents amb la vora oposada, com si el mapa s'extengués repetint-se més enllà de les vores.

### **Obtenció de l'expressió lògica simplificada:**
Cada grup de '1's es tradueix en un terme de la funció booleana simplificada. Per fer-ho, s'observen quines variables no canvien de valor dins del grup, aquestes formaràn part del terme de l'expressió. Les variables que si canvien de valor dins del grup no apareixeran a l'expressió.

## Exemple
Busquem en el nostre exemple les agrupacions més extenses possibles de '1'. Hem de continuar amb el procés fins que tots els '1' hagin estat considerats.


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

En blau tenim quatre '1' adjacents en forma de fila. La variable en comú en tots ells és $A=1$, les variables $B$ i $C$ canvien de valor. Així doncs, el primer terme de l'expressió de $S$ serà $A$.

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
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px; background-color: yellow;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px; background-color: yellow;" >1</td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">A=1</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px; background-color: yellow;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px; background-color: yellow;">1</td>
    </tr>
  </tbody>
</table>


En groc tenim un grup de quatre '1' adjacents en forma de quadrat. La variable en comú és $B=1$. Per tant el segon terme de l'expressió de $S$ és $B$.

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

Encara ens queden '1's per agrupar, així que en vermell tenim un altre grup de quatre '1' adjacents en forma de quadrat. Aquest agrupament s'extén a través d'una vora de la taula. La variable que manté el seu valor és $C=0$, de manera que cal afegir el terme $C$ negat, $\bar{C}$

$S=A+B+\bar{C}$

Aquesta és doncs l'expressió booleana simplificada que engendra la taula de veritat exemple.
A partir d'aquesta es dedueix el circuit digital, tres entrades a una porta **OR**, una d'elles negada.

<img src='../logos/enconstrucció.png' alt="Agrupacions exemple" style="display:block; width:50px; margin:0 auto; border-radius: 8px;"/>
<center><i>Circuit resultat de l'exemple</i></center>


## Altres exemples
Els següents exemples ens ajudaràn a entendre totes les regles.

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



El grup vermell engendra el terme $\bar{A}\bar{C}$ perque les variables constants són $A=0$ i $C=0$. Tant $A$ com $C$ han d'aparèixer negades perque tenen el valor $0$. En el grup blau $A=1$ i $C=1$, per ant el seu terme a l'expressió booleana és $AC$.

L'expressió simplificada final és el següent.

$S=\bar{A}\bar{C} + AC$

El fet que no hi aparegui la variable $B$ significa que aquesta no té cap efecte en el resultat $S$.


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

Amb un sol grup en tenim prou en quest exemple. Les variables constants són $B=0$ i $C=0$. L'expressió simplificada final té un sol terme.

$S=\bar{B}\bar{C}$


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

En aquest exemple, el grup vermell agrupa $B=0$ i $D=0$, el grup blau agrupa $B=1$ i $D=1$.

$S=\bar{B}\bar{D}+BD$


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
      <td style="border: 1px solid #ccc; padding: 5px 10px;color: red; font-weight: bold;-webkit-text-stroke: 1px red;">1</td>
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

Aquest exemple es pot sol·lucionar amb tres grups. El vermell és $A$, el verd és $B\bar{C}$ i el blau $\bar{B}C$.

$S=A+B\bar{C}+\bar{B}C$


<!-- Aquesta imatge ha d'anar al final de cada lliçó, ja sigui amb aquesta línia o dins la signatura. Deixar comentat si ja està a la signatura-->
<br>
<br>
<img src='../logos/TotsLogosBlanc.png ' alt="Logos Càtedra Chip" width="100%" style="display:block; margin:0 auto; border-radius: 8px;"/>


<Autors autors="jpetit xcasas fmadrid jordic"/>
