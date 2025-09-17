<!-- Posar aquesta imatge al començament de cada lliçó -->
<img src='../logos/illustracio1.png' alt="Circuits digitals" style=" float: left; border-radius: 8px; height: 120px; text-align: right;"/>
<img src='../logos/LogoCatedraCHIPBlanc.jpg' alt="Logo Càtedra Chip" style="float: right; border-radius: 8px; height: 120px; text-align: right;"/>
<div style="clear: both;"></div>
<br>

# Busos

En circuits digitals, un bus de bits (o simplement bus) és un conjunt de línies de comunicació o pistes que transporten bits de dades de manera paral·lela. Serveixen per interconnectar diferents components d’un sistema transferint senyals digitals.

El desplaçament de bits és una operació que mou tots els bits d’un registre (o paraula binària) cap a l’esquerra o cap a la dreta. Aquesta és una operació molt important a l’hora de processar les dades transmeses per un bus.

## EXEMPLE: Disseny d'un circuit desplaçador de bus a l'esquerra (N-bits)

Imagina que treballes amb dades binàries i necessites moure tots els bits d'una seqüència una posició cap a l'esquerra. Això equival a multiplicar el seu valor numèric per dos. Per exemple, 1010 binari és 10 en decimal; si el desplacem una posició cap a l'esquerra n'obtenim 10100, que és 20 en decimal.

En aquest apartat treballarem amb variables que representen nombres binaris de N bits. Per referir-nos a una variable, farem servir una notació com $A[3:0]$, que descriu un conjunt de 4 bits anomenat $A$. El rang $[3:0]$ especifica que els bits estan indexats des del 3 fins al 0. Aquesta variable es pot descompondre en els seus bits individuals com $[A_3​ A_2​ A_1​ A_0​]$, on $A_3$ és el bit de més pes (Most Significant Bit o MSB) i $A_0$ és el bit de menys pes (Less Significant Bit o LSB). Aquesta notació ens permet referir-nos tant al conjunt complet de bits ($A$) com a cadascun dels seus bits individuals ($A_i$).

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

En aquesta secció emprarem multiplexors i el circuit serà el seguent:

<img src='./bus_exemple.png' alt="Circuit desplaçador" style="display:block; height:400px; margin:0 auto; border-radius: 8px;"/>
<center><i>Circuit digital que desplaça una posició cap a l'esquerra</i></center>

El senyal de control $Sel$ serveix per determinar si el circuit efectua el desplaçament o no.

* Si $Sel=0$, la sortida és igual a l'entrada i no hi ha desplaçament.
* Si $Sel=1$, els multiplexors d'activen realitzant un desplaçament a l'esquerra d'una posició.

Per a cada bit de sortida de $B$, farem servir un multiplexor 2-a-1.
* MUX per $B_3$:
    * Entrada 0: $A_3$
    * Entrada 1: $A_2$
    * Sortida: $B_3$
* MUX per $B_2$:
    * Entrada 0: $A_2$
    * Entrada 1: $A_1$
    * Sortida: $B_2$
* MUX per $B_1$:
    * Entrada 0: $A_1$
    * Entrada 1: $A_0$
    * Sortida: $B_1$
* MUX per $B_0$:
    * Entrada 0: $A_0$
    * Entrada 1: $'0'$ (bit que entra)
    * Sortida: $B_0$



## Exercicis de [Introduction to Digital Circuit Design](https://jutge.org/courses/JordiCortadella:IntroCircuits)


[Bus invert](https://jutge.org/problems/X29475_en)

[Bus transfer or invert](https://jutge.org/problems/X00341_en)

[Shift left](https://jutge.org/problems/X26035_en)

[Shift left or right](https://jutge.org/problems/X25794_en)

<small>*Recorda (troba-ho a la pàgina d'[inici](../Intro/inici.md)) que per accedir als exercicis i que el **Jutge** valori les teves solucions has d'estar inscrit al [curs](https://jutge.org/courses/JordiCortadella:IntroCircuits).*</small>

<!-- Aquesta imatge ha d'anar al final de cada lliçó, ja sigui amb aquesta línia o dins la signatura. Deixar comentat si ja està a la signatura-->
<br>
<br>
<img src='../logos/TotsLogosBlanc.png ' alt="Logos Càtedra Chip" width="100%" style="display:block; margin:0 auto; border-radius: 8px;"/>


<Autors autors="xcasas fmadrid jordic"/>