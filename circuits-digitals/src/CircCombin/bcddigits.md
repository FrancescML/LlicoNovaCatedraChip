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

La següent figura representa el layout estàndard dels 7 segments, que farem servir de referència per desenvolupar el nostre circuit.

<img src='../logos/enconstrucció.png' alt="Layout dels 7 segments" style="display:block; height:200px; margin:0 auto; border-radius: 8px;"/>
<center><i>Layout dels 7 segments</i></center>

La següent taula de veritat determina quins deñs segments $a$, $b$, $c$, $d$, $e$, $f$ i $g$ han d'estar encesos ('1') i quins apagats ('0') per a cadascun dels valors d'entrada de $D[3:0]$.


| digit <br> decimal | BCD <br> $D_3 D_2 D_1 D_0$ | $a$ | $b$ | $c$ | $d$ | $e$ | $f$ | $g$ | aspecte
|:---:|:---:|---|---|---|---|---|---|---|---
| 0 | 0000 | 1| 1| 1| 1| 1| 1| 0|<img src='./7-segment_abcdef.svg' style="display:block; height:50px; margin:0 auto;"/>
| 1 | 0001 | 0| 1| 1| 0| 0| 0| 0|<img src='./7-segment_bc.svg'     style="display:block; height:50px; margin:0 auto;"/>
| 2 | 0010 | 1| 1| 0| 1| 1| 0| 1|<img src='./7-segment_abdeg.svg'  style="display:block; height:50px; margin:0 auto;"/>
| 3 | 0011 | 1| 1| 1| 1| 0| 0| 1|<img src='./7-segment_abcdg.svg' style="display:block; height:50px; margin:0 auto;"/>
| 4 | 0100 | 0| 1| 1| 0| 0| 1| 1|<img src='./7-segment_bcfg.svg' style="display:block; height:50px; margin:0 auto;"/>
| 5 | 0101 | 1| 0| 1| 1| 0| 1| 1|<img src='./7-segment_acdfg.svg' style="display:block; height:50px; margin:0 auto;"/>
| 6 | 0110 | 1| 0| 1| 1| 1| 1| 1|<img src='./7-segment_acdefg.svg' style="display:block; height:50px; margin:0 auto;"/>
| 7 | 0111 | 1| 1| 1| 0| 0| 0| 0|<img src='./7-segment_abc.svg' style="display:block; height:50px; margin:0 auto;"/>
| 8 | 1000 | 1| 1| 1| 1| 1| 1| 1|<img src='./7-segment_abcdefg.svg' style="display:block; height:50px; margin:0 auto;"/>
| 9 | 1001 | 1| 1| 1| 1| 0| 1| 1|<img src='./7-segment_abcdfg.svg' style="display:block; height:50px; margin:0 auto;"/>
|10-15 <br> casos impossibles| 1010-1111| x| x| x| x| x| x| x

Els 4 bits permeten codificar fins al número 15. Els valors del 10 al 15 són casos impossibles, que no corresponen a un dígit. Els valors dels segments es reperesenten com a x.

Cal fer un mapa de karnaugh per a cadascuna de les sortides del circuit per tal d'obtenir l'expressió booleana a partir del digit d'entrada $D[3:0]=[D_3 \; D_2 \; D_1 \; D_0]$. El valor de $x=1$ dona com a resultat equacions més simples.

El procés complet i detallat es pot trobar a diverses fonts:
[enllaç 1](https://informatika.stei.itb.ac.id/~rinaldi.munir/Matdis/2019-2020/Makalah2019/13518127.pdf), 
[enllaç 2](https://www.electricaltechnology.org/2018/05/bcd-to-7-segment-display-decoder.html), 
[enllaç 3](https://steamcommunity.com/sharedfiles/filedetails/?id=2900823549)


Les expressions resultants són les següents:

$segment \; a = D_3 + D_1 + D_2 \bar{D_0} + \bar{D_2} D_0$

$segment \; b = \bar{D_2} + \bar{D_1} \bar{D_0} + D_1 D_0$

$segment \; c = D_2 + \bar{D_1} + D_0$

$segment \; d = D_3 + \bar{D_2} \bar{D_0} + D_1 \bar{D_0} + \bar{D_2} \bar{D_1} + D_2 \bar{D_1} D_0$

$segment \; e = \bar{D_2} \bar{D_0} + D_1 \bar{D_0}$

$segment \; f = D_3 + D_2 \bar{D_1} + \bar{D_1} \bar{D_0} + D_2 \bar{D_0}$

$segment \; g = D_3 + \bar{D_2} D_1 + D_2 \bar{D_1} + D_1 \bar{D_0}$



Amb aquestes funcions booleanes ja simplificades podem implementar el circuit utilitzant portes lògiques (AND, OR, NOT). Les entrades seran els 4 bits corresponents als dígits $D_3$ $D_2$ $D_1$ $D_0$ i les 7 sortides $a$, $b$, $c$, $d$, $e$, $f$, $g$ dels segments.

**Vejem alguns exemples per comprovar que les equacions donen els resultats que ens esperem.**

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




## Exercicis de [Introduction to Digital Circuit Design](https://jutge.org/courses/JordiCortadella:IntroCircuits)

[7-segment digit](https://jutge.org/problems/X37276_en)

[Is it a BCD digit ?](https://jutge.org/problems/X31983_en)

[Square of a BCD digit](https://jutge.org/problems/X77297_en)

<!-- Aquesta imatge ha d'anar al final de cada lliçó, ja sigui amb aquesta línia o dins la signatura. Deixar comentat si ja està a la signatura-->
<br>
<br>
<img src='../logos/TotsLogosBlanc.png ' alt="Logos Càtedra Chip" width="100%" style="display:block; margin:0 auto; border-radius: 8px;"/>


<Autors autors="xcasas fmadrid jordic"/>