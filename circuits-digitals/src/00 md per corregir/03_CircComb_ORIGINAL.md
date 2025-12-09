<!-- Posar aquesta imatge al començament de cada lliçó -->
<img src='../logos/illustracio1.png' alt="Circuits digitals" style=" float: left; border-radius:8px; height: 120px; text-align: right;"/>
<img src='../logos/LogoCatedraCHIPBlanc.jpg' alt="Logo Càtedra Chip" style="float: right; border-radius:8px; height: 120px; text-align: right;"/>
<div style="clear: both;"></div>
<br>

# Introducció als Circuits Combinacionals

En un circuit combinacional el valor de la seva sortida depèn únicament dels valors de les seves entrades en aquell moment. La sortida canvia de manera instantània en modificar-se les entrades.
Els circuits combinacionals es construeixen a partir de portes lògiques bàsiques. No tenen retroalimentació interna, la sortida no s’enllaça com a entrada. Tampoc tenen memòria, a diferència dels circuits seqüencials. El seu funcionament es pot descriure completament mitjançant l’àlgebra de Boole o amb taules de veritat.


<img src="../Intro/combinacional.png" alt="Circuit combinacional" style="display:block; width:500px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>


Els circuits combinacionals bàsics són:
Codificadors, Descodificadors, Multiplexors (MUX), Demultiplexors (DEMUX), Sumadors, Restadors i Comparadors.

En aquesta lliçó trobaràs els següents temes:
[Exercicis simples](./exsimples.md), [Multiplexors](./multiplexors.md), [Sistemes de votació](./svotacio.md), [Busos](./busos.md), [Nombres](./nombres.md) i [BCD digits](./bcddigits.md). Cada tema tracta un tipus de circuit diferent, hi trobaràs exemples i hauràs de resoldre una sèrie d’exercicis emprant portes lògiques bàsiques.


Els temes [Exercicis simples](./exsimples.md) i [Sistemes de votació](./svotacio.md) t’introduiran a l'ús de les taules de veritat i l’àlgebra de Boole amb exemples i exercicis de lògica bàsica. 

<img src='./exsimple.png' alt="Exercici simple" style="display:block; height:120px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<center><i>Circuit simple</i></center>


Al tema [Multiplexors](./multiplexors.md) aprendràs a crear dispositius MUX a partir de portes lògiques.

<img src='./multiplexor1.png' alt="Multiplexor"  style="display:block; height:120px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<br>
<img src='./multiplexor2.png' alt="Multiplexor"  style="display:block; height:150px; margin:0 auto;  border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<div style="clear: both;"></div>
<center><i>Multiplexor</i></center>


Al tema [Busos](./busos.md) faràs exercicis de corriment de bits (dreta i esquerra) i inversió de nombres binaris de N de bits.

<img src='./busos.png' alt="Busos" style="display:block; height:120px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<center><i>Exemple de desplaçamaent a l'esquerra (Left Shift)</i></center>

Els exercicis del tema [Nombres](./nombres.md) tracten sobre els circuits digitals encarregats de fer diferents operacions amb números.

Al tema [BCD](./bcddigits.md) (Binary Coded Decimal) faràs exercicis sobre els circuits encarregats codificar els dígits decimals en binari.

Finalment, al tema [Miscel·lània](./miscellania.md) faràs exercicis més avançats.


<!-- Aquesta imatge ha d'anar al final de cada lliçó, ja sigui amb aquesta línia o dins la signatura. Deixar comentat si ja està a la signatura-->
<br>
<br>
<img src='../logos/TotsLogosBlanc.png ' alt="Logos Càtedra Chip" width="100%" style="display:block; margin:0 auto; border-radius:8px;"/>

<Autors autors="xcasas fmadrid"/>
<!-- Posar aquesta imatge al començament de cada lliçó -->
<img src='../logos/illustracio1.png' alt="Circuits digitals" style=" float: left; border-radius:8px; height: 120px; text-align: right;"/>
<img src='../logos/LogoCatedraCHIPBlanc.jpg' alt="Logo Càtedra Chip" style="float: right; border-radius:8px; height: 120px; text-align: right;"/>
<div style="clear: both;"></div>
<br>

# Exercicis simples
En aquest tema veuràs com es relaciona l’àlgebra de Boole, les taules de veritat i les portes lògiques en una sèrie d'exercisi simples.

## Exemple: Sistema de control d'accés per a treballadors
En aquest exemple ens posem com a objectiu dissenyar un circuit lògic que determini si a un empleat se li permet l’accés a una zona restringida del centre de dades.

Hi ha tres factors clau que determinen la decisió:

* Targeta d'accés vàlida ($T$): L'empleat ha de passar la targeta pel lector i que aquesta sigui reconeguda com a vàlida.
* Empremta Dactilar Reconeguda ($H)$: L'empleat ha d'escanejar la seva empremta dactilar i que coincideixi amb la registrada.
* Autorització de Seguretat ($S$): L'empleat ha de tenir una autorització de seguretat activa per a aquesta zona.

Les regles per concedir l'accés són les següents:

