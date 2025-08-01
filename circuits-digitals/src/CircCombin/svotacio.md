<!-- Posar aquesta imatge al començament de cada lliçó -->
<img src='../logos/illustracio1.png' alt="Circuits digitals" style=" float: left; border-radius: 8px; height: 120px; text-align: right;"/>
<img src='../logos/LogoCatedraCHIPBlanc.jpg' alt="Logo Càtedra Chip" style="float: right; border-radius: 8px; height: 120px; text-align: right;"/>
<div style="clear: both;"></div>
<br>

# Sistemes de votació
En el context dels circuits digitals, els sistemes de votació fan referència a implementacions electròniques o lògiques dissenyades per processar múltiples entrades (vots) i determinar un resultat, és a dir, una única sortida, basat en una regla de majoria o una lògica predefinida.


## EXEMPLE: Sistema de votació per a comitès
Imaginem que som els encarregats de dissenyar un sistema electrònic de votació per al Comitè Executiu d'un prestigiós equip de futbol. Aquest comitè té quatre membres: el President, el Secretari, el Tresorer i el Vocal. Cadascú pot votar "Sí" o "No".

L'aprovació de les propostes segueix aquestes **regles d'aprovació**:
1.  Una proposta s’aprova quan tres o més membres voten a favor.
1.  En cas d'empat (dos vots a favor i dos en contra), el vot qualificat del president decideix. Si el president vota “Sí” en un empat, la proposta s'aprova; si vota "No", es rebutja.

Dissenyarem un circuit lògic que rebi com a entrades els vots dels quatre membres i emeti un senyal de sortida que indiqui si la proposta ha estat aprovada.

Definim les nostres **variables d'entrada** (el valor $1$ significa "Si" i $0$ significa "No"):
* $P$ : vot del President
* $S$ : vot del Secretari
* $T$ : vot del Tresorer
* $V$ : vot del Vocal

La **variable de sortida** és $A$ (*Approved*). El valor $1$ significa aprovada, el valor $0$ indica que ha estat rebutjada.

A continuació analitzem en quins supòsits la proposta serà aprovada, els anomenarem condicions, que es deriven de les regles d'aprovació.

**Condició d'aprovació 1:** tres o més vots a favor.

Necessitem identificar totes les combinacions on la suma de P, S, T, V és 3 o 4.

* Aprovat per tres vots a favor
    * $P=0$, $S=1$, $T=1$ i $V=1$ --> ($\bar{P}STV$)
    * $P=1$, $S=1$, $T=1$ i $V=0$ --> ($PST\bar{V}$)
    * $P=1$, $S=1$, $T=0$ i $V=1$ --> ($PS\bar{T}V$)
    * $P=1$, $S=0$, $T=1$ i $V=1$ --> ($P\bar{S}TV$)
* Aprovat per quatre vots a favor
    * $P=1$, $S=1$, $T=1$ i $V=1$ --> ($PSTV$)

La proposta s'aprovarà si es compleix qualsevol d'aquests supòsits (operació OR o suma lògica). La condició 1 s'expressa de la següent manera en l'àlgebra de Boole:

$C1 = \bar{P}STV + PST\bar{V} + PS\bar{T}V + P\bar{S}TV + PSTV$

**Condició d'aprovació 2:** empat resolt favorablement pel president.

Ens cal identificar totes les combinacions de dos vots a favor i dos en contra, i d'aquestes, ens interessen on $P=1$.
* Aprovat
    * $P=1$, $S=1$, $T=0$ i $V=0$ --> ($PS\bar{T}\bar{V}$)
    * $P=1$, $S=0$, $T=1$ i $V=0$ --> ($P\bar{S}T\bar{V}$)
    * $P=1$, $S=0$, $T=0$ i $V=1$ --> ($P\bar{S}\bar{T}V$)
* No aprovat
    * $P=0$ , $S=1$, $T=1$ i $V=0$
    * $P=0$ , $T=0$, $S=1$ i $V=1$
    * $P=0$ , $S=0$, $T=1$ i $V=1$

La proposta s'aprovarà si es compleix algun d'aquests suposits. La condició 2 s'expressa com:

$C2 = PS\bar{T}\bar{V} + P\bar{S}T\bar{V} + P\bar{S}\bar{T}V$

La sortida $A$ serà $1$ si es compleix la condició C1 o bé la condició C2. La funció booleana és una suma lògica (OR) d'aquestes dues condicions:

$A=C1+C2$

I per tant l'expressió de $A$, en funció de $P$, $S$, $T$ i $V$ és:

$A= \bar{P}STV + PST\bar{V} + PS\bar{T}V + P\bar{S}TV + + PSTV + PS\bar{T}\bar{V} + P\bar{S}T\bar{V} + P\bar{S}\bar{T}V$

Muntem la taula de veritat amb tots els casos possibles:

<div style="display: flex; justify-content: center;">

| $P$ | $S$ | $T$ | $V$ | vots favorables | $C1$ | $C2$ | $A$ |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| 0 | 0 | 0 | 1 | 1 | 0 | 0 | 0 |
| 0 | 0 | 1 | 0 | 1 | 0 | 0 | 0 |
| 0 | 0 | 1 | 1 | 2 | 0 | 0 | 0 |
| 0 | 1 | 0 | 0 | 1 | 0 | 0 | 0 |
| 0 | 1 | 0 | 1 | 2 | 0 | 0 | 0 |
| 0 | 1 | 1 | 0 | 2 | 0 | 0 | 0 |
| 0 | 1 | 1 | 1 | 3 | 1 | 0 | 1 |
| 1 | 0 | 0 | 0 | 1 | 0 | 0 | 0 |
| 1 | 0 | 0 | 1 | 2 | 0 | 1 | 1 |
| 1 | 0 | 1 | 0 | 2 | 0 | 1 | 1 |
| 1 | 0 | 1 | 1 | 3 | 1 | 0 | 1 |
| 1 | 1 | 0 | 0 | 2 | 0 | 1 | 1 |
| 1 | 1 | 0 | 1 | 3 | 1 | 0 | 1 |
| 1 | 1 | 1 | 0 | 3 | 1 | 0 | 1 |
| 1 | 1 | 1 | 1 | 4 | 1 | 0 | 1 |
</div>

L'expressió per a $A$ en funció de $P$, $S$, $T$ i $V$ és molt llarga. Fer-ne una simplificació lògica mitjançant algebra booleana seria complex. Alternativament podem utilitzar un mapa de Karnaugh per a la funció de sortida A, amb les entrades P,S,T i V agrupades.

<!-- 
| PS\TV | 00 | 01 | 11 | 10 |
| --- | --- | --- | --- | --- | 
| 00 | 0 | 0 | 0 | 0 |  
| 01 | 0 | 0 | 1 | 0 | 
| 11 | 1 | 1 | 1 | 1 |
| 10 | 0 | 1 | 1 | 1 |
-->

<div style="display: flex; justify-content: center;">

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
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
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

</div>




<!--
A=PS+P
barSV+P
barST+
barPSTV
-->















<!-- ************* EN CONSTRUCCIÓ *****************-->
<img src='../logos/enconstrucció.png' alt="Logos Càtedra Chip" style="display:block; height:200px; margin:0 auto; border-radius: 8px;"/>


<Autors autors="jpetit xcasas fmadrid"/>

