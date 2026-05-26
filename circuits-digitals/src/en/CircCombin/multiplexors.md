<!-- Posar aquesta imatge al començament de cada lliçó -->
<img src="../../logos/illustracio1.png" alt="Digital circuits" style="float: left; border-radius: 8px; height: 120px;"/>
<img src="../../logos/LogoCatedraCHIPBlanc.jpg" alt="CHIP Chair Logo" style="float: right; border-radius: 8px; height: 120px;"/>
<div style="clear: both;"></div>
<br>



# Multiplexers

In this lesson you will see how multiplexers work and how they are implemented with logic gates.

In electronics, a **multiplexer** (or **MUX**) is a device that selects a signal from among multiple input signals and forwards it to a single output line. In the context of digital circuits, the inputs are digital (bits), although multiplexers for analog signals also exist.

Multiplexers can also be used to implement Boolean functions of multiple variables.

## Example: 2-input Multiplexer

Imagine we have two different data sources, possibly two sensors, and we need a circuit that selects which of these signals will be sent to a processor.

We will design a 2-input multiplexer (in_1, in_2) and 1 output (out). A special input is the **selector** (Sel), responsible for choosing which of the two inputs will be sent to out.

In this example we want:

* When **$Sel = 1$**, the output should be **$in_1$**.
* When **$Sel = 0$**, the output should be **$in_2$**.

First, we construct the truth table with all possible values of the inputs and the selector:

<i>Truth table</i>

| **$in_1$** | **$in_2$** | **$Sel$** | **$out$** |
| ---------- | ---------- | --------- | --------- |
| 0          | 0          | 0         | 0         |
| 0          | 1          | 0         | 1         |
| 1          | 0          | 0         | 0         |
| 1          | 1          | 0         | 1         |
| 0          | 0          | 1         | 0         |
| 0          | 1          | 1         | 0         |
| 1          | 0          | 1         | 1         |
| 1          | 1          | 1         | 1         |

The simplified Boolean expression for the output is:

$$
out = \overline{Sel} \cdot in_2 \;+\; Sel \cdot in_1
$$

Next we draw the associated logic circuit:

<img src="../../CircCombin/multiplexor_exemple.png" alt="example circuit" style="display:block; height:150px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;" />
<center><i>Multiplexer circuit</i></center>

## Jutge.org exercises: [Introduction to Digital Circuit Design]

- [2-input multiplexer](https://jutge.org/problems/X12031_en)
- [Shuffle](https://jutge.org/problems/X07222_en)
- [2-input multiplexer (4-bit wide)](https://jutge.org/problems/X82780_en)
- [4-input multiplexer](https://jutge.org/problems/X45339_en)

<small>*Remember that to access the exercises and for the Judge to evaluate your solutions you must be enrolled in the [course](https://jutge.org/courses/JordiCortadella:IntroCircuits). You will find all instructions [here](../Inici/instruccions.md).*</small>

<!-- This image should go at the end of each lesson, either with this line or within the signature. Leave commented if it is already in the signature-->
<br><br><img src="../../logos/TotsLogosBlanc.png" alt="CHIP Chair Logos" width="100%" style="display:block; margin:0 auto; border-radius:8px;"/>
<Autors autors="xcasas fmadrid"/>
