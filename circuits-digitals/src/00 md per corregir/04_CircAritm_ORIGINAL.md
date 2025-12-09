<!-- Posar aquesta imatge al començament de cada lliçó -->
<img src='../logos/illustracio1.png' alt="Circuits digitals" style=" float: left; border-radius:8px; height: 120px; text-align: right;"/>
<img src='../logos/LogoCatedraCHIPBlanc.jpg' alt="Logo Càtedra Chip" style="float: right; border-radius:8px; height: 120px; text-align: right;"/>
<div style="clear: both;"></div>
<br>

# Introducció als circuits aritmètics

Els circuits aritmètics són una subclasse fonamental dels circuits digitals combinacionals. La seva funció principal és efectuar operacions matemàtiques bàsiques amb nombres binaris.


Les operacions bàsiques més habituals que implementen són:

**Semisumador (*Half Adder*)**: Circuit que suma dos bits i produeix una sortida de suma $S$ i un bit de ròssec (*carry*) $C$.

<img src='./blochalfadder.png' alt="Semisumador (*Half Adder*)" style="display:block; width:200px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<center><i>Semisumador (Half Adder)</i></center>

**Sumador complet (*Full Adder*)**: Suma tres bits (dos d’entrada i el ròssec de l’etapa anterior). És el bloc bàsic per construir sumadors de diversos bits mitjançant la connexió en cascada.

<img src='./blocfulladder.png' alt="Sumador complet (*Full Adder*)" style="display:block; width:200px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<center><i>Sumador complet (Full Adder)</i></center>

**Sumador de n bits**: Amb els semisumadors i sumadors complets es poden construir sumadors de n bits. Aquests circuits realitzen una suma binaria de dos nombres $A$ i $B$.

<img src='./blocsumador4bits.png' alt="Sumador de 4 bits" style="display:block; width:600px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<center><i>Sumador de 4 bits</i></center>


**Restador**: La resta binària es resol habitualment emprant sumadors i la representació de nombres en complement a dos, de manera que la resta $A − B$ es transforma en una suma $A + (−B)$.

<img src='./blocrestador4bits.png' alt="Restador de 4 bits" style="display:block; width:600px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<center><i>Restador de 4 bits</i></center>

**Comparadors**: Circuits capaços de determinar si un nombre binari és major, menor o igual que un altre.

<img src='./bloccomparador.png' alt="Comparador" style="display:block; width:200px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<center><i>Comparador</i></center>

**Multiplicadors i divisors**: Circuits més complexos que s’implementen mitjançant algorismes basats en sumes repetides i desplaçaments.

<img src='./blocmultiplicador.png' alt="Multiplicador" style="display:block; width:200px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<center><i>Multiplicador</i></center>

Els circuits aritmètics constitueixen també el nucli de les Unitats Aritmètico-Lògiques (UAL), que són el cor de qualsevol microprocessador. L’UAL és l’encarregada d’executar tant les operacions aritmètiques com les operacions lògiques necessàries per a l’execució dels programes. L'Unitat Aritmètica Lògica (**UAL**) s'anomena *Aritmetic Logic Unit (**ALU**)* en anglès.

<img src='./ALU.png' alt="UAL" style="display:block; width:400px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<center><i>Unitat Aritmètica Lògica (UAL)</i></center>


En aquesta lliçó trobaràs els següents temes:

En el tema de [**Circuits bàsics**](./CircBasics.md) veurem el circuit semisumador (*half adder*), sumador complet (*full adder*) i els comparadors
En el tema [**Aritmètica de 4 bits**](./Aritm4bits.md) veurem els circuits incrementadors i sumadors de 4 bits. Veurem també un exercici de UAL.
En el tema [**Aritmètica de n bits**](./Aritmnbits.md) veurem circuits incrementadors, sumadors i comparadors per a un nombre de n bits.
Finalment, en el tema de [**Miscel·lània**](./miscellania.md) es recull una sèrie d'exercicis de circuits aritmètics més avançats com els multiplicadors, els acumuladors de bits i els circuits seqüencial adders.



