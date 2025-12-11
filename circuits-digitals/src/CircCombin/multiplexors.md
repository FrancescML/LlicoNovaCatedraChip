<!-- Posar aquesta imatge al començament de cada lliçó -->

<img src="../logos/illustracio1.png" alt="Circuits digitals" style="float: left; border-radius: 8px; height: 120px;" />
<img src="../logos/LogoCatedraCHIPBlanc.jpg" alt="Logo Càtedra Chip" style="float: right; border-radius: 8px; height: 120px;" />
<div style="clear: both;"></div>
<br>

# Multiplexors

En aquesta lliçó veuràs el funcionament dels multiplexors i com s’implementen amb portes lògiques.

En electrònica, un **multiplexor** (o **MUX**) és un dispositiu que selecciona un senyal d’entre múltiples senyals d’entrada i el reenvia a una única línia de sortida. En el context dels circuits digitals, les entrades són digitals (bits), tot i que també existeixen multiplexors per a senyals analògics.

Un multiplexor permet que diverses entrades comparteixin un mateix recurs, en lloc de tenir-ne un per a cada senyal. Un exemple seria un convertidor analògic-digital o un mitjà de transmissió de comunicacions.

Els multiplexors també es poden utilitzar per implementar funcions booleanes de múltiples variables.

## Exemple: Multiplexor de 2 entrades

Imaginem que tenim dues fonts de dades diferents, possiblement dos sensors, i necessitem un circuit que seleccioni quin d’aquests senyals s’enviarà a un processador.

Dissenyarem un multiplexor de **2 entrades** ($in_1$, $in_2$) i **1 sortida** ($out$). Una entrada especial és el **selector** ($Sel$), encarregat de triar quina de les dues entrades s’enviarà a $out$.

En aquest exemple volem que:

* Quan **$Sel = 1$**, la sortida sigui **$in_1$**.
* Quan **$Sel = 0$**, la sortida sigui **$in_2$**.

En primer lloc, construïm la taula de veritat amb tots els valors possibles de les entrades i el selector:

<i>Taula de veritat</i>

| **$in_1$** | **$in_2$** | **$Sel$** | **$out$** |
| ---------- | ---------- | --------- | --------- |
| 0          | 0          | 0         | 0         |
| 0          | 1          | 0         | 1         |
| 1          | 0          | 0         | 0         |
| 1          | 1          | 0         | 1         |
| 0          | 0          | 1         | 0         |
| 0          | 1          | 1         | 0         |
| 1          | 0          | 1         | 1         |
| 1          | 1          | 1         | 1         |

L'expressió booleana simplificada de la sortida és:

$$
out = \overline{Sel} \cdot in_2 \;+\; Sel \cdot in_1
$$

A continuació dibuixem el circuit lògic associat:

<img src="./multiplexor_exemple.png" alt="exemple circuit" style="display:block; height:150px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;" />
<center><i>Circuit multiplexor</i></center>

## Exercicis a Jutge.org: [Introduction to Digital Circuit Design](https://jutge.org/courses/JordiCortadella:IntroCircuits)
- [2-input multiplexer](https://jutge.org/problems/X12031_en)
- [Shuffle](https://jutge.org/problems/X07222_en)
- [2-input multiplexer (4-bit wide)](https://jutge.org/problems/X82780_en)
- [4-input multiplexer](https://jutge.org/problems/X45339_en)

<small>
*Recorda que per accedir als exercicis i perquè el **Jutge** valori les teves solucions has d'estar inscrit al [curs](https://jutge.org/courses/JordiCortadella:IntroCircuits).  
Trobaràs totes les instruccions [aquí](../Inici/instruccions.md).*
</small>

<!-- Aquesta imatge ha d'anar al final de cada lliçó, ja sigui amb aquesta línia o dins la signatura. Deixar comentat si ja està a la signatura-->

<br><br>
<img src="../logos/TotsLogosBlanc.png" alt="Logos Càtedra Chip" width="100%" style="display:block; margin:0 auto; border-radius:8px;" />

<Autors autors="xcasas fmadrid" />
