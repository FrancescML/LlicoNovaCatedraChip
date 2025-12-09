<!-- Posar aquesta imatge al començament de cada lliçó -->
<img src='../logos/illustracio1.png' alt="Circuits digitals" style=" float: left; border-radius:8px; height: 120px; text-align: right;"/>
<img src='../logos/LogoCatedraCHIPBlanc.jpg' alt="Logo Càtedra Chip" style="float: right; border-radius:8px; height: 120px; text-align: right;"/>
<div style="clear: both;"></div>
<br>

# Introducció als circuits digitals

En aquestes lliçons aprendràs què són els circuits digitals i els seus diferents tipus. Hi trobaràs exemples per entendre els circuits combinacionals, els circuits seqüencials i els circuits aritmètics.

Els **circuits digitals** processen informació representada en format binari, que utilitza només dos estats elèctrics: voltatge baix i voltatge alt, que representen els valors binaris 0 i 1. Els components fonamentals dels circuits digitals són les portes lògiques. Aquestes són la base dels microprocessadors, memòries, controladors i qualsevol altre circuit digital complex.

Les **portes lògiques** són petits circuits que efectuen operacions lògiques bàsiques sobre un o més senyals binaris d'entrada i produeixen un únic senyal binari de sortida. Per utilitzar les portes lògiques i crear circuits digitals cal conèixer els conceptes d'àlgebra de Boole i les taules de veritat. En molts exemples i exercicis de circuits digitals utilitzarem les taules de veritat o una expressió booleana per descriure el comportament lògic d’un circuit.