<!-- Aquesta imatge ha d'anar al final de cada lliçó, ja sigui amb aquesta línia o dins la signatura. Deixar comentat si ja està a la signatura-->
<br>
<br>
<img src='../logos/TotsLogosBlanc.png ' alt="Logos Càtedra Chip" width="100%" style="display:block; margin:0 auto; border-radius:8px;"/>



<Autors autors="xcasas fmadrid"/><!-- Posar aquesta imatge al començament de cada lliçó -->
<img src='../logos/illustracio1.png' alt="Circuits digitals" style=" float: left; border-radius:8px; height: 120px; text-align: right;"/>
<img src='../logos/LogoCatedraCHIPBlanc.jpg' alt="Logo Càtedra Chip" style="float: right; border-radius:8px; height: 120px; text-align: right;"/>
<div style="clear: both;"></div>
<br>


# Circuits Bàsics

Comencem pels circuits digitals aritmètics més bàsics, com els semisumadors, els sumadors complets i els comparadors de bits.

## EXEMPLE: Semisumador (*Half Adder*)
El semisumador (*half adder* en anglès) és la base dels sumadors complets (*full adders* en anglès) i de les sumes de n bits.

El semisumador pren dos bits, $A$ i $B$, i en fa la suma. La sortida és un bit amb el resultat de la suma i un bit de ròssec.

La taula de veritat de la funció que volem implementar és la següent:

| $A$ | $B$ | $Suma$ | $Carry$ |
|:---:|:---:|:---:|:---:|
| 0 | 0 | 0 | 0 |
| 0 | 1 | 1 | 0 |
| 1 | 0 | 1 | 0 |
| 1 | 1 | 0 | 1 |


Quan $A=1$ i $B=1$ són 1, la suma es desborda, és a dir, no es pot representar amb un sol bit de sortida. El resultat d’aquest desbordament és el bit de ròssec (*carry* en anglès) que és un dígit d'ordre superior.


Podem utilitzar Mapes de Karnaugh o les regles de l'Àlgebra de Boole per deduir les dues expressions booleanes simplificades que descriuen la lògica del circuit:

$Suma= \bar{A}·B + A·\bar{B}= A \: XOR \: B$

$Carry= A·B$

Així doncs, el circuit que implementa aquest Semisumador (*Half Adder*) el següent:

<img src='./halfadder.png' alt="Circuit semisumador" style="display:block; width:250px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<center><i>Circuit semisumador</i></center>

Aquest circuit és un dels elements que construeixen els sumadors complets i sumadors de n bits.

## EXEMPLE: Sumador complet (*full adder*)

El sumador complet (*Full adder* en anglès) suma 3 bits d'entrada. Els bits $A$ i $B$ més un bit de ròssec d'entrada $C_{entrada}$. Representa una suma de dos bits que té en compte un possible bit de ròssec provinent d'una suma anterior dins d'una cadena de sumes.
La seva sortida és un bit, resultat de la suma, i un bit de ròssec de sortida $C_{sortida}$.

La taula de veritat del circuit és:

| $A$ | $B$ | $C_{in}$ | $Suma$ | $C_{out}$ |
|:---:|:---:|:---:|:---:|:---:|
| 0 | 0 | 0 | 0 | 0 |
| 0 | 1 | 0 | 1 | 0 |
| 1 | 0 | 0 | 1 | 0 |
| 1 | 1 | 0 | 0 | 1 |
| 0 | 0 | 1 | 1 | 0 |
| 0 | 1 | 1 | 0 | 1 |
| 1 | 0 | 1 | 0 | 1 |
| 1 | 1 | 1 | 1 | 1 |


Podem utilitzar Mapes de Karnaugh o les regles de l'Àlgebra de Boole per deduir les dues expressions booleanes simplificades que descriuen la lògica del circuit:

$Suma= A \: XOR \: B \: XOR \: C_{entrada}$

$C_{sortida}= A·B + B·C_{entrada} + A·C_{entrada} = A·B + C_{entrada} · (A \: XOR \: B)$


