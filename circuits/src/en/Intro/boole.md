<!-- Posar aquesta imatge al començament de cada lliçó -->
<img src="../../logos/illustracio1.png" alt="Digital circuits" style="float: left; border-radius: 8px; height: 120px;"/>
<img src="../../logos/LogoCatedraCHIPBlanc.jpg" alt="CHIP Chair Logo" style="float: right; border-radius: 8px; height: 120px;"/>
<div style="clear: both;"></div>
<br>



# Introduction to Boolean Algebra

Boolean algebra was created by George Boole in the 19th century, but engineers soon saw that it was perfect for electronics, where its function is to describe and simplify circuits.

Boolean algebra, also known as Boolean algebra, is an algebraic structure that uses variables and logical operations. Its variables can only take two values, traditionally called true and false, represented as 1 and 0 respectively.

In digital electronics these two values correspond directly to the electrical states of digital circuits: a high voltage (1) or a low voltage (0). Therefore Boolean algebra can be used to describe the logical operations of digital circuits.

* **Foundation of Computation**: Boolean algebra is a fundamental tool for the analysis and design of digital circuits and is the basis of modern computational arithmetic.

* **Analysis**: Helps to understand how an existing circuit operates, allowing its output to be determined from given inputs.

* **Design**: Provides a systematic method for designing digital circuits that perform a specific function (for example, an adder, a comparator or a multiplexer).

* **Optimization**: Allows simplifying complex logical expressions. This directly translates into simpler digital circuits, which will consume less power and be faster and more reliable.

## Boolean Operators

Boolean algebra uses three fundamental operators. Logical gates correspond directly to them and bear the same names. Boolean operators can be represented in different ways depending on the application area: mathematics, electronics or programming.

### **NOT**:
The NOT operator is also called negation or logical inversion. For a Boolean variable $A$, it is expressed with the symbol "$\overline{\quad}$" over the variable, with the symbol "$\neg$" or with an apostrophe "$'$".  
$\overline{A}$ or also $\neg A$ or $A'$

The truth table corresponds to the NOT gate. The output is the opposite value of the input.

|$A$| $\overline{A}$ |
|---|:-----:|
| 0 | 1 |
| 1 | 0 |


### **OR**:
The OR operator is also called addition or logical disjunction. For example, for the Boolean variables $A$ and $B$ it is expressed with the symbol "$+$". $A+B$ or also $A \lor B$

The truth table corresponds to the OR gate. The output is $1$ if any of the inputs is $1$.

|$A$|$B$| $A+B$ |
|---|---|:-----:|
| 0 | 0 | 0 |
| 0 | 1 | 1 |
| 1 | 0 | 1 |
| 1 | 1 | 1 |

### **AND**:
The AND operator is also called multiplication or logical conjunction. For example, for the Boolean variables $A$ and $B$ it is expressed with the symbol "$·$" or by simple juxtaposition. $A·B$ or also $AB$ or $A \land B$

The truth table corresponds to the AND gate. The output is $1$ only if all inputs are $1$.

|$A$|$B$| $AB$ |
|---|---|:-----:|
| 0 | 0 | 0     |
| 0 | 1 | 0     |
| 1 | 0 | 0     |
| 1 | 1 | 1     |

## Operator Precedence

The precedence of Boolean operations is as follows (highest priority first):
1. Parentheses
2. NOT
3. AND
4. OR



## Fundamental Postulates or Boole's Axioms
Boole's postulates are basic rules, accepted truths on which Boole's algebra is built.

**Properties of Logical OR**

$A + 0 = A$ &emsp;&emsp;&emsp; *0 is the identity element of logical OR*

$A + 1 = 1$

$A + \bar{A} = 1$

$A + A = A$ &emsp;&emsp;&emsp; *Idempotence Law*

**Properties of Logical AND**

$A · 1 = A$ &emsp;&emsp;&emsp; *1 is the identity element of logical multiplication*

$A · 0 = 0$

$A · \bar{A} = 0$

$A · A = A$ &emsp;&emsp;&emsp; *Idempotence Law*

**Properties of Negation**

$\bar{0} = 1$

$\bar{1} = 0$

$\overline{\overline{A}} = A$

**Commutative Property:** The order of the variables does not affect the result.
* $A + B = B + A$
* $A · B = B · A$

**Associative Property:** In operations with more than two variables, the way the operations are grouped does not affect the result.
* $(A + B) + C = A + (B + C)$
* $(A · B) · C = A · (B · C)$

**Distributive Property:** Logical multiplication distributes over logical addition.
* $A · (B + C) = (A · B) + (A · C)$

**Note!** Unlike traditional algebra, logical addition distributes over logical multiplication.
* $A + (B · C) = (A + B) · (A + C)$

**Absorption Laws:**
* $A + (A · B) = A$
* $A · (A + B) = A$

**De Morgan's Laws:** Very important for simplification.
* $\overline{A + B} = \bar{A} · \bar{B}$
* $\overline{A · B} = \bar{A} + \bar{B}$

**Some derived properties:**
* $A + \bar{A}·B = A + B$
* $A(\bar{A} + B) = A·B$


## Boolean Functions
A Boolean function is an application that assigns to input Boolean variables an output in the form of a Boolean variable.

This function can be represented in different ways; with a Boolean expression, a truth table, a Karnaugh map, or with a digital combinational circuit. On this basis you will be able to simplify expressions, design logical functions and increasingly complex digital systems.

Simplifying a Boolean function means finding an equivalent expression with the smallest possible number of terms and variables. This allows building the circuit with fewer logic gates. To simplify, the laws and properties seen above are used, or Karnaugh maps.



<!-- This image should go at the end of each lesson, either with this line or within the signature. Leave commented if it is already in the signature-->
<br><br><img src="../../logos/TotsLogosBlanc.png" alt="CHIP Chair Logos" width="100%" style="display:block; margin:0 auto; border-radius:8px;"/>
<Autors autors="xcasas fmadrid"/>
