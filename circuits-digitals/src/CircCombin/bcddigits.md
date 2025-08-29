<!-- Posar aquesta imatge al començament de cada lliçó -->
<img src='../logos/illustracio1.png' alt="Circuits digitals" style=" float: left; border-radius: 8px; height: 120px; text-align: right;"/>
<img src='../logos/LogoCatedraCHIPBlanc.jpg' alt="Logo Càtedra Chip" style="float: right; border-radius: 8px; height: 120px; text-align: right;"/>
<div style="clear: both;"></div>
<br>

# BCD digits

En circuits digitals, els dígits BCD (Binary Coded Decimal), o Decimal Codificat a Binari, són una forma de representar nombres decimals utilitzant un codi binari. La idea és codificar cada dígit decimal individualment amb un nombre binari, generalment de 4 bits.


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

<img src='./Seven_segment_01_Pengo.jpg' alt="Display de 7 segments" style="display:block; height:200px; margin:0 auto; border-radius: 8px;"/>
<center><i>Display de 7 segments</i></center>
<center>
<a href="https://creativecommons.org/licenses/by-sa/3.0" title="Creative Commons Attribution-Share Alike 3.0">CC BY-SA 3.0</a>, <a href="https://commons.wikimedia.org/w/index.php?curid=2550282">Link</a>
</center>

<!--
width:500px;
-->

La següent figura representa el layout estàndard dels 7 segments, que farem servir de referència per desenvolupar el nostre circuit

<img src='../logos/enconstrucció.png' alt="Layout dels 7 segments" style="display:block; height:200px; margin:0 auto; border-radius: 8px;"/>
<center><i>Layout dels 7 segments</i></center>

La següent taula de veritat determina quins deñs segments $a$, $b$, $c$, $d$, $e$, $f$ i $g$ han d'estar encesos ('1') i quins apagats ('0') per a cadascun dels valors d'entrada de $D[3:0]$.


| digit <br> decimal | BCD <br> $D_3 D_2 D_1 D_0$ | $a$ | $b$ | $c$ | $d$ | $e$ | $f$ | $g$
|:---:|:---:|---|---|---|---|---|---|---
| 0 | 0000 | 1| 1| 1| 1| 1| 1| 0
| 1 | 0001 | 0| 1| 1| 0| 0| 0| 0
| 2 | 0010 | 1| 1| 0| 1| 1| 0| 1
| 3 | 0011 | 1| 1| 1| 1| 0| 0| 1
| 4 | 0100 | 0| 1| 1| 0| 0| 1| 1
| 5 | 0101 | 1| 0| 1| 1| 0| 1| 1
| 6 | 0110 | 1| 0| 1| 1| 1| 1| 1
| 7 | 0111 | 1| 1| 1| 0| 0| 0| 0
| 8 | 1000 | 1| 1| 1| 1| 1| 1| 1
| 9 | 1001 | 1| 1| 1| 1| 0| 1| 1
<!--
|10-15 <br> casos impossibles| 1010-1111| x| x| x| x| x| x| x

## Taula de la Veritat

| Dígit | $D_3$ | $D_2$ | $D_1$ | $D_0$ | | $a$ | $b$ | $c$ | $d$ | $e$ | $f$ | $g$ |
| :--- | :---: | :---: | :---: | :---: |:--- | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
| $0$ | $0$ | $0$ | $0$ | $0$ | | $1$ | $1$ | $1$ | $1$ | $1$ | $1$ | $0$ |
| $1$ | $0$ | $0$ | $0$ | $1$ | | $0$ | $1$ | $1$ | $0$ | $0$ | $0$ | $0$ |
| $2$ | $0$ | $0$ | $1$ | $0$ | | $1$ | $1$ | $0$ | $1$ | $1$ | $0$ | $1$ |
| $3$ | $0$ | $0$ | $1$ | $1$ | | $1$ | $1$ | $1$ | $1$ | $0$ | $0$ | $1$ |
| $4$ | $0$ | $1$ | $0$ | $0$ | | $0$ | $1$ | $1$ | $0$ | $0$ | $1$ | $1$ |
| $5$ | $0$ | $1$ | $0$ | $1$ | | $1$ | $0$ | $1$ | $1$ | $0$ | $1$ | $1$ |
| $6$ | $0$ | $1$ | $1$ | $0$ | | $1$ | $0$ | $1$ | $1$ | $1$ | $1$ | $1$ |
| $7$ | $0$ | $1$ | $1$ | $1$ | | $1$ | $1$ | $1$ | $0$ | $0$ | $0$ | $0$ |
| $8$ | $1$ | $0$ | $0$ | $0$ | | $1$ | $1$ | $1$ | $1$ | $1$ | $1$ | $1$ |
| $9$ | $1$ | $0$ | $0$ | $1$ | | $1$ | $1$ | $1$ | $1$ | $0$ | $1$ | $1$ |


-->





Farem servir un mapa de Karnaugh per a cadascuna de les sortides del circuit per tal d'obtenir l'expressió booleana a partir del digit d'entrada $D[3:0]=[D_3 \; D_2 \; D_1 \; D_0]$

Les expressions resultants són les següents:

$segment \; a = D_3 + D_2 D_0 + D_1 \bar{D_0} + \bar{D_1} \bar{D_2}$

$segment \; b = \bar{D_1} + \bar{D_2} \bar{D_0} + D_2 D_0$

$segment \; c = D_2 + \bar{D_1} + D_0$

$segment \; d = D_3 + D_2 \bar{D_1} \bar{D_0} + \bar{D_2} D_1 \bar{D_0} + \bar{D_2} \bar{D_1} D_0 + D_2 D_1 D_0$

$segment \; e = \bar{D_1} \bar{D_0} + D_2 \bar{D_0}$

$segment \; f = D_3 + D_2 \bar{D_1} + D_2 \bar{D_0} + D_1 \bar{D_0}$

$segment \; g = D_3 + D_2 \bar{D_1} + \bar{D_2} D_1 + D_1 \bar{D_0}$














<!-- 

https://en.wikipedia.org/wiki/Seven-segment_display#/media/File:7-segment_bcfg.svg

-->

<!-- ************* EN CONSTRUCCIÓ *****************-->
<img src='../logos/enconstrucció.png' alt="Logos Càtedra Chip" style="display:block; height:200px; margin:0 auto; border-radius: 8px;"/>


<!-- Aquesta imatge ha d'anar al final de cada lliçó, ja sigui amb aquesta línia o dins la signatura. Deixar comentat si ja està a la signatura-->
<br>
<br>
<img src='../logos/TotsLogosBlanc.png ' alt="Logos Càtedra Chip" width="100%" style="display:block; margin:0 auto; border-radius: 8px;"/>


<Autors autors="jpetit xcasas fmadrid jordic"/>