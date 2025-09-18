
<!-- Posar aquesta imatge al començament de cada lliçó -->
<img src='../logos/illustracio1.png' alt="Circuits digitals" style=" float: left; border-radius: 8px; height: 120px; text-align: right;"/>
<img src='../logos/LogoCatedraCHIPBlanc.jpg' alt="Logo Càtedra Chip" style="float: right; border-radius: 8px; height: 120px; text-align: right;"/>
<div style="clear: both;"></div>
<br>


# Introducció a l'àlgebra de Boole

L'àlgebra de Boole, també anomenada àlgebra booleana, en matemàtica, electrònica digital i informàtica és una estructura algebraica que esquematitza les operacions lògiques.
Les seves variables només poden adoptar dos valors, tradicionalment denominats, cert i fals, representats com a 1 i 0 respectivament. 

En electròncia digital i inforàtica aquests dos valors es corresponen directament als estats elèctrics dels circuits digitals: un voltatge alt (1) o baix (0), un interruptor obert o tancat, etc.
Aquests representen nombres binaris. Així, la **lògica binària**, que és àlgebra de Boole, descriu les operacions lògiques dels circuits digitals.



* **Base de la Computació**: L'àlgebra de Boole és una eina fonamental per l'anàlisi i el disseny dels circuits digitals i és la base de l'aritmètica computacional moderna.

* **Anàlisi**: Ajuda a entendre el funcionament d'un circuit existent, permetent determinar la seva sortida donades unes entrades.

* **Disseny**: Proporciona un mètode sistemàtic per dissenyar circuits digitals que realitzin una funció específica (per exemple, un sumador, un comparador, un multiplexor).

* **Optimització**: Permet simplificar expressions lògiques complexes. Això es tradueix directament en circuits digitals més senzills, que consumiran menys, seràn més ràpids i fiables.

## Operadors binaris

L'àlgebra de Boole utilitza tres operadors lògics fonamentals que es corresponen directament amb les portes lògiques digitals.

### NOT o Negació:

La negació de $A$ es pot expressar de diferents maneres. Per exemple:

$A'$ &emsp;&emsp;&emsp; o $¬A$ &emsp;&emsp;&emsp; o bé &emsp;&emsp;&emsp; $\bar{A}$

La negació inverteix el valor de l'entrada. La taula de veritat es correspòn amb la porta lògica NOT. Si l'entrada és 0, la sortida és 1; si l'entrada és 1, la sortida és 0.

| $A$ | $\bar{A}$ |
|---|----|
| 0 | 1  |
| 1 | 0  |

### **AND** o Multiplicació Lògica:
La multiplicació o conjunció lògica s'expressa amb el símbol \"$·$\" o la simple juxtaposició.  Per exemple:

$A·B$ &emsp;&emsp;&emsp; $A∧B$ &emsp;&emsp;&emsp; o bé &emsp;&emsp;&emsp; $AB$

La taula de veritat es correspon amb la porta lògica AND. La sortida és '$1$' només si totes les entrades són '$1$'   .

|$A$|$B$| $A·B$ |
|---|---|:-----:|
| 0 | 0 | 0     |
| 0 | 1 | 0     |
| 1 | 0 | 0     |
| 1 | 1 | 1     |

### OR o Suma Lògica:
La suma o disjunció lògica s'expressa amb el símbol "$+$". Per exemple:

$A + B$ &emsp;&emsp;&emsp; o bé  $A∨B$

La taula de veritat es correspon amb la porta lògica OR. La sortida és '$1$' si almenys una de les entrades és '$1$'.

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

**Algunes propietats derivades:**

$A + \bar{A}·B=A+B$

$A(\bar{A}+B) = A·B$


## Funcions booleanes
Una funció booleana és aquella que donades unes variables booleanes d'entrada proporciona un resultat en forma de variables també booleanes.

Aquesta funció es pot expressar amb una expressió booleana, o una taula de veritat, un mapa de Karnaugh o bé implementar-se en un circuit combinacional. 

Amb aquesta base podràs simplificar expressions, dissenyar funcions lògiques i sistemes digitals cada cop més complexos.



<!-- Aquesta imatge ha d'anar al final de cada lliçó, ja sigui amb aquesta línia o dins la signatura. Deixar comentat si ja està a la signatura-->
<br>
<br>
<img src='../logos/TotsLogosBlanc.png ' alt="Logos Càtedra Chip" width="100%" style="display:block; margin:0 auto; border-radius: 8px;"/>


<Autors autors="xcasas fmadrid jordic"/>
