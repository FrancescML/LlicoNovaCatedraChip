
<!-- Posar aquesta imatge al començament de cada lliçó -->
<img src='../logos/illustracio1.png' alt="Circuits digitals" style="float: left; border-radius: 8px; height: 120px;"/>
<img src='../logos/LogoCatedraCHIPBlanc.jpg' alt="Logo Càtedra Chip" style="float: right; border-radius: 8px; height: 120px;"/>
<div style="clear: both;"></div>
<br>


# Introducció a l'àlgebra de Boole

L'àlgebra de Boole va ser creada per George Boole al s. XIX, però els enginyers van veure que era perfecta per a l'electrònica, on la seva funció és descriure i simplificar els circuits.

L'àlgebra de Boole, també anomenada àlgebra booleana, és una estructura algebraica que utilitza variables i operacions lògiques.
Les seves variables només poden adoptar dos valors, tradicionalment denominats cert i fals, representats com a 1 i 0 respectivament.

En electrònica digital aquests dos valors es corresponen directament als estats elèctrics dels circuits digitals: un voltatge alt (1) o baix (0). Per això, l'àlgebra de Boole es pot utilitzar per descriure les operacions lògiques dels circuits digitals.

* **Base de la Computació**: L'àlgebra de Boole és una eina fonamental per a l'anàlisi i el disseny dels circuits digitals i és la base de l'aritmètica computacional moderna.

* **Anàlisi**: Ajuda a entendre el funcionament d'un circuit existent, permetent determinar la seva sortida donades unes entrades.

* **Disseny**: Proporciona un mètode sistemàtic per dissenyar circuits digitals que realitzin una funció específica (per exemple, un sumador, un comparador o un multiplexor).

* **Optimització**: Permet simplificar expressions lògiques complexes. Això es tradueix directament en circuits digitals més senzills, que consumiran menys i seran més ràpids i fiables.

## Operadors booleans

L'àlgebra de Boole utilitza tres operadors fonamentals. Les portes lògiques s'hi corresponen directament i prenen el mateix nom.
Els operadors booleans es poden representar de diferents maneres segons l’àmbit d’aplicació: matemàtiques, electrònica o programació.

### **NOT**:
L'operador NOT també s'anomena negació o inversió lògica.
Per a una variable booleana $A$, s'expressa amb el símbol "$\overline{\quad}$" sobre la variable, amb el símbol "$\neg$" o amb un apòstrof "$'$".
$\overline{A}$ o també $\neg A$ o bé $A'$

La taula de veritat es correspon amb la porta lògica NOT. La sortida és el valor contrari a l'entrada.

|$A$| $\overline{A}$ |
|---|:-----:|
| 0 | 1 |
| 1 | 0 |


### **OR**:
L'operador OR també s'anomena suma o disjunció lògica.
Per exemple, per a les variables booleanes $A$ i $B$ s'expressa amb el símbol "$+$".
$A+B$ o també $A \lor B$

La taula de veritat es correspon amb la porta lògica OR. La sortida és $1$ si alguna de les entrades és $1$.

|$A$|$B$| $A+B$ |
|---|---|:-----:|
| 0 | 0 | 0 |
| 0 | 1 | 1 |
| 1 | 0 | 1 |
| 1 | 1 | 1 |

### **AND**:
L'operador AND també s'anomena multiplicació o conjunció lògica.
Per exemple, per a les variables booleanes $A$ i $B$ s'expressa amb el símbol "$·$" o la simple juxtaposició.
$A·B$ o també $AB$ o bé $A \land B$

La taula de veritat es correspon amb la porta lògica AND. La sortida és $1$ només si totes les entrades són $1$.

|$A$|$B$| $AB$ |
|---|---|:-----:|
| 0 | 0 | 0     |
| 0 | 1 | 0     |
| 1 | 0 | 0     |
| 1 | 1 | 1     |

## Prioritat d'operacions

La prioritat de les operacions booleanes és la següent (de més prioritat a menys):
1. Parèntesis
2. NOT
3. AND
4. OR



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

**Propietat Commutativa:** L'ordre de les variables no altera el resultat.
* $A + B = B + A$
* $A · B = B · A$

**Propietat Associativa:** En operacions amb més de dues variables, la manera com s'agrupen les operacions no afecta el resultat.
* $(A + B) + C = A + (B + C)$
* $(A · B) · C = A · (B · C)$

**Propietat Distributiva:** La multiplicació lògica es distribueix sobre la suma lògica.
* $A · (B + C) = (A · B) + (A · C)$

**Atenció!** A diferència de l'àlgebra tradicional, la suma lògica es distribueix sobre la multiplicació lògica.
* $A + (B · C) = (A + B) · (A + C)$

**Lleis d'Absorció:**
* $A + (A · B) = A$
* $A · (A + B) = A$

**Lleis de De Morgan:** Molt importants per a la simplificació.
* $\overline{A + B} = \bar{A} · \bar{B}$
* $\overline{A · B} = \bar{A} + \bar{B}$

**Algunes propietats derivades:**
* $A + \bar{A}·B=A+B$
* $A(\bar{A}+B) = A·B$


## Funcions booleanes
Una funció booleana és una aplicació que assigna a unes variables booleanes d'entrada un resultat en forma de variable booleana.

Aquesta funció es pot representar de diferents maneres; amb una expressió booleana, una taula de veritat, un mapa de Karnaugh o bé amb un circuit digital combinacional. Amb aquesta base podràs simplificar expressions, dissenyar funcions lògiques i sistemes digitals cada cop més complexos.

Simplificar una funció booleana significa trobar una expressió equivalent amb el menor nombre de termes i variables possible. Això permet construir el circuit amb menys portes lògiques.
Per simplificar s'utilitzen les lleis i propietats vistes anteriorment, o bé els Mapes de Karnaugh.



<!-- Aquesta imatge ha d'anar al final de cada lliçó, ja sigui amb aquesta línia o dins la signatura. Deixar comentat si ja està a la signatura-->
<br>
<br>
<img src='../logos/TotsLogosBlanc.png ' alt="Logos Càtedra Chip" width="100%" style="display:block; margin:0 auto; border-radius:8px;"/>

<Autors autors="xcasas fmadrid"/>
