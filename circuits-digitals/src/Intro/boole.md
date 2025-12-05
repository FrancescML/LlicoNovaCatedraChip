
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