Així doncs, el circuit que implementa un sumador complet (*Full Adder*) és el següent:


<img src='./fulladder.png' alt="Sumador complet" style="display:block; width:600px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<center><i>Sumador complet</i></center>


Aquest circuit es pot interpretar com a dos semisumadors amb una porta OR per al bit de ròssec de sortida:

<img src='./fulladder_2.png' alt="Sumador complet" style="display:block; width:600px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<center><i>Sumador complet</i></center>

## EXEMPLE: Comparador
En aquest exemple veurem un circuit comparador que pren dos bits, $A$ i $B$ i els compara. 

Els circuits comparadors tenen 3 sortides: La primera indica si $A$ és més gran que $B$, la segona segona s'activa si $A$ és igual a $B$ i la tercera indica si $A$ és més petita que $B$.
La taula de veritat, amb aquestes entrades i sortides, és la següent:

| $A$ | $B$ | $Sortida_{A<B}$ | $Sortida_{A=B}$ | $Sortida_{A>B}$ |
|:---:|:---:|:---:|:---:|:---:|
| 0 | 0 | 0 | 1 | 0 |
| 0 | 1 | 1 | 0 | 0 |
| 1 | 0 | 0 | 0 | 1 |
| 1 | 1 | 0 | 1 | 0 |

Les expressions booleanes simplificades que descriuen la lògica del circuit són:

$Sortida_{A<B} =\bar{A}B$

$Sortida_{A=B} = \bar{A}\bar{B} + A B = A \; XNOR \; B$

$Sortida_{A>B} = A \bar{B}$

Així, el circuit comparador és el següent:

<img src='./comparador.png' alt="Circuit comparador" style="display:block; width:400px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<center><i>Circuit comparador</i></center>


## EXEMPLE: Sumador de diversos bits

Amb el sumador complet (*Full Adder*) i el semisumador (*Half Adder*) es poden construir circuits més grans, com ara els sumadors de propagació de càrrega (*ripple-carry adders*), que permeten sumar números binaris de diversos bits.

Per exemple el següent sumador de quatre bits:

<img src='./blocsumador4bits.png' alt="Sumador de 4 bits" style="display:block; width:600px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<center><i>Sumador de 4 bits</i></center>




## Exercicis a Jutge.org: [Introduction to Digital Circuit Design](https://jutge.org/courses/JordiCortadella:IntroCircuits)