* **$R_1$** - La targeta és vàlida i l'empremta dactilar és reconeguda. 

* **$R_2$** - O bé, l'autorització de seguretat està activa i l'empremta dactilar és reconeguda. 

* **$R_3$** - O bé, l'autorització de seguretat NO està activa i la targeta és vàlida.

Ens cal dissenyar un circuit amb tres entrades ($T$, $H$, $S$) i una sortida ($A$). La sortida $A$ determinarà si es concedeix l'accés, prenent el valor $1$ per a accés concedit i $0$ per a accés denegat.

En primer lloc muntem la taula de veritat d'aquesta aplicació:

|**$T$**|**$H$**|**$S$**|**$R_1$**|**$R_2$**|**$R_3$**|**$A$**
|------ |------ |------ |------ |------ |------ |------
|0|0|0|0|0|1|1
|0|0|1|0|0|0|0
|0|1|0|0|0|1|1
|0|1|1|0|1|0|1
|1|0|0|0|0|1|1
|1|0|1|0|0|1|1
|1|1|0|1|0|1|1
|1|1|1|1|1|1|1


Seguidament, expressem la funció booleana d’aquesta operació.

$
A=R_1+R_2+R_3=(TH)+(SH)+(\overline{S}+T)
$

Aleshores dibuixem el circuit digital.
<img src='./exsimplesexemple.png' alt="exemple" style="display:block; height:200px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<center><i>Circuit digital de control d'accés per a treballadors</i></center>

## Exercicis a Jutge.org: [Introduction to Digital Circuit Design](https://jutge.org/courses/JordiCortadella:IntroCircuits)

