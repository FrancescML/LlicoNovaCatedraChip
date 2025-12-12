<!-- Posar aquesta imatge al començament de cada lliçó -->
<img src='../logos/illustracio1.png' alt="Circuits digitals" style="float: left; border-radius: 8px; height: 120px;"/>
<img src='../logos/LogoCatedraCHIPBlanc.jpg' alt="Logo Càtedra Chip" style="float: right; border-radius: 8px; height: 120px;"/>
<div style="clear: both;"></div>
<br>


# Aritmètica de n bits

L’aritmètica de $n$ bits fa referència a circuits digitals que operen amb un nombre arbitrari de bits. La variable $n$ pot ser un valor elevat, com $n=16$ als exercicis del curs.
Es poden implementar sumadors, restadors, comparadors, incrementadors, etc.
Aquí veurem dos exemples: un **sumador** i un **incrementador**.

---

## EXEMPLE: Sumador de $n = 16$ bits

Per fer un sumador de $n$ bits, cal concatenar **$n-1$ sumadors complets** (*full adders*) i **un semisumador** (*half adder*).
Així, per sumar dos nombres binaris $A$ i $B$ de 16 bits, concatenarem 15 sumadors complets i un semisumador:

<img src='./blocsumadornbits.png' alt="Sumador de n bits" style="display:block; width:600px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;"/>
<center><i>Sumador de 16 bits</i></center>

Les entrades són $A$ i $B$. Les sortides són:

* la variable **suma** $S$ (16 bits), i
* el bit de ròssec (**carry**) de sortida $C_{out}$.

Per simplificar el circuit podem utilitzar sumadors complets a totes les etapes, amb $C_{in} = 0$ al primer sumador. Igual que passava amb els sumadors de 4 bits, un sumador complet pot fer la funció d’un semisumador si $C_{in} = 0$.

<img src='./blocsumadornbits_alt.png' alt="Sumador de n bits només amb sumadors complets" style="display:block; width:600px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;"/>
<center><i>Sumador de 16 bits implementat amb sumadors complets</i></center>

El circuit final tindrà la mateixa estructura que els sumadors de 4 bits, però amb 16 blocs concatenats en lloc de 4.

## EXEMPLE: Incrementador de $n$ bits

Dissenyarem un incrementador de **$n = 5$ bits**. Aquest circuit incrementa el valor d’una entrada binària $A$ en una unitat.

Per fer-ho, sumarem a $A$ el valor binari:

$$00001$$

En aquest cas, en lloc d’una variable utilitzem una **constant**. A [CircuitVerse](https://circuitverse.org/simulator) hi ha un bloc d’entrada anomenat *constant value*, que permet definir un valor fix.

<img src='./constantvalue.png' alt="Bloc de constant" style="display:block; height:320px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;"/>

En fer doble clic sobre el bloc, podem especificar el valor de la constant, com en aquests exemples:

<div style="display: flex; justify-content: center; align-items:center; gap: 16px;">
    <img src='./constantvalue2.png' style="display:block; width:300px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;"/>
    <img src='./constantvalue3.png' style="display:block; width:150px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;"/>
</div>

Per implementar l’incrementador, simplement sumarem la constant 00001 a la variable $A$ amb un sumador de 5 bits.
Per exemple, si $A = 01000$:

<img src='./incrementador5bits.png' alt="Incrementador de 5 bits" style="display:block; height:150px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;"/>

CircuitVerse no considera el valor constant com una variable d’entrada en format Verilog.
Això significa que el bloc **const_0** forma part del circuit incrementador, i no una entrada externa:

<img src='./verilogaritm.png' alt="Codi Verilog" style="display:block; height:200px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;"/>


## Exercicis a Jutge.org: [Introduction to Digital Circuit Design](https://jutge.org/courses/JordiCortadella:IntroCircuits)

* [n-bit adder](https://jutge.org/problems/X84292_en)
* [n-bit incrementer](https://jutge.org/problems/X41839_en)
* [n-bit adder/subtractor](https://jutge.org/problems/X89356_en)
* [n-bit comparator](https://jutge.org/problems/X37457_en)

<small>*Recorda que per accedir als exercicis i que el **Jutge** valori les teves solucions has d'estar inscrit al [curs](https://jutge.org/courses/JordiCortadella:IntroCircuits)*. Troba totes les instruccions [aqui](../Inici/instruccions.md)</small>

<!-- Aquesta imatge ha d'anar al final de cada lliçó, ja sigui amb aquesta línia o dins la signatura. Deixar comentat si ja està a la signatura-->
<br>
<br>
<img src='../logos/TotsLogosBlanc.png ' alt="Logos Càtedra Chip" width="100%" style="display:block; margin:0 auto; border-radius:8px;"/>

<Autors autors="xcasas fmadrid"/>