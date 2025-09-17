
<!-- Posar aquesta imatge al començament de cada lliçó -->
<img src='../logos/illustracio1.png' alt="Circuits digitals" style=" float: left; border-radius: 8px; height: 120px; text-align: right;"/>
<img src='../logos/LogoCatedraCHIPBlanc.jpg' alt="Logo Càtedra Chip" style="float: right; border-radius: 8px; height: 120px; text-align: right;"/>
<div style="clear: both;"></div>
<br>


# Introducció a l'àlgebra de Boole

L'àlgebra de Boole és una eina matemàtica fonamental per l'anàlisi i el disseny dels circuits digitals. És un llenguatge que descriu com aquests circuits processen la informació. 

L'àlgebra de Boole és un sistema matemàtic lògic que treballa amb només dos valors possibles: veritable (1) i fals (0). Aquests dos valors corresponen directament als estats elèctrics dels circuits digitals: un voltatge alt (1) o baix (0), un interruptor obert o tancat, etc. Per això se l'anomena també àlgebra binària.

L'àlgebra de Boole:

* **Base de la Computació**: És la base lògica de totes les operacions que fan els ordinadors, des de càlculs aritmètics fins a decisions complexes en programes.

* **Anàlisi**: Ajuda a entendre el funcionament d'un circuit existent, permetent determinar la seva sortida donades unes entrades.

* **Disseny**: Proporciona un mètode sistemàtic per dissenyar circuits digitals que realitzin una funció específica (per exemple, un sumador, un comparador, un multiplexor).

* **Optimització**: Permet simplificar expressions lògiques complexes. Això es tradueix directament en circuits digitals més senzills, que consumiran menys, seràn més ràpids i fiables.

## Gramàtica Bàsica i operadors fonamentals

L'àlgebra de Boole utilitza tres operadors lògics fonamentals que es corresponen directament amb les portes lògiques digitals.

### NOT o Negació:

La negació de $A$ es pot expressar de diferents maneres. Per exemple:

$A'$ &emsp;&emsp;&emsp; o bé &emsp;&emsp;&emsp; $\bar{A}$

La negació inverteix el valor de l'entrada. La taula de veritat es correspòn amb la porta lògica NOT. Si l'entrada és 0, la sortida és 1; si l'entrada és 1, la sortida és 0.

| $A$ | $\bar{A}$ |
|---|----|
| 0 | 1  |
| 1 | 0  |

### **AND** o Multiplicació Lògica:
La multiplicació s'expressa amb el símbol \"$·$\" o la simple juxtaposició.  Per exemple:

$A·B$ &emsp;&emsp;&emsp; o bé &emsp;&emsp;&emsp; $AB$

La taula de veritat es correspon amb la porta lògica AND. La sortida és '$1$' només si totes les entrades són '$1$'   .

|$A$|$B$| $A·B$ |
|---|---|:-----:|
| 0 | 0 | 0     |
| 0 | 1 | 0     |
| 1 | 0 | 0     |
| 1 | 1 | 1     |

### OR o Suma Lògica:
La suma s'expressa amb el símbol "$+$". Per exemple:

$A + B$

La taula de veritat es correspon amb la porta lògica OR. La sortida és '$1$' si almenys una de les entrades és '$1$'.

|$A$|$B$| $A+B$ |
|---|---|:-----:|
| 0 | 0 | 0     |
| 0 | 1 | 1     |
| 1 | 0 | 1     |
| 1 | 1 | 1     |


## Postulats Fonamentals o Axiomes de Boole
Els postulats Boole son regles bàsiques, veritats acceptades sobre les quals es construeix tota l'àlgebra de Boole.

**Propietats de la Suma Lògica**

$A + 0 = A$ &emsp;&emsp;&emsp; *El 0 és l'element neutre (identitat) de la suma lògica*

$A + 1 = 1$

$A + \bar{A} = 1$

$A + A = A$ &emsp;&emsp;&emsp; *Llei d'Idempotència*

**Propietats de la Multiplicació Lògica**

$A · 1 = A$ &emsp;&emsp;&emsp; *L'1 és l'element neutre de la multiplicació lògica*

$A · 0 = 0$

$A · \bar{A} = 0$

$A · A = A$ &emsp;&emsp;&emsp; *Llei d'Idempotència*

**Propietats de la Negació**

$\bar{0} = 1$

$\bar{1} = 0$

$\overline{\overline{A}} = A$

**Propietat Commutativa** de la multiplicació i de la suma lògica: L'ordre de les operacions no altera el resultat.

$A + B = B + A$

$A · B = B · A$

**Propietat Associativa:** Quan hi ha tres o més variables, la manera com s'agrupen les operacions no afecta el resultat.

$(A + B) + C = A + (B + C)$

$(A · B) · C = A · (B · C)$

**Propietat Distributiva:** La multiplicació lògica es distribueix sobre la suma lògica.

$A · (B + C) = (A · B) + (A · C)$

Atenció! a diferència de l'àlgebra tradicional, la suma lògica es distribueix sobre la multiplicació lògica.

$A + (B · C) = (A + B) · (A + C)$

**Lleis d'Absorció:**

$A + (A · B) = A$

$A · (A + B) = A$

**Lleis de De Morgan:** Molt importants per a la simplificació.

$\overline{A + B} = \bar{A} · \bar{B}$

$\overline{A · B} = \bar{A} + \bar{B}$

$A + \bar{A}·B=A+B$

$A(\bar{A}+B) = A·B$

Amb aquesta base podràs simplificar expressions, dissenyar funcions lògiques i sistemes digitals cada cop més complexos.





<!-- Aquesta imatge ha d'anar al final de cada lliçó, ja sigui amb aquesta línia o dins la signatura. Deixar comentat si ja està a la signatura-->
<br>
<br>
<img src='../logos/TotsLogosBlanc.png ' alt="Logos Càtedra Chip" width="100%" style="display:block; margin:0 auto; border-radius: 8px;"/>


<Autors autors="xcasas fmadrid jordic"/>
