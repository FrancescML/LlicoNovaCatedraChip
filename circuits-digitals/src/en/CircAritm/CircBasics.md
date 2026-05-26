<!-- Posar aquesta imatge al començament de cada lliçó -->
<img src="../../logos/illustracio1.png" alt="Digital circuits" style="float: left; border-radius: 8px; height: 120px;"/>
<img src="../../logos/LogoCatedraCHIPBlanc.jpg" alt="CHIP Chair Logo" style="float: right; border-radius: 8px; height: 120px;"/>
<div style="clear: both;"></div>
<br>


# Basic circuits

We begin with the most fundamental arithmetic digital circuits, such as half adders, full adders and bit comparators.

## Example: Half Adder

The half adder (Half Adder in English) is the basis of full adders (Full Adders in English) and of n‑bit additions.

We will design a circuit that takes two bits, A and B, and computes:

* the **Sum**, and
* the **Carry**.

The truth table of the function we want to implement is the following:

| $A$ | $B$ | $Sum$ | $Carry$ |
| :-: | :-: | :----: | :-----: |
|  0  |  0  |   0    |   0     |
|  0  |  1  |   1    |   0     |
|  1  |  0  |   1    |   0     |
|  1  |  1  |   0    |   1     |

When $A = B = 1$, the sum overflows, i.e. it cannot be represented with a single output bit. The result of this overflow is the carry bit (carry in English) which is a higher‑order digit.

We can use Karnaugh maps or the rules of Boolean Algebra to derive the two simplified Boolean expressions that describe the circuit's logic:

$$Sum= \bar{A} \cdot B + A \cdot \bar{B}= A \: XOR \: B$$
$$Carry= A \cdot B$$

Thus, the circuit implementing this Half Adder is the following:

<img src='../../CircAritm/halfadder.png' alt="Half Adder circuit" style="display:block; width:250px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;"/>
<center><i>Half Adder circuit</i></center>

This circuit is one of the building blocks for full adders and for n‑bit adders.

## Example: Full Adder

We will design a full adder that sums three input bits: the bits A and B plus an input carry bit $C_{entrada}$. It represents a sum of two bits that takes into account a possible carry bit originating from a previous sum inside a chain of additions.

Its outputs are a sum bit, and an output carry bit $C_{sortida}$.

The truth table of the circuit is:

| $A$ | $B$ | $C_{in}$ | $Sum$ | $C_{out}$ |
|:---:|:---:|:---:|:---:|:---:|
| 0 | 0 | 0 | 0 | 0 |
| 0 | 1 | 0 | 1 | 0 |
| 1 | 0 | 0 | 1 | 0 |
| 1 | 1 | 0 | 0 | 1 |
| 0 | 0 | 1 | 1 | 0 |
| 0 | 1 | 1 | 0 | 1 |
| 1 | 0 | 1 | 0 | 1 |
| 1 | 1 | 1 | 1 | 1 |


We can use Karnaugh maps or Boolean algebra rules to derive the two simplified Boolean expressions that describe the circuit's logic:

$$Suma= A \: XOR \: B \: XOR \: C_{entrada}$$
$$C_{sortida}= A \cdot B + B \cdot C_{entrada} + A \cdot C_{entrada} = A \cdot B + C_{entrada} \cdot (A \: XOR \: B)$$

Thus, the circuit implementing a full adder is the following:

<img src='../../CircAritm/fulladder.png' alt="Full Adder circuit" style="display:block; width:600px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;"/>
<center><i>Full Adder</i></center>

This circuit can be interpreted as two half adders with an OR gate for the output carry:

<img src='../../CircAritm/fulladder_2.png' alt="Full Adder circuit" style="display:block; width:600px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;"/>
<center><i>Full Adder</i></center>

## Example: Comparator

We will design a comparator circuit that takes two bits, A and B, and compares them.

Comparator circuits have 3 outputs: the first indicates if $A$ is greater than $B$, the second is active if $A$ equals $B$, and the third indicates if $A$ is less than $B$.

The truth table is:

| $A$ | $B$ | $Sortie_{A<B}$ | $Sortie_{A=B}$ | $Sortie_{A>B}$ |
| :-: | :-: | :-------------: | :-------------: | :-------------: |
|  0  |  0  |        0        |        1        |        0        |
|  0  |  1  |        1        |        0        |        0        |
|  1  |  0  |        0        |        0        |        1        |
|  1  |  1  |        0        |        1        |        0        |

Simplified expressions:

$$Sortie_{A<B} =\bar{A}B$$
$$Sortie_{A=B} = \bar{A}\bar{B} + A B = A \; XNOR \; B$$
$$Sortie_{A>B} = A \bar{B}$$

Thus, the comparator circuit is the following:

<img src='../../CircAritm/comparador.png' alt="Comparator circuit" style="display:block; width:400px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;"/>
<center><i>Comparator circuit</i></center>

## Example: Multi-bit Adder

With the full adder and half adder you can build larger circuits, such as ripple-carry adders, which permit the addition of binary numbers with multiple bits.

For example, the following four‑bit adder:

<img src='../../CircAritm/blocsumador4bits.png' alt="4-bit adder" style="display:block; width:600px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;"/>
<center><i>4-bit adder</i></center>

## Exercises on Jutge.org: [Introduction to Digital Circuit Design](https://jutge.org/courses/JordiCortadella:IntroCircuits)

- [Half adder](https://jutge.org/problems/X27385_en)
- [Full adder](https://jutge.org/problems/X12983_en)
- [1-bit comparator](https://jutge.org/problems/X60848_en)

<small>*Note that to access the exercises and for the Jutge system to evaluate your solutions you must be enrolled in the course [Introduction to Digital Circuit Design](https://jutge.org/courses/JordiCortadella:IntroCircuits). You will find all the instructions [here](../Inici/instruccions.md).*</small>

<!-- This image should go at the end of each lesson, either with this line or within the signature. Leave commented if it is already in the signature-->
<br><br><img src="../../logos/TotsLogosBlanc.png" alt="CHIP Chair Logos" width="100%" style="display:block; margin:0 auto; border-radius:8px;"/>
<Autors autors="xcasas fmadrid"/>
