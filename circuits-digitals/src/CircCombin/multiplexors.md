<!-- Posar aquesta imatge al començament de cada lliçó -->
<img src='../logos/illustracio1.png' alt="Circuits digitals" style=" float: left; border-radius: 8px; height: 120px; text-align: right;"/>
<img src='../logos/LogoCatedraCHIPBlanc.jpg' alt="Logo Càtedra Chip" style="float: right; border-radius: 8px; height: 120px; text-align: right;"/>
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

Dissenyarem un multiplexor de 2 entrades ($in_1$, $in_2$) i 1 sortida ($out$). Una entrada especial serà el selector ($sel$), encarregat de triar quina de les dues entrades s’enviarà a $out$. En aquest exemple volem que, al activar $sel$ amb un ‘$1$’, la sortida $out$ sigui igual a $in_1$. Sempre que $sel$ no estigui activada, és a dir, que sigui ‘$0$’, la sortida serà igual a $in_2$.

En primer lloc fem la taula de veritat amb tots els valors possibles de les entrades i el selector:

<i>Taula de veritat</i>

|**$in_1$**|**$in_2$**|**$sel$**|**$out$**
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
out = \overline{sel} \, (in_2 \, \overline{in_1} + in_2 \, in_1) + sel \, (\overline{in_2} \, in_1 + in_2 \, in_1)
$
$
= \overline{sel} \, in_2(\overline{in_1}+in_1)+sel \, in_1(\overline(in_2)+in_2)
$

Aplicant les següents propietats de l'àlgebra booleana:

$\overline{A}+A=1$  &emsp;&emsp;&emsp;&emsp;&emsp; i &emsp;&emsp;&emsp;&emsp;&emsp; $A·1=A$

Arribem a la conclusió que

$
out=\overline{sel} \, in_2 + sel \, in_1
$

Finalment dibuixem el circuit lògic que ho implementa.
<img src='./logos/enconstrucció.png' alt="exemple circuit" style="display:block; height:200px; margin:0 auto; border-radius: 8px;"/>
<center><i>Circuit Digital</i></center>


## Exercici: [2-input multiplexer](https://jutge.org/problems/X12031_en) 



<!-- ************* EN CONSTRUCCIÓ *****************-->
<img src='../logos/enconstrucció.png' alt="Logos Càtedra Chip" style="display:block; height:200px; margin:0 auto; border-radius: 8px;"/>




<Autors autors="jpetit xcasas fmadrid"/>