[The Embassy Ball](https://jutge.org/problems/X64345_en)

[Heating-cooling system](https://jutge.org/problems/X04334_en)

[Energy-efficient heating-cooling system](https://jutge.org/problems/X89493_en)

[Robot with light sensors](https://jutge.org/problems/X74930_en)

<small>*Recorda que per accedir als exercicis i que el **Jutge** valori les teves solucions has d'estar inscrit al [curs](https://jutge.org/courses/JordiCortadella:IntroCircuits)*. Troba totes les instruccions [aqui](../Inici/instruccions.md)</small>

<!-- Aquesta imatge ha d'anar al final de cada lliçó, ja sigui amb aquesta línia o dins la signatura. Deixar comentat si ja està a la signatura-->
<br>
<br>
<img src='../logos/TotsLogosBlanc.png ' alt="Logos Càtedra Chip" width="100%" style="display:block; margin:0 auto; border-radius:8px;"/>



<Autors autors="xcasas fmadrid"/><!-- Posar aquesta imatge al començament de cada lliçó -->
<img src='../logos/illustracio1.png' alt="Circuits digitals" style=" float: left; border-radius:8px; height: 120px; text-align: right;"/>
<img src='../logos/LogoCatedraCHIPBlanc.jpg' alt="Logo Càtedra Chip" style="float: right; border-radius:8px; height: 120px; text-align: right;"/>
<div style="clear: both;"></div>
<br>

# Multiplexors

En aquesta lliçó veuràs el funcionament dels multiplexors i com s’implementen amb portes lògiques.

En electrònica, un multiplexor (o MUX) és un dispositiu que selecciona un d’entre múltiples senyals d'entrada i el reenvia a una única línia de sortida. En el context dels circuits digitals, els senyals d'entrada són digitals (bits), tot i que també existeixen multiplexors per a senyals analògics.
Un multiplexor fa possible que diverses entrades comparteixin un dispositiu o recurs, en lloc de tenir-ne un per a cada senyal.
Per exemple, un convertidor analògic-digital o un mitjà de transmissió de comunicacions.

Els multiplexors també es poden utilitzar per implementar funcions booleanes de múltiples variables.


## EXEMPLE: multiplexor de 2 entrades
Imagina que tens dues fonts de dades diferents, dos sensors de temperatura, i necessites seleccionar quin s'enviarà a un processador. Emprarem un multiplexor.

Dissenyarem un multiplexor de 2 entrades ($in_1$, $in_2$) i 1 sortida ($out$). Una entrada especial serà el selector ($Sel$), encarregat de triar quina de les dues entrades s’enviarà a $out$. En aquest exemple volem que, al activar $Sel$ amb un $1$, la sortida $out$ sigui igual a $in_1$. Sempre que $Sel$ no estigui activada, és a dir, que sigui $0$, la sortida serà igual a $in_2$.

En primer lloc fem la taula de veritat amb tots els valors possibles de les entrades i el Selector:

<i>Taula de veritat</i>

|**$in_1$**|**$in_2$**|**$Sel$**|**$out$**
|------    |------    |------   |------
|0|0|0|0|
|0|1|0|0|
|1|0|0|1|
|1|1|0|1|
|0|0|1|0|
|0|1|1|1|
|1|0|1|0|
|1|1|1|1|

L'expressió de la funció booleana de la sortida és:

<!-- 
$
out = \overline{Sel} \, (in_2 \, \overline{in_1} + in_2 \, in_1) + Sel \, (\overline{in_2} \, in_1 + in_2 \, in_1)
$
$
= \overline{Sel} \, in_2(\overline{in_1}+in_1)+Sel \, in_1(\overline(in_2)+in_2)
$

Aplicant les següents propietats de l'àlgebra booleana:

$\overline{A}+A=1$  &emsp;&emsp;&emsp;&emsp;&emsp; i &emsp;&emsp;&emsp;&emsp;&emsp; $A·1=A$

Arribem a la conclusió que
-->

$out=\overline{Sel} \, in_2 + Sel \, in_1$

Finalment dibuixem el circuit lògic que ho implementa.

<img src='./multiplexor_exemple.png' alt="exemple circuit" style="display:block; height:150px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<center><i>Circuit Multiplexor</i></center>

## Exercicis a Jutge.org: [Introduction to Digital Circuit Design](https://jutge.org/courses/JordiCortadella:IntroCircuits)

[2-input multiplexer](https://jutge.org/problems/X12031_en) 

[Shuffle](https://jutge.org/problems/X07222_en)

[2-input multiplexer (4-bit wide)](https://jutge.org/problems/X82780_en)

[4-input multiplexer](https://jutge.org/problems/X45339_en)

<small>*Recorda que per accedir als exercicis i que el **Jutge** valori les teves solucions has d'estar inscrit al [curs](https://jutge.org/courses/JordiCortadella:IntroCircuits)*. Troba totes les instruccions [aqui](../Inici/instruccions.md)</small>

<!-- Aquesta imatge ha d'anar al final de cada lliçó, ja sigui amb aquesta línia o dins la signatura. Deixar comentat si ja està a la signatura-->
<br>
<br>
<img src='../logos/TotsLogosBlanc.png ' alt="Logos Càtedra Chip" width="100%" style="display:block; margin:0 auto; border-radius:8px;"/>



<Autors autors="xcasas fmadrid"/><!-- Posar aquesta imatge al començament de cada lliçó -->
<img src='../logos/illustracio1.png' alt="Circuits digitals" style=" float: left; border-radius:8px; height: 120px; text-align: right;"/>
<img src='../logos/LogoCatedraCHIPBlanc.jpg' alt="Logo Càtedra Chip" style="float: right; border-radius:8px; height: 120px; text-align: right;"/>
<div style="clear: both;"></div>
<br>

# Sistemes de votació
En el context dels circuits digitals, els sistemes de votació fan referència a implementacions electròniques o lògiques dissenyades per processar múltiples entrades i determinar un resultat. És a dir, generen una sortida, basada en una regla de majoria de vots o una lògica predefinida.


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

$C_1 = \bar{P}STV + PST\bar{V} + PS\bar{T}V + P\bar{S}TV + PSTV$

**Condició d'aprovació 2:** empat resolt favorablement pel president.

Ens cal identificar totes les combinacions de dos vots a favor i dos en contra. I d'aquestes, ens interessen on $P=1$.
* Aprovat
    * $P=1$, $S=1$, $T=0$ i $V=0$ --> ($PS\bar{T}\bar{V}$)
    * $P=1$, $S=0$, $T=1$ i $V=0$ --> ($P\bar{S}T\bar{V}$)
    * $P=1$, $S=0$, $T=0$ i $V=1$ --> ($P\bar{S}\bar{T}V$)
* No aprovat
    * $P=0$ , $S=1$, $T=1$ i $V=0$
    * $P=0$ , $T=0$, $S=1$ i $V=1$
    * $P=0$ , $S=0$, $T=1$ i $V=1$

La proposta s'aprovarà si es compleix algun d'aquests suposits. La condició 2 s'expressa com:

$C_2 = PS\bar{T}\bar{V} + P\bar{S}T\bar{V} + P\bar{S}\bar{T}V$

La sortida $A$ serà $1$ si es compleix la condició $C_1$ o bé la condició $C_2$. La funció booleana és una suma lògica (OR) d'aquestes dues condicions:

$A=C_1+C_2$

I per tant l'expressió de $A$, en funció de $P$, $S$, $T$ i $V$ és:

$A= \bar{P}STV + PST\bar{V} + PS\bar{T}V + P\bar{S}TV + + PSTV + PS\bar{T}\bar{V} + P\bar{S}T\bar{V} + P\bar{S}\bar{T}V$

Muntem la taula de veritat amb tots els casos possibles:

| $P$ | $S$ | $T$ | $V$ | vots favorables | $C_1$ | $C_2$ | $A$ |
| --- | --- | --- | --- | :---: | --- | --- | --- |
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

L'expressió per a $A$ en funció de $P$, $S$, $T$ i $V$ és molt llarga. Fer-ne una simplificació lògica mitjançant algebra booleana seria complex. Alternativament podem utilitzar un [mapa de Karnaugh](../Intro/karnaugh.md) per a la funció de sortida $A$, amb les entrades $P$,$S$,$T$ i $V$ agrupades.

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

El següent pas és agrupar els ‘1’ en 4 grups, que marcarem amb diferents colors. 

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
      <td style="border: 1px solid #ccc; padding: 5px 10px;border: 1px solid #ccc; padding: 5px 10px;background-color: lightblue;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;border: 1px solid #ccc; padding: 5px 10px;background-color: lightblue;">1</td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">10</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;border: 1px solid #ccc; padding: 5px 10px;background-color: lightblue;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;border: 1px solid #ccc; padding: 5px 10px;background-color: lightblue;">1</td>
    </tr>
  </tbody>
</table>

Les variables constants dins del grup blau són $P=1$ i $T=1$, això es tradueix en el terme $PT$ a la solució.

$A=PT+···$

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
      <td style="border: 1px solid #ccc; padding: 5px 10px;border: 1px solid #ccc; padding: 5px 10px;background-color: yellow;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;border: 1px solid #ccc; padding: 5px 10px;background-color: yellow;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">10</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;border: 1px solid #ccc; padding: 5px 10px;background-color: yellow;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;border: 1px solid #ccc; padding: 5px 10px;background-color: yellow;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
    </tr>
  </tbody>
</table>

Les variables constants en el grup groc són $P=1$ i $V=1$, afegim el terme $PV$ a la solució.

$A=PT + PV + ···$


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

L’agrupació de color verd té en comú $P=1$ i $S=1$, afegim el terme $PS$ a la solució

$A=PT + PV + PS + ···$


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

Finalment, en el grup vermell les variables constants són $S=1$, $T=1$ i $V=1$, afegim el terme $STV$ a la solució.

$A=PT + PV + PS + STV$

Aquesta és l’expressió booleana simplificada final perque tots els ‘1’ ja han estat considerats en algun grup.

El circuit digital derivat d’aquesta expressió és el següent:


<img src='./svotacio_exemple.png' alt="Circuit digital" style="display:block; height:280px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<center><i>Circuit digital que implementa el sistema de votació per a comitès
</i></center>


## Exercicis a Jutge.org: [Introduction to Digital Circuit Design](https://jutge.org/courses/JordiCortadella:IntroCircuits)

[Executive Committee](https://jutge.org/problems/X16063_en)

[Two or more ones](https://jutge.org/problems/X67345_en)

[4-input majority voter](https://jutge.org/problems/X42168_en)

[Majority of 5 inputs](https://jutge.org/problems/X72286_en)

<small>*Recorda que per accedir als exercicis i que el **Jutge** valori les teves solucions has d'estar inscrit al [curs](https://jutge.org/courses/JordiCortadella:IntroCircuits)*. Troba totes les instruccions [aqui](../Inici/instruccions.md)</small>

<!-- Aquesta imatge ha d'anar al final de cada lliçó, ja sigui amb aquesta línia o dins la signatura. Deixar comentat si ja està a la signatura-->
<br>
<br>
<img src='../logos/TotsLogosBlanc.png ' alt="Logos Càtedra Chip" width="100%" style="display:block; margin:0 auto; border-radius:8px;"/>

<Autors autors="xcasas fmadrid"/>
<!-- Posar aquesta imatge al començament de cada lliçó -->
<img src='../logos/illustracio1.png' alt="Circuits digitals" style=" float: left; border-radius:8px; height: 120px; text-align: right;"/>
<img src='../logos/LogoCatedraCHIPBlanc.jpg' alt="Logo Càtedra Chip" style="float: right; border-radius:8px; height: 120px; text-align: right;"/>
<div style="clear: both;"></div>
<br>

# Busos

En circuits digitals, un **bus de bits** (o simplement bus) és un conjunt de línies de comunicació o pistes que transporten bits de dades de manera paral·lela. Serveixen per interconnectar diferents components d’un sistema transferint senyals digitals.

El **desplaçament de bits** és una operació que mou tots els bits d’un registre (o paraula binària) cap a l’esquerra o cap a la dreta. Aquesta és una operació molt important a l’hora de processar les dades transmeses per un bus.

## Notació

En aquest apartat treballarem amb variables que representen nombres binaris de N bits. Per referir-nos a una variable, farem servir una notació com $A[3:0]$, que descriu un conjunt de 4 bits anomenat $A$.

El rang $[3:0]$ especifica que els bits estan indexats des del 3 fins al 0. Aquesta variable es pot descompondre en els seus bits individuals com:

$A=A[3:0]=[A_3​ A_2​ A_1​ A_0​]$
 
On $A_3$ és el bit de més pes (*Most Significant Bit o **MSB***) i $A_0$ és el bit de menys pes (*Less Significant Bit o **LSB***). Aquesta notació ens permet referir-nos tant al conjunt complet de bits ($A$) com a cadascun dels seus bits individuals ($A_i$).

## EXEMPLE: Disseny d'un circuit desplaçador de bus a l'esquerra (N-bits)

Imagina que treballes amb dades binàries i necessites moure tots els bits d'una seqüència una posició cap a l'esquerra. Això equival a multiplicar el seu valor numèric per dos. Per exemple, 1010 binari és 10 en decimal; si el desplacem una posició cap a l'esquerra n'obtenim 10100, que és 20 en decimal.


Una taula de veritat completa per a un nombre de bits N molt elevat pot ser inviable, aquesta ha de tenir $N^2$ files. Ens centrarem en la descripció i implementació d’un circuit desplaçador de N=4 bits, on la taula de veritat encara té només 16 files.



A continuació es mostra la taula de veritat d'un circuit desplaçador, que desplaça l'entrada $A[3:0]=[A_3​ A_2​ A_1​ A_0​]$ un bit cap a l'esquerra i en treu una sortida $B[3:0]=[B_3​ B_2 ​B_1 ​B_0​]$.

|**Entrada $A$** |**Sortida $B$**|
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

El nostre objectiu és dissenyar un circuit desplaçador de 4 bits. Tenim dues opcions:

* Emprar [multiplexors](./multiplexors.md), que són [circuits combinacionals](../CircCombin/intro.md): Aquesta és la forma més habitual i flexible per a desplaçaments fixos o controlats.

* Usant registres de desplaçament, que són [circuits seqüencials](../CircSeq/intro.md): Aquesta implementació és per a operacions de desplaçament que ocorren en el temps, generalment sincronitzades amb un rellotge.

En aquesta secció emprarem multiplexors i el circuit serà el següent:

<img src='./bus_exemple.png' alt="Circuit desplaçador" style="display:block; height:400px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<center><i>Circuit digital que desplaça una posició cap a l'esquerra</i></center>

El senyal de control $Sel$ serveix per determinar si el circuit efectua el desplaçament o no.

* Si $Sel=0$, la sortida és igual a l'entrada i no hi ha desplaçament.
* Si $Sel=1$, els multiplexors d'activen realitzant un desplaçament a l'esquerra d'una posició.

Per a cada bit de sortida de $B$, farem servir un multiplexor 2-a-1.
* MUX per $B_3$
    * Entrada 0: $A_3$
    * Entrada 1: $A_2$
    * Sortida: $B_3$
* MUX per $B_2$
    * Entrada 0: $A_2$
    * Entrada 1: $A_1$
    * Sortida: $B_2$
* MUX per $B_1$
    * Entrada 0: $A_1$
    * Entrada 1: $A_0$
    * Sortida: $B_1$
* MUX per $B_0$
    * Entrada 0: $A_0$
    * Entrada 1: $0$ (bit que entra)
    * Sortida: $B_0$



## Exercicis a Jutge.org: [Introduction to Digital Circuit Design](https://jutge.org/courses/JordiCortadella:IntroCircuits)


[Bus invert](https://jutge.org/problems/X29475_en)

[Bus transfer or invert](https://jutge.org/problems/X00341_en)

[Shift left](https://jutge.org/problems/X26035_en)

[Shift left or right](https://jutge.org/problems/X25794_en)

<small>*Recorda que per accedir als exercicis i que el **Jutge** valori les teves solucions has d'estar inscrit al [curs](https://jutge.org/courses/JordiCortadella:IntroCircuits)*. Troba totes les instruccions [aqui](../Inici/instruccions.md)</small>

<!-- Aquesta imatge ha d'anar al final de cada lliçó, ja sigui amb aquesta línia o dins la signatura. Deixar comentat si ja està a la signatura-->
<br>
<br>
<img src='../logos/TotsLogosBlanc.png ' alt="Logos Càtedra Chip" width="100%" style="display:block; margin:0 auto; border-radius:8px;"/>



<Autors autors="xcasas fmadrid"/><!-- Posar aquesta imatge al començament de cada lliçó -->
<img src='../logos/illustracio1.png' alt="Circuits digitals" style=" float: left; border-radius:8px; height: 120px; text-align: right;"/>
<img src='../logos/LogoCatedraCHIPBlanc.jpg' alt="Logo Càtedra Chip" style="float: right; border-radius:8px; height: 120px; text-align: right;"/>
<div style="clear: both;"></div>
<br>

# Nombres
En els circuits digitals i la lògica digital els nombres s’implementen en binari. Les operacions matemàtiques es realitzen amb bits, des de les més bàsiques a les més complexes. Aquestes inclouen sumes, restes, comparacions, multiplicacions, divisions o calcular el mòdul.


## EXEMPLE: Nombre parell o imparell.

L'objectiu és dissenyar un circuit que rebi a l'entrada un número de 4 bits i produeixi una sortida que s'activi amb un $1$ quan el número d'entrada sigui parell.

Un nombre parell és divisible per 2, i en notació binària es reconeix fàcilment perquè el seu bit menys significatiu (LSB) és 0.

La **variable d'entrada** al circuit és:

$nombre[3:0]= [nombre_3 \; nombre_2 \; nombre_1 \; nombre_0]$

El bit menys significatiu (**LSB**) és $nombre_0$.

La **variable de sortida** del circuit la és un sol bit que anomenarem $Parell$.

La taula següent recull uns quants exemples d'entrades i sortides que il·lustren el comportament desitjat del circuit. La taula de veritat completa tindria 16 files.

|**$nombre$**|**Nombre en decimal**|$nombre_0$ (LSB)|Paritat| $Parell$|
|:---:|:---:|:---:|---|:---:|
|0000 | 0  | 0 | és Parell| 1 
|0001 | 1  | 1 | és Senar | 0
|0010 | 2  | 0 | és Parell| 1 
|0011 | 3  | 1 | és Senar | 0
|1110 | 14 | 0 | és Parell| 1 
|1111 | 15 | 1 | és Senar | 0

Construir el circuit és força directe, la sortida $Parell$ s'ha d'activar (valor $1$) si i només si $nombre[0]$ té el valor $0$, independentment del valor de la resta de bits de $nombre$.

La sortida és doncs la negació de $nombre_0$.

$Parell=\overline{nombre_0}$

El circuit s'implementa amb una sola porta lògica NOT al bit $nombre_0$.



<img src='./nombres_exemple1.png' alt="Circuit desplaçador"  style="display:block; height:130px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<br>
<center><i>Circuit digital que determina la paritat d'un nombre</i></center>


## EXEMPLE: Mòdul 7 d’un número binari de 4 bits

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

<img src='./nombres_exemple2.png' alt="Circuit digital" style="display:block; height:500px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>

<center><i>Circuit digital que implementa la funció n mod 7</i></center>

## Exercicis a Jutge.org: [Introduction to Digital Circuit Design](https://jutge.org/courses/JordiCortadella:IntroCircuits)

[Even number](https://jutge.org/problems/X36253_en)

[Prime number](https://jutge.org/problems/X07160_en)

[Max of two numbers](https://jutge.org/problems/X37473_en)

[Residue mod 7](https://jutge.org/problems/X91814_en)

<small>*Recorda que per accedir als exercicis i que el **Jutge** valori les teves solucions has d'estar inscrit al [curs](https://jutge.org/courses/JordiCortadella:IntroCircuits)*. Troba totes les instruccions [aqui](../Inici/instruccions.md)</small>

<!-- Aquesta imatge ha d'anar al final de cada lliçó, ja sigui amb aquesta línia o dins la signatura. Deixar comentat si ja està a la signatura-->
<br>
<br>
<img src='../logos/TotsLogosBlanc.png ' alt="Logos Càtedra Chip" width="100%" style="display:block; margin:0 auto; border-radius:8px;"/>



<Autors autors="xcasas fmadrid"/><!-- Posar aquesta imatge al començament de cada lliçó -->
<img src='../logos/illustracio1.png' alt="Circuits digitals" style=" float: left; border-radius:8px; height: 120px; text-align: right;"/>
<img src='../logos/LogoCatedraCHIPBlanc.jpg' alt="Logo Càtedra Chip" style="float: right; border-radius:8px; height: 120px; text-align: right;"/>
<div style="clear: both;"></div>
<br>

# BCD digits

En circuits digitals un nombre Decimal Codificat a Binari (en anglès *Binary Coded Decimal* o *BCD*) és una forma de representar nombres decimals utilitzant un codi binari. La idea és codificar cada dígit decimal individualment amb un nombre binari, generalment de 4 bits.


|**Dígit decimal**|**BCD**
|------ |------
|0 | 0000
|1 | 0001
|2 | 0010
|3 | 0011
|4 | 0100
|5 | 0101
|6 | 0110
|7 | 0111
|8 | 1000
|9 | 1001

## EXEMPLE: Disseny d'un Circuit Controlador de Display de 7 Segments

Aquest circuit rebrà un dígit BCD de 4 bits que representa un dígit del 0 al 9.

$D[3:0]=[D_3 \; D_2 \; D_1 \; D_0]$

Produirà 7 senyals de sortida que controlaran els segments d'un display de 7 segments. Cadascun dels 7 senyals de sortida s'ha d'activar quan el segment corresponent hagi d'estar il·luminat. Estem utilitzant doncs un display de 7 segments de càtode comú.

<img src='./Seven_segment_01_Pengo.jpg' alt="Display de 7 segments" style="display:block; height:200px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<center><i>Display de 7 segments</i></center>
<center>
<a href="https://creativecommons.org/licenses/by-sa/3.0" title="Creative Commons Attribution-Share Alike 3.0">CC BY-SA 3.0</a>, <a href="https://commons.wikimedia.org/w/index.php?curid=2550282">Link</a>
</center>

<!--
width:500px;
-->

La figura següent representa la disposició estàndard dels 7 segments, que farem servir de referència per dissenyar el nostre circuit.

<img src='./segments.png' alt="Disposició dels 7 segments" style="display:block; height:350px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<center><i>Disposició dels 7 segments</i></center>

La taula de veritat següent determina quins dels segments $a$, $b$, $c$, $d$, $e$, $f$ i $g$ han d'estar encesos ($1$)' i quins apagats ($0$) per a cadascun dels valors d'entrada de $D[3:0]$.


| digit <br> decimal | BCD <br> $D_3 D_2 D_1 D_0$ | $a$ | $b$ | $c$ | $d$ | $e$ | $f$ | $g$ | display
|:---:|:---:|---|---|---|---|---|---|---|---
| 0 | 0000 | 1| 1| 1| 1| 1| 1| 0|<img src='./7-segment_abcdef.svg'  style="display:block; height:50px; margin:0 auto;"/>
| 1 | 0001 | 0| 1| 1| 0| 0| 0| 0|<img src='./7-segment_bc.svg'      style="display:block; height:50px; margin:0 auto;"/>
| 2 | 0010 | 1| 1| 0| 1| 1| 0| 1|<img src='./7-segment_abdeg.svg'   style="display:block; height:50px; margin:0 auto;"/>
| 3 | 0011 | 1| 1| 1| 1| 0| 0| 1|<img src='./7-segment_abcdg.svg'   style="display:block; height:50px; margin:0 auto;"/>
| 4 | 0100 | 0| 1| 1| 0| 0| 1| 1|<img src='./7-segment_bcfg.svg'    style="display:block; height:50px; margin:0 auto;"/>
| 5 | 0101 | 1| 0| 1| 1| 0| 1| 1|<img src='./7-segment_acdfg.svg'   style="display:block; height:50px; margin:0 auto;"/>
| 6 | 0110 | 1| 0| 1| 1| 1| 1| 1|<img src='./7-segment_acdefg.svg'  style="display:block; height:50px; margin:0 auto;"/>
| 7 | 0111 | 1| 1| 1| 0| 0| 0| 0|<img src='./7-segment_abc.svg'     style="display:block; height:50px; margin:0 auto;"/>
| 8 | 1000 | 1| 1| 1| 1| 1| 1| 1|<img src='./7-segment_abcdefg.svg' style="display:block; height:50px; margin:0 auto;"/>
| 9 | 1001 | 1| 1| 1| 1| 0| 1| 1|<img src='./7-segment_abcdfg.svg'  style="display:block; height:50px; margin:0 auto;"/>
|10 <br> don't care| 1010| x| x| x| x| x| x| x
|11 <br> don't care| 1011| x| x| x| x| x| x| x
|12 <br> don't care| 1100| x| x| x| x| x| x| x
|13 <br> don't care| 1101| x| x| x| x| x| x| x
|14 <br> don't care| 1110| x| x| x| x| x| x| x
|15 <br> don't care| 1111| x| x| x| x| x| x| x


Els 4 bits d’entrada permeten codificar fins al nombre 15. Els valors del 10 al 15 també apareixen a la taula de veritat, però no ens importa quina sortida generin, ja que no els farem servir. Aquests casos s’anomenen típicament **condicions indiferents** (*don’t care cases*) i es representen amb una 'x'.
A l’hora de buscar agrupacions al mapa de Karnaugh, els podem assignar els valors que més ens convinguin per tal obtenir expressions més simples.

Cal fer un mapa de Karnaugh per a cadascuna de les sortides del circuit per tal d'obtenir l'expressió booleana a partir del digit d'entrada $D[3:0]=[D_3 \; D_2 \; D_1 \; D_0]$.
Pel que fa a les condicions indiferents, el valor de $x=1$ dona com a resultat equacions més simples.

El procés complet i detallat es pot trobar a diverses fonts:
[enllaç 1](https://informatika.stei.itb.ac.id/~rinaldi.munir/Matdis/2019-2020/Makalah2019/13518127.pdf), 
[enllaç 2](https://www.electricaltechnology.org/2018/05/bcd-to-7-segment-display-decoder.html), 
[enllaç 3](https://steamcommunity.com/sharedfiles/filedetails/?id=2900823549)


Les expressions resultants són les següents:

* $segment \; a = D_3 + D_1 + D_2 \bar{D_0} + \bar{D_2} D_0$

* $segment \; b = \bar{D_2} + \bar{D_1} \bar{D_0} + D_1 D_0$

* $segment \; c = D_2 + \bar{D_1} + D_0$

* $segment \; d = D_3 + \bar{D_2} \bar{D_0} + D_1 \bar{D_0} + \bar{D_2} \bar{D_1} + D_2 \bar{D_1} D_0$

* $segment \; e = \bar{D_2} \bar{D_0} + D_1 \bar{D_0}$

* $segment \; f = D_3 + D_2 \bar{D_1} + \bar{D_1} \bar{D_0} + D_2 \bar{D_0}$

* $segment \; g = D_3 + \bar{D_2} D_1 + D_2 \bar{D_1} + D_1 \bar{D_0}$



Amb aquestes funcions booleanes ja simplificades podem implementar el circuit utilitzant portes lògiques (AND, OR, NOT). Les entrades seran els 4 bits corresponents als dígits $D_3$ $D_2$ $D_1$ $D_0$ i les 7 sortides corresponents als segments $a$, $b$, $c$, $d$, $e$, $f$ o $g$.

Vejem alguns exemples per comprovar que les equacions donen els resultats que ens esperem.

### Digit 2, D=[0010]

* $segment \; a = 0 + 1 + 0 · \bar{0} + \bar{0}  · 0  = 1$

* $segment \; b = \bar{0} + \bar{1} · \bar{0} + 1·0 = 1$

* $segment \; c = 0 + \bar{1} + 0 = 0$

* $segment \; d = 0 + \bar{0} · \bar{0} + 1 · \bar{0} + \bar{0} · \bar{1} + 0 · \bar{1} + 0 = 1$

* $segment \; e = \bar{0} · \bar{0} + 1 · \bar{0} = 1$

* $segment \; f = 0 + 0 · \bar{1} + \bar{1} · \bar{0} + 0 · \bar{0} = 0$

* $segment \; g = 0 + \bar{0} · 1 + 0 · \bar{1} + 1 · \bar{0} = 1$


### Digit 4, D=[0100]
* $segment \; a = 0 + 0 + 1 · \bar{0} + \bar{1} · 0=1$

* $segment \; b = \bar{1} + \bar{0} · \bar{0} + 0 · 0=1$

* $segment \; c = 1 + \bar{0} + 0=1$

* $segment \; d = 0 + \bar{1} · \bar{0} + 0 · \bar{0} + \bar{1} · \bar{0} + 1 · \bar{0} · 0=0$

* $segment \; e = \bar{1} · \bar{0} + 0 · \bar{0}=0$

* $segment \; f = 0 + 1 · \bar{0} + \bar{0} · \bar{0} + 1 · \bar{0}=1$

* $segment \; g = 0 + \bar{1} · 0 + 1 · \bar{0} + 0 · \bar{0}=1$


### Digit 9, D=[1001]
* $segment \; a = 1 + 0 + 0 · \bar{1} + \bar{0} · 1=1$

* $segment \; b = \bar{0} + \bar{0} · \bar{1} + 0 · 1=1$

* $segment \; c = 0 + \bar{0} + 1=1$

* $segment \; d = 1 + \bar{0} · \bar{1} + 0 · \bar{1} + \bar{0} · \bar{0} + 0 · \bar{0} · 1=1$

* $segment \; e = \bar{0} · \bar{1} + 0 · \bar{1}=0$

* $segment \; f = 1 + 0 · \bar{0} + \bar{0} · \bar{1} + 0 · \bar{1}=1$

* $segment \; g = 1 + \bar{0} · 0 + 0 · \bar{0} + 0 · \bar{1}=1$




## Exercicis a Jutge.org: [Introduction to Digital Circuit Design](https://jutge.org/courses/JordiCortadella:IntroCircuits)


[7-segment digit](https://jutge.org/problems/X37276_en)

[Is it a BCD digit ?](https://jutge.org/problems/X31983_en)

[Square of a BCD digit](https://jutge.org/problems/X77297_en)

<small>*Recorda que per accedir als exercicis i que el **Jutge** valori les teves solucions has d'estar inscrit al [curs](https://jutge.org/courses/JordiCortadella:IntroCircuits)*. Troba totes les instruccions [aqui](../Inici/instruccions.md)</small>

<!-- Aquesta imatge ha d'anar al final de cada lliçó, ja sigui amb aquesta línia o dins la signatura. Deixar comentat si ja està a la signatura-->
<br>
<br>
<img src='../logos/TotsLogosBlanc.png ' alt="Logos Càtedra Chip" width="100%" style="display:block; margin:0 auto; border-radius:8px;"/>

<Autors autors="xcasas fmadrid"/><!-- Posar aquesta imatge al començament de cada lliçó -->
<img src='../logos/illustracio1.png' alt="Circuits digitals" style=" float: left; border-radius:8px; height: 120px; text-align: right;"/>
<img src='../logos/LogoCatedraCHIPBlanc.jpg' alt="Logo Càtedra Chip" style="float: right; border-radius:8px; height: 120px; text-align: right;"/>
<div style="clear: both;"></div>
<br>

# Miscel·lània

La secció [Miscellaneous](https://jutge.org/courses/JordiCortadella:IntroCircuits/lists/JordiCortadella:Combinational) del curs [Introduction to Digital Circuit Design](https://jutge.org/courses/JordiCortadella:IntroCircuits/lists/JordiCortadella:Combinational) inclou diferents exercicis relacionats amb els temes tractats fins ara. Poden ser més complicats que els que hem vist fins ara. T'hi animes?. 


## Exercicis a Jutge.org: [Introduction to Digital Circuit Design](https://jutge.org/courses/JordiCortadella:IntroCircuits)

[Parity](https://jutge.org/problems/X16400_en)

[Stairwell](https://jutge.org/problems/X89209_en)

[Tic-tac-toe](https://jutge.org/problems/X39419_en)

[Priority encoder](https://jutge.org/problems/X55915_en)

<small>*Recorda que per accedir als exercicis i que el **Jutge** valori les teves solucions has d'estar inscrit al [curs](https://jutge.org/courses/JordiCortadella:IntroCircuits)*. Troba totes les instruccions [aqui](../Inici/instruccions.md)</small>

<!-- Aquesta imatge ha d'anar al final de cada lliçó, ja sigui amb aquesta línia o dins la signatura. Deixar comentat si ja està a la signatura-->
<br>
<br>
<img src='../logos/TotsLogosBlanc.png ' alt="Logos Càtedra Chip" width="100%" style="display:block; margin:0 auto; border-radius:8px;"/>



<Autors autors="xcasas fmadrid"/>