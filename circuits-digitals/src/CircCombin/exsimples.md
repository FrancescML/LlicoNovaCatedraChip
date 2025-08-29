<!-- Posar aquesta imatge al començament de cada lliçó -->
<img src='../logos/illustracio1.png' alt="Circuits digitals" style=" float: left; border-radius: 8px; height: 120px; text-align: right;"/>
<img src='../logos/LogoCatedraCHIPBlanc.jpg' alt="Logo Càtedra Chip" style="float: right; border-radius: 8px; height: 120px; text-align: right;"/>
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

Dissenya un circuit amb tres entrades ($T$, $H$, $S$) i una sortida ($A$). La sortida $A$ determinarà si es concedeix l'accés, prenent el valor '$1$' per a accés concedit i '$0$' per a accés denegat.

En primer lloc muntem la taula de veritat d'aquesta aplicació:

<i>Taula de veritat</i>

|**T**|**H**|**S**|**R1**|**R2**|**R3**|**A**
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
<img src='./exsimplesexemple.png' alt="exemple" style="display:block; height:200px; margin:0 auto; border-radius: 8px;"/>
<center><i>Circuit Digital</i></center>

## Exercici: [The Embassy Ball](https://jutge.org/problems/X64345_en)

<!-- ************* EN CONSTRUCCIÓ *****************-->
<img src='../logos/enconstrucció.png' alt="Logos Càtedra Chip" style="display:block; height:200px; margin:0 auto; border-radius: 8px;"/>



<!-- Aquesta imatge ha d'anar al final de cada lliçó, ja sigui amb aquesta línia o dins la signatura. Deixar comentat si ja està a la signatura-->
<br>
<br>
<img src='../logos/TotsLogosBlanc.png ' alt="Logos Càtedra Chip" width="100%" style="display:block; margin:0 auto; border-radius: 8px;"/>


<Autors autors="jpetit xcasas fmadrid jordic"/>