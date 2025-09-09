<!-- Posar aquesta imatge al començament de cada lliçó -->
<img src='../logos/illustracio1.png' alt="Circuits digitals" style=" float: left; border-radius: 8px; height: 120px; text-align: right;"/>
<img src='../logos/LogoCatedraCHIPBlanc.jpg' alt="Logo Càtedra Chip" style="float: right; border-radius: 8px; height: 120px; text-align: right;"/>
<div style="clear: both;"></div>
<br>

# Multiplexors

En aquesta lliçó veuràs el funcionament dels multiplexors i com s’implementen amb portes lògiques.

En electrònica, un multiplexor (o MUX) és un dispositiu que Selecciona un d’entre múltiples senyals d'entrada i el reenvia a una única línia de sortida. En el context dels circuits digitals, els senyals d'entrada són digitals (bits), tot i que també existeixen multiplexors per a senyals analògics.
Un multiplexor fa possible que diverses entrades comparteixin un dispositiu o recurs, en lloc de tenir-ne un per a cada senyal.
Per exemple, un convertidor analògic-digital o un mitjà de transmissió de comunicacions.

Els multiplexors també es poden utilitzar per implementar funcions booleanes de múltiples variables.


## EXEMPLE: multiplexor de 2 entrades
Imagina que tens dues fonts de dades diferents, dos sensors de temperatura, i necessites seleccionar quin s'enviarà a un processador. Emprarem un multiplexor.

Dissenyarem un multiplexor de 2 entrades ($in_1$, $in_2$) i 1 sortida ($out$). Una entrada especial serà el selector ($Sel$), encarregat de triar quina de les dues entrades s’enviarà a $out$. En aquest exemple volem que, al activar $Sel$ amb un ‘$1$’, la sortida $out$ sigui igual a $in_1$. Sempre que $Sel$ no estigui activada, és a dir, que sigui ‘$0$’, la sortida serà igual a $in_2$.

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

Seguidament, deduïm l’expressió de la funció booleana de la sortida:

$
out = \overline{Sel} \, (in_2 \, \overline{in_1} + in_2 \, in_1) + Sel \, (\overline{in_2} \, in_1 + in_2 \, in_1)
$
$
= \overline{Sel} \, in_2(\overline{in_1}+in_1)+Sel \, in_1(\overline(in_2)+in_2)
$

Aplicant les següents propietats de l'àlgebra booleana:

$\overline{A}+A=1$  &emsp;&emsp;&emsp;&emsp;&emsp; i &emsp;&emsp;&emsp;&emsp;&emsp; $A·1=A$

Arribem a la conclusió que

$
out=\overline{Sel} \, in_2 + Sel \, in_1
$

Finalment dibuixem el circuit lògic que ho implementa.

<img src='./multiplexor_exemple.png' alt="exemple circuit" style="display:block; height:150px; margin:0 auto; border-radius: 8px;"/>
<center><i>Circuit Multiplexor</i></center>

## Exercicis de [Introduction to Digital Circuit Design](https://jutge.org/courses/JordiCortadella:IntroCircuits)

[2-input multiplexer](https://jutge.org/problems/X12031_en) 

[Shuffle](https://jutge.org/problems/X07222_en)

[2-input multiplexer (4-bit wide)](https://jutge.org/problems/X82780_en)

[4-input multiplexer](https://jutge.org/problems/X45339_en)

<small>*Recorda (troba-ho a la pàgina d'[inici](../Intro/inici.md)) que per accedir als exercicis i que el **Jutge** valori les teves solucions has d'estar inscrit al [curs](https://jutge.org/courses/JordiCortadella:IntroCircuits).*</small>

<!-- Aquesta imatge ha d'anar al final de cada lliçó, ja sigui amb aquesta línia o dins la signatura. Deixar comentat si ja està a la signatura-->
<br>
<br>
<img src='../logos/TotsLogosBlanc.png ' alt="Logos Càtedra Chip" width="100%" style="display:block; margin:0 auto; border-radius: 8px;"/>


<Autors autors="xcasas fmadrid jordic"/>