|**Porta lògica**|**Símbol**                           |**Expressió Lògica**       |**Descripció**
|------ |------                                        |:---:                      |------
|Buffer |<img src="./Buffer_ANSI_Labelled.png" style="background-color: rgba(255, 255, 255, 1); height:80px;"/>   |$A$                        |Retorna el mateix bit
|NOT    |<img src="./NOT_ANSI_Labelled.png" style="background-color: rgba(255, 255, 255, 1); height:80px;"/>      |$\bar{A}$                  |Inverteix el bit
|AND    |<img src="./AND_ANSI_Labelled.png" style="background-color: rgba(255, 255, 255, 1); height:80px;"/>      |$A·B$                      |1 si les dues entrades són 1
|OR     |<img src="./OR_ANSI_Labelled.png" style="background-color: rgba(255, 255, 255, 1); height:80px;"/>       |$A+B$                      |1 si almenys una entrada és 1
|NAND   |<img src="./NAND_ANSI_Labelled.png" style="background-color: rgba(255, 255, 255, 1); height:80px;"/>     |$\overline{A·B}$           |AND invertit (combinació d'AND i NOT)
|NOR    |<img src="./NOR_ANSI_Labelled.png" style="background-color: rgba(255, 255, 255, 1); height:80px;"/>      |$\overline{A+B}$           |OR invertit (combinació d'OR i NOT)
|XOR    |<img src="./XOR_ANSI_Labelled.png" style="background-color: rgba(255, 255, 255, 1); height:80px;"/>      |$A·\bar{B}+\bar{A}·B$      |1 si les entrades són diferents
|XNOR   |<img src="./XNOR_ANSI_Labelled.png" style="background-color: rgba(255, 255, 255, 1); height:80px;"/>     |$(A·B)+(\bar{A}·\bar{B})$  |1 si les entrades són iguals

<!-- Imatges de ( https://en.wikipedia.org/wiki/Logic_gate) resum, notes o total.*/-->

Una **expressió lògica** és una expressió que defineix una sortida booleana a partir d’un conjunt de variables d’entrada binàries (0 o 1). Per descriure aquesta relació s’utilitzen operacions lògiques com AND, OR i NOT.

Una **taula de veritat** mostra totes les possibles combinacions d’entrades d’un circuit lògic o funció booleana i el resultat corresponent a la sortida per cadascuna d’aquestes combinacions.

Un [**circuit combinacional**](../CircCombin/intro) és un tipus de circuit digital en el qual el valor de la seva sortida en un instant depèn únicament dels valors actuals de les seves entrades. Construïts únicament amb portes lògiques simples, no tenen retroalimentació ni memòria. El seu comportament es pot descriure amb taules de veritat i funcions booleanes.

<img src='./combinacional.png' alt="Circuit combinacional" style="display:block; width:500px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<center><i>Circuit combinacional</i></center>


Els [circuits aritmètics](../CircAritm/intro.md) són una important subclasse dels circuits digitals combinacionals. La seva funció és efectuar operacions matemàtiques bàsiques amb nombres binaris.

<img src='./aritmetic.png' alt="Circuit aritmètic" style="display:block; width:400px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<center><i>Aquest exemple és un circuit aritmètic sumador</i></center>

Els [circuits seqüencials](../CircSeq/intro.md) són un tipus de circuit digital que, a diferència dels circuits combinacionals o aritmètics, estan retroalimentats i tenen memòria. És a dir, la seva sortida no només depèn dels valors actuals de les entrades sinó també del seu estat previ o historial d’entrades. Molts d’ells utilitzen un rellotge per coordinar els canvis d'estat.

<img src='./sequencial.png' alt="Circuit seqüencial" style="display:block; width:500px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<center><i>Circuit seqüencial</i></center>

La lliçó [Tiny Micro](../TinyMicro/intro.md) és un recull d’exercicis avançats sobre l'operació d'un petit ordinador.


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


# Introducció a l'àlgebra de Boole

L'àlgebra de Boole, també anomenada àlgebra booleana, és una estructura algebràica que utilitza variables i operacions lògiques.
Les seves variables només poden adoptar dos valors, tradicionalment denominats, cert i fals, representats com a 1 i 0 respectivament. 

L'àlgebra va ser creada per George Boole al s. XIX, però els enginyers van veure que era perfecte per a l'electrònica, on la seva funció és descriure i simplificar els circuits.

En electròncia digital aquests dos valors es corresponen directament als estats elèctrics dels circuits digitals: un voltatge alt (1) o baix (0). Per això, l'àlgebra de Boole es pot utilitzar per descriure les operacions lògiques dels circuits digitals.


* **Base de la Computació**: L'àlgebra de Boole és una eina fonamental per l'anàlisi i el disseny dels circuits digitals i és la base de l'aritmètica computacional moderna.

* **Anàlisi**: Ajuda a entendre el funcionament d'un circuit existent, permetent determinar la seva sortida donades unes entrades.

* **Disseny**: Proporciona un mètode sistemàtic per dissenyar circuits digitals que realitzin una funció específica (per exemple, un sumador, un comparador, un multiplexor).

* **Optimització**: Permet simplificar expressions lògiques complexes. Això es tradueix directament en circuits digitals més senzills, que consumiran menys, seràn més ràpids i fiables.

## Operadors booleans

L'àlgebra de Boole utilitza tres operadors fonamentals. Les portes lògiques s'hi corresponen directament i prenen el mateix nom.
Els operadors booleans es poden representar de diferents maneres segons l’àmbit d’aplicació de l’àlgebra de Boole.

### NOT o Negació:

La negació d'una variable booleana $A$ es pot expressar de diferents maneres depenent de l'ambit d'aplicació de l'àlgebra de boole.

$\bar{A}$

(també s'utilitza $A'$ o bé $¬A$)

La negació inverteix el valor de l'entrada. La taula de veritat es correspòn amb la porta lògica NOT. Si l'entrada és 0, la sortida és 1; si l'entrada és 1, la sortida és 0.

| $A$ | $\bar{A}$ |
|---|----|
| 0 | 1  |
| 1 | 0  |

### **AND**:
L'operador AND també s'anomena multiplicació o conjunció lògica. 

Per exemple, per a les variables booleanes $A$ i $B$ s'expressa amb el símbol \"$·$\" o la simple juxtaposició.

$A·B$

o també

$AB$

o bé
 
$A∧B$

La taula de veritat es correspon amb la porta lògica AND. La sortida és $1$ només si totes les entrades són $1$.

|$A$|$B$| $AB$ |
|---|---|:-----:|
| 0 | 0 | 0     |
| 0 | 1 | 0     |
| 1 | 0 | 0     |
| 1 | 1 | 1     |

### OR:
L'operador OR també es pot referir com a suma o disjunció lògica.

Per exemple, per a les variables booleanes $A$ i $B$ s'expressa amb el símbol "$+$". 

$A + B$

o també

$A∨B$

La taula de veritat es correspon amb la porta lògica OR. La sortida és $1$ si almenys una de les entrades és $1$.

|$A$|$B$| $A+B$ |
|---|---|:-----:|
| 0 | 0 | 0     |
| 0 | 1 | 1     |
| 1 | 0 | 1     |
| 1 | 1 | 1     |


## Postulats Fonamentals o Axiomes de Boole
Els postulats Boole son regles bàsiques, veritats acceptades sobre les quals es construeix tota l'àlgebra de Boole.

**Propietats de la Suma Lògica (OR)**

$A + 0 = A$ &emsp;&emsp;&emsp; *El 0 és l'element neutre (identitat) de la suma lògica*

$A + 1 = 1$

$A + \bar{A} = 1$

$A + A = A$ &emsp;&emsp;&emsp; *Llei d'Idempotència*

**Propietats de la Multiplicació Lògica (AND)**

$A · 1 = A$ &emsp;&emsp;&emsp; *L'1 és l'element neutre de la multiplicació lògica*

$A · 0 = 0$

$A · \bar{A} = 0$

$A · A = A$ &emsp;&emsp;&emsp; *Llei d'Idempotència*

**Propietats de la Negació**

$\bar{0} = 1$

$\bar{1} = 0$

$\overline{\overline{A}} = A$

**Propietat Commutativa de la multiplicació i de la suma lògica**: L'ordre de les operacions no altera el resultat.

$A + B = B + A$

$A · B = B · A$

**Propietat Associativa:** Quan hi ha tres o més variables, la manera com s'agrupen les operacions no afecta el resultat.

$(A + B) + C = A + (B + C)$

$(A · B) · C = A · (B · C)$

**Propietat Distributiva:** La multiplicació lògica es distribueix sobre la suma lògica.

$A · (B + C) = (A · B) + (A · C)$

**Atenció!** a diferència de l'àlgebra tradicional, la suma lògica es distribueix sobre la multiplicació lògica.

$A + (B · C) = (A + B) · (A + C)$

**Lleis d'Absorció**

$A + (A · B) = A$

$A · (A + B) = A$

**Lleis de De Morgan:** Molt importants per a la simplificació.

$\overline{A + B} = \bar{A} · \bar{B}$

$\overline{A · B} = \bar{A} + \bar{B}$

**Algunes propietats derivades**

$A + \bar{A}·B=A+B$

$A(\bar{A}+B) = A·B$


## Funcions booleanes
Una funció booleana és una aplicació que assigna a unes variables booleanes d'entrada un resultat en forma de variable booleana.

Aquesta funció es pot representar de diferents maneres; amb una expressió booleana, una taula de veritat, un mapa de Karnaugh o bé amb un circuit digital combinacional.

Amb aquesta base podràs simplificar expressions, dissenyar funcions lògiques i sistemes digitals cada cop més complexos.



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

# Introducció als Mapes de Karnaugh

Un mapa de Karnaugh (també conegut com a K-map o diagrama de Veitch) és una eina gràfica utilitzada en electrònica digital per simplificar funcions lògiques booleanes de manera visual i sistemàtica. 

L'objectiu principal és trobar l'expressió booleana més simple possible per a una funció lògica determinada. Una funció lògica més simple es tradueix directament en un circuit digital més senzill.

Es tracta d’un mètode alternatiu a la simplificació amb les lleis de l'àlgebra de Boole i és vàlid per a qualsevol nombre de variables. Resulta però més pràctic i intuitiu per a poques variables, típicament de 2 a 4. Més enllà de 6 variables, els mapes de Karnaugh ja deixen de ser pràctics. 

Un mapa de Karnaugh és una graella que organitza totes les possibles combinacions de les variables d’entrada d’una funció booleana. Cada cel·la representa una combinació de les variables d'entrada de la funció, és a dir, una fila de la taula de la veritat.

Aquest mapa s’ha d’ordenar de manera que entre dues cel·les adjacents verticalment o horitzontalment, només canviï el valor d'una única variable. Això facilita identificar patrons i fer agrupacions per reduïr l’expressió lògica.

## EXEMPLE: 

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

<!-- 
<i>Mapa de Karnaugh</i>

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

Els valors de cada cel·la són els valors que pren la sortida $S$ en funció de $A$, $B$ i $C$ en una fila de la taula.



## Regles per al Mapa de Karnaugh

### **Codi Gray:**
Les files i columnes del mapa no s'ordenen de manera convencional (00, 01, 10, 11), sinó que segueixen el codi Gray (00, 01, 11, 10). 
És a dir, entre dues cel·les adjacents (verticalment o horitzontalment) només canvia el valor d'una única variable.

### **Omplir la taula:**
Cal omplir la taula amb els resultats de la variable de sortida corresponents a la combinació de valors d'entrada de cada cel.la.

### **Agrupar els $1$ ajacents:**
L'objectiu és fero grups tan extensos com sigui possible.
* S'agrupen els $1$ adjacents en forma de fila, quadrat o rectangle.
* La mida dels grups ha de ser una potència de dos. És a dir 1, 2, 4, 8, etc...
* S'han d'anar fent grups fins que tots els $1$ de la taula formin part d'almenys un d'ells.
* Les vores del mapa es consideren adjacents amb la vora oposada, com si el mapa s'extengués repetint-se més enllà de les vores.

### **Obtenció de l'expressió lògica simplificada:**
Cada grup de $1$ es tradueix en un terme de la funció booleana simplificada. Per fer-ho, s'observen quines variables no canvien de valor dins del grup, aquestes formaràn part del terme de l'expressió. Les variables que canvien de valor dins del grup no apareixeran a l'expressió.



## Estructures per a mapes de Karnaugh de 2 a 5 variables

A continuació es mostren les estructures dels mapes de Karnaugh per diferents nombres de variables d'entrada. Les taules més comuns solen ser les de 2 a 4 variables d'entrada, però es poden utilitzar per a funcions de fins a 5 o 6 variables.


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

En aquest cas, les variables es poden agrupar de diferents maneres; $A\backslash BC$ (exemple anterior), $B\backslash AC$  o $C\backslash AB$ (aquest exemple). En qualsevol cas, el mapa de valors és el mateix (Codi Gray).

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

Fent servir el codi Gray el mapa de Karnaugh de 5 variables s'estructura de la manera següent:

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
      <th style="border: 1px solid #ccc; padding: 5px 10px; border-left: 4px double  #444;">110</th>
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
      <td style="border: 1px solid #ccc; padding: 5px 10px; border-left: 4px double  #444;"> </td>
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
      <td style="border: 1px solid #ccc; padding: 5px 10px; border-left: 4px double  #444;"> </td>
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
      <td style="border: 1px solid #ccc; padding: 5px 10px; border-left: 4px double  #444;"> </td>
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
      <td style="border: 1px solid #ccc; padding: 5px 10px; border-left: 4px double  #444;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;"> </td>
    </tr>
  </tbody>
</table>

Aquest mapa és utilitzable, però obvia que les columnes següents també es poden considerar adjacents.
+ 000 amb 010
+ 110 amb 100
+ 001 amb 101
+ 011 amb 111

Per aquesta raó, s’acostuma a representar amb una línia al centre que separa dos mapes 4×4 independents i que crea adjacències “creuades” entre els dos mapes, com si hi hagués un mirall vertical al centre.
Aquest mapa es pot anomenar mapa de reflexió (*reflection map*).

Una altra manera molt efectiva d'estructurar un mapa de Karnaugh de 5 variables és fer-ne dos de 4 variables: un d'ells representa $𝐴=0$ i l'altre $𝐴=1$, i considerant-los superposats en una tercera dimensió.

<table style="width: 100%; margin: 0 auto; border-collapse: collapse; text-align: center; background-color: transparent;">

  <tbody>
    <tr>
      <td>
        A=0
        <!-- Taula de 4 variables -->
        <table style="border-collapse: collapse; text-align: center;">
        <thead>
            <tr>
            <th style="border: 1px solid #ccc; position: relative; width: 60px; height: 60px;">
                <div style="position: absolute; top: 5px; right: 5px;">   BC </div>
                <div style="position: absolute; bottom: 5px; left: 5px;"> DE </div>
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
      </td>
      <td>
        A=1
        <!-- Taula de 4 variables -->
        <table style="border-collapse: collapse; text-align: center;">
        <thead>
            <tr>
            <th style="border: 1px solid #ccc; position: relative; width: 60px; height: 60px;">
                <div style="position: absolute; top: 5px; right: 5px;">   BC </div>
                <div style="position: absolute; bottom: 5px; left: 5px;"> DE </div>
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
    </td>
    </tr>
  </tbody>
</table>

I visualitzar-los de la manera següent. 

<img src='./kmap5var.png' alt="Karnaugh 5 variables" style="display:block; width:400px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<center><i>Mapa de Karnaugh 5 variables</i></center>





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


## EXEMPLE: 
Busquem en el nostre exemple les agrupacions més extenses possibles de $1$. Hem de continuar amb el procés fins que tots els $1$ hagin estat considerats.


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

En blau tenim quatre $1$ adjacents en forma de fila. La variable en comú en tots ells és $A=1$, les variables $B$ i $C$ canvien de valor. Així doncs, el primer terme de l'expressió de $S$ serà $A$.

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


En groc tenim un grup de quatre $1$ adjacents en forma de quadrat. La variable en comú és $B=1$. Per tant el segon terme de l'expressió de $S$ és $B$.

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

Encara ens queden $1$ per agrupar, així que en vermell tenim un altre grup de quatre $1$ adjacents en forma de quadrat. Aquest agrupament s'extén a través d'una vora de la taula. La variable que manté el seu valor és $C=0$, de manera que cal afegir el terme $C$ negat, $\bar{C}$.

$S=A+B+\bar{C}$

Aquesta és doncs l'expressió booleana simplificada que engendra la taula de veritat exemple.
A partir d'aquesta es dedueix el circuit digital, tres entrades a una porta **OR**, una d'elles negada.

<img src='./karnaugh.png' alt="Agrupacions exemple" style="display:block; height:100px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<center><i>Circuit resultat de l'exemple</i></center>


## Altres exemples
Els següents exemples ens ajudaràn a entendre totes les regles.

## EXEMPLE: 

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



El grup vermell engendra el terme $\bar{A}\bar{C}$ perque les variables constants són $A=0$ i $C=0$. Tant $A$ com $C$ han d'aparèixer negades perque tenen el valor $0$.

En el grup blau $A=1$ i $C=1$, per tant el seu terme a l'expressió booleana és $AC$.

L'expressió simplificada final és el següent.

$S=\bar{A}\bar{C} + AC$

El fet que no hi aparegui la variable $B$ significa que aquesta no té cap efecte en el resultat $S$.

## EXEMPLE: 

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

Amb un sol grup en tenim prou en aquest exemple. Les variables constants són $B=0$ i $C=0$. L'expressió simplificada final té un sol terme.

$S=\bar{B}\bar{C}$

## EXEMPLE: 

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

## EXEMPLE: 

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

## EXEMPLE: 

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

Aquest exemple es pot solucionar amb tres grups. El vermell és $A$, el verd és $B\bar{C}$ i el blau $\bar{B}C$.

$S=A+B\bar{C}+\bar{B}C$


<!-- Aquesta imatge ha d'anar al final de cada lliçó, ja sigui amb aquesta línia o dins la signatura. Deixar comentat si ja està a la signatura-->
<br>
<br>
<img src='../logos/TotsLogosBlanc.png ' alt="Logos Càtedra Chip" width="100%" style="display:block; margin:0 auto; border-radius:8px;"/>

<Autors autors="xcasas fmadrid"/>