[Half adder](https://jutge.org/problems/X27385_en)

[Full adder](https://jutge.org/problems/X12983_en)

[1-bit comparator](https://jutge.org/problems/X60848_en)


<small>*Recorda que per accedir als exercicis i que el **Jutge** valori les teves solucions has d'estar inscrit al [curs](https://jutge.org/courses/JordiCortadella:IntroCircuits)*. Troba totes les instruccions [aqui](../Inici/instruccions.md)</small>

<!-- Aquesta imatge ha d'anar al final de cada lliçó, ja sigui amb aquesta línia o dins la signatura. Deixar comentat si ja està a la signatura-->
<br>
<br>
<img src='../logos/TotsLogosBlanc.png ' alt="Logos Càtedra Chip" width="100%" style="display:block; margin:0 auto; border-radius:8px;"/>



<Autors autors="xcasas fmadrid"/><!-- Posar aquesta imatge al començament de cada lliçó -->
<img src='../logos/illustracio1.png' alt="Circuits digitals" style=" float: left; border-radius:8px; height: 120px; text-align: right;"/>
<img src='../logos/LogoCatedraCHIPBlanc.jpg' alt="Logo Càtedra Chip" style="float: right; border-radius:8px; height: 120px; text-align: right;"/>
<div style="clear: both;"></div>
<br>

# Aritmètica de 4 bits

A continuació tractarem alguns circuits aritmètics que efectuen operacions amb 4 bits. Veurem exemples de sumadors i restadors de 4 bits i una UAL (ALU) molt simple.

## EXEMPLE: Suma de nombres de 4 bits

En aquest exemple veurem com podem sumar dos nombres binaris de 4 bits.
Els sumadors binaris (o *ripple-carry adders*) es poden construir amb sumadors complets (*full adders*) i un semisumador (*half adder*). Al tractar-se d’una suma de 4 bits, haurem d'encadenar 3 sumadors complets i un semisumador, o bé 4 sumadors complets si configurem el primer sumador complet com a semisumador.

[CircuitVerse](https://circuitverse.org/simulator) té un objecte anomenat *adder* que implementa un sumador.

<img src='./circuitelements.png' style="display:block; height:200px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>

<div style="display: flex; justify-content: center; align-items:center; gap: 16px;">
    <img src='./A.png' style="display:block;    width:80px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
    <img src='./B.png' style="display:block;    width:80px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
    <img src='./Cin.png' style="display:block;  width:80px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
    <img src='./Sum.png' style="display:block;  width:80px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
    <img src='./Cout.png' style="display:block; width:80px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
</div>

Les entrades **A** i **B** són les variables que es sumen i **Cin** és el bit de carry d'entrada. Les sortides són **Sum** amb el resultat i **Cout** amb el **carry** de sortida. Si passem el ratolí per les entrades i sortides de l'objecte podem veure el seu nom:


El circuit que efectua la suma concatena 3 sumadors complets i un semisumador:

<img src='./blocsumador4bits.png' alt="Sumador de 4 bits" style="display:block; width:600px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<center><i>Sumador de 4 bits</i></center>

Si convé, podem implementar el mateix circuit amb 4 sumadors complets. La funció del semisumador la pot fer un sumador complet si hi introduim una constant $0$ a la seva entrada $C_{entrada}$.


<img src='./blocsumador4bits_alt.png' alt="Sumador de 4 bits" style="display:block; width:600px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<center><i>Sumador de 4 bits</i></center>

Implementem-ho doncs a CircuitVerse:

<img src='./4fulladdersconcatenats.png' style="display:block; height:400px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<center><i>Sumador de 4 bits a CircuitVerse</i></center>

En aquest exemple els valors d'entrada són:

* Entrada **A** = 0010
* Entrada **B** = 0001

I les sortides:

* Sortida **S = A+B**
* Sortida **Cout** = Carry de sortida

A Jutge.org els exercicis d'àlgebra de 4 bits i àlgebra de n bits utilitzen una nomenclatura de busos $A [3:0]$ (que ja varem definir a [Busos](../CircCombin/busos#notacio)) i unes entrades i sortides de 4 o $n$ bits. Per tal que Jutge pugui validar correctament el circuit que hem dissenyat, haurem de fer ús de la proprietat *BitWidth* de les entrades, sortides i *adders*. Aquest paràmetre es pot veure al menú *properties*:

<div style="display: flex; justify-content: center; align-items:center; gap: 16px;">
    <img src='./A4bit.png' style="display:block; width:200px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
    <img src='./properties.png' style="display:block; width:200px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
</div>

Una vegada hem canviat el *BitWidth* a 4 podem fer la suma amb un únic *adder* i simplificar el circuit.

<img src='./sumaunicadder.png' style="display:block; height:200px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>

Fixa’t que a CircuitVerse les entrades i sortides, al ser de 4 bits, tenen un color de cable negre mentre que $Cin$ i $Cout$, de només 1 bit, són de color verd .


## EXEMPLE: Resta de nombres de 4 bits

Per tal de restar 2 nombres binaris hem d’utilitzar la següent fórmula:

$S= A-B = A+(\bar{B}+1)$

En aquest exemple veurem com es realitza una resta de 4 bits. Considerem les següents variables amb valors exempls:

* Entrada **A**=1100 (o 12​ en decimal)
* Entrada **B**=0101​ (o 5 en decimal​)
* Sortida **S=A-B** (de 4 bits)
* Sortida **Cout** = Carry de sortida


Per fer la resta primer cal negar $B$:

$B= 0101   \rightarrow   \bar{B}=1010$

Després podem realitzar la suma:

$S= A+ \bar{B} +1 = 1100+ 1010+1= 1100 + 1011= 0111$ (7 en decimal)

La taula següent especifica aquesta operació bit a bit (aquesta no és una taula de veritat).

| bit | $A_i$ | $\bar{B_i}$ | $C_i$ | $S_i$ | $C_{sortida}$ |
|:---:|:---:|:---:|:---:|:---:|:---:|
| 0 (LSB)| 0 | 0 | 1 | 1 | 0 |
| 1 | 0 | 1 | 0 | 1 | 0 |
| 2 | 1 | 0 | 0 | 1 | 0 |
| 3 (MSB) | 1 | 1 | 0 | 0 | 1 |

El circuit que efectua la resta també concatena 4 sumadors, però amb la $B$ negada i $C_{entrada}=1$ :
<img src='./blocrestador4bits.png' alt="Restador de 4 bits" style="display:block; width:600px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<center><i>Restador de 4 bits</i></center>

Aquest circuit a CircuitVerse és:

<img src='./restadorambfulladders.png' style="display:block; height:400px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<center><i>Restador de 4 bits</i></center>

Utilitzant un *BitWidth* de 4 simplifiquem el circuit:

<img src='./restadorunicadder.png' style="display:block; height:150px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>


## EXEMPLE: Triar operacions

A més d'efectuar operacions aritmètiques, els circuits aritmètics també poden implementar un circuit que  tria una operació en particular. Les UAL (ALU) són circuits que permeten triar entre diferents operacions en funció d'una variable. Aquest exemple explora aquesta funció.

Volem implementar un circuit que triï entre una suma i una resta en funció d’una variable d'entrada $op$.

Si $op=0$ es farà una suma i si $op=1$ es farà una resta.

Per realitzar la suma de 4 bits de  $A+B$ farem servir un *Adder* amb un *BitWidth* 4. 
El *carry* d'entrada $Cin$ de l’*adder* a de ser 0, per tant hi connectarem un terra o *ground*.

La part del circuit que fa la suma és el següent:

<img src='./triarsuma.png' style="display:block; height:150px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>

Per fer la resta sabem que fer l'operació $S= A-B = A+ \bar{B} +1$. 
Per negar la variable $B$ farem servir una porta NOT de 4 bits. El carry ha de ser igual a 1, $C_{in}=1$, per tant utilitzarem una font o *power*.

Afegint la peça del circuit que fa la resta obtenim:
<img src='./triarsumairesta.png' style="display:block; height:320px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>

Tant *Power* com *Ground* es poden localitzar al menú d’inputs de CircuitVerse. Totes dues funcionen com a una constant. *Power* sempre té el valor 1 i *Ground* sempre té valor 0.

<img src='./poweriground.png' style="display:block; height:320px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>



Ara cal afegir la part del circuit capaç de triar entre una operació o l’altre a partir de la variable d'entrada $op$. Utilitzarem un multiplexor, com el que vàrem veure a l’apartat [Multiplexors](../CircCombin/multiplexors.md) dels circuits combinacionals. Els multiplexors deixen passar un senyal o un altre en funció d'una variable selectora i és això el que ens cal en aquest cas.

El circuit complet, afegint aquest darrer element, és el següent:
<img src='./triarsumasuma.png' style="display:block; height:200px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<center><i>Suma seleccionada</i></center>


<img src='./triarrestaresta.png' style="display:block; height:200px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<center><i>Resta seleccionada</i></center>


Podem emprar un multiplexor amb més de dues entrades per gestionar més de dues operacions possibles.
Dins del menú de propietats del multiplexor a CircuitVerse es pot modificar el nombre d’entrades amb la propietat *control signal size*.

Les UALs (*ALU*) normalment trien entre 4 operacions (multiplexors de 4 entrades) amb un selector $op$ de 2 bits.

<img src='./multiplexor4.png' style="display:block; height:350px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>


## Exercicis a Jutge.org: [Introduction to Digital Circuit Design](https://jutge.org/courses/JordiCortadella:IntroCircuits)

[4-bit adder](https://jutge.org/problems/X64833_en)

[4-bit incrementer](https://jutge.org/problems/X58456_en)

[4-bit adder/subtractor](https://jutge.org/problems/X42916_en)

[4-bit comparator](https://jutge.org/problems/X61860_en)

[4-bit ALU](https://jutge.org/problems/X35448_en)


<small>*Recorda que per accedir als exercicis i que el **Jutge** valori les teves solucions has d'estar inscrit al [curs](https://jutge.org/courses/JordiCortadella:IntroCircuits)*. Troba totes les instruccions [aqui](../Inici/instruccions.md)</small>

<!-- Aquesta imatge ha d'anar al final de cada lliçó, ja sigui amb aquesta línia o dins la signatura. Deixar comentat si ja està a la signatura-->
<br>
<br>
<img src='../logos/TotsLogosBlanc.png ' alt="Logos Càtedra Chip" width="100%" style="display:block; margin:0 auto; border-radius:8px;"/>

<Autors autors="xcasas fmadrid"/><!-- Posar aquesta imatge al començament de cada lliçó -->
<img src='../logos/illustracio1.png' alt="Circuits digitals" style=" float: left; border-radius:8px; height: 120px; text-align: right;"/>
<img src='../logos/LogoCatedraCHIPBlanc.jpg' alt="Logo Càtedra Chip" style="float: right; border-radius:8px; height: 120px; text-align: right;"/>
<div style="clear: both;"></div>
<br>


# Aritmètica de n bits

L’aritmètica de n bits fa referència a circuits digitals que operen amb un nombre de bits que pot ser molt elevat. La variable $n$ representa doncs un nombre arbitrari de bits.

Es poden implementar, com hem vist, sumadors, restadors, comparadors, incrementadors, etc.
Aquí veurem dos exemples, un sumador i un incrementador.
Els exercicis que el curs proposa prenen tots $n=16$.

## EXEMPLE: Sumador de $n=16$ bits
Per fer un sumador de $n$ bits, cal concatenar $n-1$ sumadors complets (full adders) i un semisumador (half adder).

Si volem implementar un sumador de dos nombres binaris $A$ i $B$ de 16 bits, haurem de concatenar 15 sumadors complets i un semisumador com a la figura:

<img src='./blocsumadornbits.png' alt="Sumador de n bits" style="display:block; width:600px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<center><i>Sumador de 16 bits</i></center>

Les entrades seran les variables $A$ i $B$ i les sortides seran la variable suma $S$, més un bit de ròssec (carry) de sortida $C_{out}=0$.

Per tal de simplificar el circuit podriem utilitzar un sumador complet amb una entrada $C_{in}=0$, en lloc d'un semisumador, tal i com hem fet en abans a l’exemple de 4 bits. Per tant podriem implementar un sumador de $n$ bits concatenant $n$ sumadors complets.

En el nostre exemple implementem aquest sumador de 16 bits amb 16 sumadors complets.

<img src='./blocsumadornbits_alt.png' alt="Sumador de n bits només amb sumadors complets " style="display:block; width:600px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<center><i>Sumador de 16 bits</i></center>

El circuit final tindrà la mateixa forma que els exemples que ja hem vist, però en lloc de 4 sumadors concatenats, en tindrà 16. 


## EXEMPLE: Incrementador de n bits

En aquest exemple dissenyarem un incrementador on $n=5$. Aquest circuit incrementarà el valor d’una entrada $A$ de 5 bits en una unitat.


Utilitzarem una constant de valor 00001 en lloc d’una variable. La diferència és subtil dins de [CircuitVerse](https://circuitverse.org/simulator).

CircuitVerse té un element d’entrada (input) anomenat *constant value*. Aquest bloc simula una constant de valor fix. 

<img src='./constantvalue.png' style="display:block; height:320px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>

Al clicar dues vegades al bloc de la constant podem modificar el valor, per exemple el  valor constant $11$ en aquesta figura:


<div style="display: flex; justify-content: center; align-items:center; gap: 16px;">
    <img src='./constantvalue2.png' style="display:block; width:300px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
    <img src='./constantvalue3.png' style="display:block; width:150px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
</div>

Per implementar el circuit incrementador sumi el valor 00001 a una variable $A$, utilitzarem simplement un sumador de 5 bits que sumi aquest bloc de constant a la variable A. 

Prenem per exemple A=01000 en aquesta figura.

<img src='./incrementador5bits.png' style="display:block; height:150px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>

<!-- Obtindríem el mateix resultat a la variable de sortida si empréssim una altra variable com a entrada. La diferència, però és que -->

CircuitVerse no considera un valor constant com a una variable d’entrada en format Verilog. Això vol dir que aquest valor **const_0** forma, de fet, part del circuit incrementador.

<img src='./verilogaritm.png' style="display:block; height:200px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>

## Exercicis a Jutge.org: [Introduction to Digital Circuit Design](https://jutge.org/courses/JordiCortadella:IntroCircuits)

[n-bit adder](https://jutge.org/problems/X84292_en)

[n-bit incrementer](https://jutge.org/problems/X41839_en)

[n-bit adder/subtractor](https://jutge.org/problems/X89356_en)

[n-bit comparator](https://jutge.org/problems/X37457_en)

<small>*Recorda que per accedir als exercicis i que el **Jutge** valori les teves solucions has d'estar inscrit al [curs](https://jutge.org/courses/JordiCortadella:IntroCircuits)*. Troba totes les instruccions [aqui](../Inici/instruccions.md)</small>

<!-- Aquesta imatge ha d'anar al final de cada lliçó, ja sigui amb aquesta línia o dins la signatura. Deixar comentat si ja està a la signatura-->
<br>
<br>
<img src='../logos/TotsLogosBlanc.png ' alt="Logos Càtedra Chip" width="100%" style="display:block; margin:0 auto; border-radius:8px;"/>

<Autors autors="xcasas fmadrid"/><!-- Posar aquesta imatge al començament de cada lliçó -->
<img src='../logos/illustracio1.png' alt="Circuits digitals" style=" float: left; border-radius:8px; height: 120px; text-align: right;"/>
<img src='../logos/LogoCatedraCHIPBlanc.jpg' alt="Logo Càtedra Chip" style="float: right; border-radius:8px; height: 120px; text-align: right;"/>
<div style="clear: both;"></div>
<br>


# Miscel·lània

La secció [Miscellaneous](https://jutge.org/courses/JordiCortadella:IntroCircuits/lists/JordiCortadella:Arithmetic) del curs [Introduction to Digital Circuit Design](https://jutge.org/courses/JordiCortadella:IntroCircuits/lists/JordiCortadella:Arithmetic) inclou diferents exercicis relacionats amb els temes tractats fins ara. Poden ser més complicats que els que hem vist fins ara. T'hi animes?. 

## Exercicis a Jutge.org: [Introduction to Digital Circuit Design](https://jutge.org/courses/JordiCortadella:IntroCircuits)

[Add 7 bits](https://jutge.org/problems/X31534_en)

[Hamming distance](https://jutge.org/problems/X51732_en)

[Accumulator](https://jutge.org/problems/X74712_en)

[Sequential adder](https://jutge.org/problems/X09271_en)

[4-bit multiplier](https://jutge.org/problems/X30847_en)

<small>*Recorda que per accedir als exercicis i que el **Jutge** valori les teves solucions has d'estar inscrit al [curs](https://jutge.org/courses/JordiCortadella:IntroCircuits)*. Troba totes les instruccions [aqui](../Inici/instruccions.md)</small>

<!-- Aquesta imatge ha d'anar al final de cada lliçó, ja sigui amb aquesta línia o dins la signatura. Deixar comentat si ja està a la signatura-->
<br>
<br>
<img src='../logos/TotsLogosBlanc.png ' alt="Logos Càtedra Chip" width="100%" style="display:block; margin:0 auto; border-radius:8px;"/>



<Autors autors="xcasas fmadrid"/>