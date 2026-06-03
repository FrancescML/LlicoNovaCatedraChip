<!-- Posar aquesta imatge al començament de cada lliçó -->
<img src="../../logos/illustracio1.png" alt="Digital circuits" style="float: left; border-radius: 8px; height: 120px;"/>
<img src="../../logos/LogoCatedraCHIPBlanc.jpg" alt="CHIP Chair Logo" style="float: right; border-radius: 8px; height: 120px;"/>
<div style="clear: both;"></div>
<br>


# Buses

In digital circuits, a **bit bus** (or simply *bus*) is a set of communication lines that carry data bits in parallel. It is used to interconnect different components of a system by transferring digital signals.

Bit shifting is a fundamental operation in data processing of a bus. It consists of moving all the bits of a register (or binary word) to the left or to the right.

## Notation

In this section we will work with variables that represent binary numbers of $N$ bits. To refer to a variable, we will use notation such as $A[3:0]$, which describes a set of 4 bits named $A$.

The range $[3:0]$ specifies that the bits are indexed from 3 down to 0. This variable can be decomposed into its individual bits:

$$A = A[3:0] = [A_3\ A_2\ A_1\ A_0]$$

Where $A_3$ is the most significant bit (MSB) and $A_0$ is the least significant bit (LSB). This notation allows us to refer to both the complete set ($A$) and to each of its bits ($A_i$).

## Example: Designing a 4-bit left-shift bus circuit

Suppose we work with binary data and need to move all the bits of a sequence one position to the left.

For example, 1010 binary is 10 in decimal:

$$1010_2 = 10_{10}$$

If we shift left by one position we obtain 10100, which is equivalent to multiplying its value by 2.

$$10100_2 = 20_{10}$$


A complete truth table for a high-number-of-bits $N$ is infeasible (it would have $2^N$ rows). We will focus on a case of $N=4$ bits, where the table is still manageable.

The following shows the truth table of a left-shifting circuit. The input is $A[3:0] = [A_3 A_2 A_1 A_0]$ and the output is $B[3:0] = [B_3 B_2 B_1 B_0]$.

| **Input $A$** | **Output $B$** |
|:---:|:---:|
|0000|0000|
|0001|0010|
|0010|0100|
|0011|0110|
|0100|1000|
|0101|1010|
|0110|1100|
|0111|1110|
|1000|0000|
|1001|0010|
|1010|0100|
|1011|0110|
|1100|1000|
|1101|1010|
|1110|1100|
|1111|1110|

Our objective is to design a 4-bit shift circuit. We have two options:

* Use [multiplexers](./multiplexors.md), which are [combinational circuits](../CircCombin/intro.md): This is the most common and flexible form for fixed or controlled shifts.

* Use shift registers, which are [sequential circuits](../CircSeq/intro.md) and suitable for sequential shifts synchronised with a clock.

In this section we will use multiplexers. The circuit is the following:

<img src="../../CircCombin/bus_exemple.png" alt="Left-shift circuit" style="display:block; height:400px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;"/>
<center><i>Digital circuit that shifts one position to the left</i></center>

The control signal $Sel$ determines whether the shift is performed:

* If $Sel = 0$, the output is equal to the input (no shifting).
* If $Sel = 1$, the multiplexers perform a left shift by one position.

For each output bit $B_i$, we will use a 2-to-1 multiplexer:

* **MUX for $B_3$**
  * Input 0: $A_3$
  * Input 1: $A_2$
  * Output: $B_3$
* **MUX for $B_2$**
  * Input 0: $A_2$
  * Input 1: $A_1$
  * Output: $B_2$
* **MUX for $B_1$**
  * Input 0: $A_1$
  * Input 1: $A_0$
  * Output: $B_1$
* **MUX for $B_0$**
  * Input 0: $A_0$
  * Input 1: $0$ (input bit)
  * Output: $B_0$



## Exercises on Jutge.org: [Introduction to Digital Circuit Design](https://jutge.org/courses/JordiCortadella:IntroCircuits)

- [Bus invert](https://jutge.org/problems/X29475_en)
- [Bus transfer or invert](https://jutge.org/problems/X00341_en)
- [Shift left](https://jutge.org/problems/X26035_en)
- [Shift left or right](https://jutge.org/problems/X25794_en)

<small>*Remember that to access the exercises and for the **Judge** to evaluate your solutions you must be enrolled in the [course](https://jutge.org/courses/JordiCortadella:IntroCircuits). You will find all the instructions [here](../Inici/instruccions.md).*</small>

<!-- This image should go at the end of each lesson, either with this line or within the signature. Leave commented if it is already in the signature-->
<br><br><img src="../../logos/TotsLogosBlanc.png" alt="CHIP Chair Logos" width="100%" style="display:block; margin:0 auto; border-radius:8px;"/>
<Autors autors="xcasas fmadrid"/>
