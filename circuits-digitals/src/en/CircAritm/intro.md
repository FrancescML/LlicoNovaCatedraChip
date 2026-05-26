<!-- Posar aquesta imatge al començament de cada lliçó -->
<img src="../../logos/illustracio1.png" alt="Digital circuits" style="float: left; border-radius: 8px; height: 120px;"/>
<img src="../../logos/LogoCatedraCHIPBlanc.jpg" alt="CHIP Chair Logo" style="float: right; border-radius: 8px; height: 120px;"/>
<div style="clear: both;"></div>
<br>



# Introduction to Arithmetic Circuits

Arithmetic circuits are a fundamental subclass of **combinational digital circuits**. Their main function is to perform mathematical operations on binary numbers.

The most common basic operations implemented are:

**Half Adder**: Circuit that adds two bits and produces a sum output $S$ and a carry bit $C$.

<img src="../../CircAritm/blochalfadder.png" alt="Half Adder" style="display:block; width:200px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;" />
<center><i>Half Adder</i></center>

**Full Adder**: Adds three bits (two inputs and the carry from the previous stage). It is the basic block for constructing multi-bit adders by cascading.

<img src="../../CircAritm/blocfulladder.png" alt="Full Adder" style="display:block; width:200px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;" />
<center><i>Full Adder</i></center>

**N-bit Adder**: 
With half adders and full adders you can build adders of $n$ bits. This circuit performs the binary addition of two numbers $A$ and $B$.

<img src="../../CircAritm/blocsumador4bits.png" alt="4-bit Adder" style="display:block; width:600px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;" />
<center><i>4-bit Adder</i></center>


**Subtractor**: 
Binary subtraction is usually implemented using adders and the representation in **two's complement**.
Thus, the subtraction $A - B$ is transformed into the sum:

$$A + (-B)$$

<img src="../../CircAritm/blocrestador4bits.png" alt="4-bit Subtractor" style="display:block; width:600px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;" />
<center><i>4-bit Subtractor</i></center>

**Comparators**:
Circuits that determine whether a binary number is **greater**, **less** or **equal** to another.

<img src="../../CircAritm/bloccomparador.png" alt="Comparator" style="display:block; width:200px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;" />
<center><i>Comparator</i></center>

**Multipliers and Dividers**:
More complex circuits that are implemented using algorithms based on repeated additions and shifts.

<img src="../../CircAritm/blocmultiplicador.png" alt="Multiplier" style="display:block; width:200px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;" />
<center><i>Multiplier</i></center>

Arithmetic circuits form the core of the **Arithmetic-Logic Units (ALU)**, the heart of any microprocessor.
The ALU is responsible for executing both the arithmetic operations and the logical operations required for program execution.


The Arithmetic Logic Unit (**ALU**) is known in English as the ALU.

<img src="../../CircAritm/ALU.png" alt="ALU" style="display:block; width:400px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;" />
<center><i>Arithmetic Logic Unit (ALU)</i></center>

## Contents of the Lesson

* In the topic [**Basic Circuits**](./CircBasics.md) the half adder, the full adder and the comparators are presented.
* In the topic [**4-bit Arithmetic**](./Aritm4bits.md) incrementers, 4-bit adders and an ALU example are covered.
* In the topic [**n-bit Arithmetic**](./Aritmnbits.md) incrementers, adders and comparators are generalised for $n$ bits.
* Finally, in the [Miscellany](./miscellania.md) topic more advanced exercises are gathered, such as multipliers, bit accumulators and sequential circuits and adders.

<!-- This image should go at the end of each lesson, either with this line or within the signature. Leave commented if it is already in the signature-->
<br><br><img src="../../logos/TotsLogosBlanc.png" alt="CHIP Chair Logos" width="100%" style="display:block; margin:0 auto; border-radius:8px;"/>
<Autors autors="xcasas fmadrid"/>
