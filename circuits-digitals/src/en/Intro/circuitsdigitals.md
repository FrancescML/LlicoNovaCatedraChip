<!-- Posar aquesta imatge al començament de cada lliçó -->
<img src="../../logos/illustracio1.png" alt="Digital circuits" style="float: left; border-radius: 8px; height: 120px;"/>
<img src="../../logos/LogoCatedraCHIPBlanc.jpg" alt="CHIP Chair Logo" style="float: right; border-radius: 8px; height: 120px;"/>
<div style="clear: both;"></div>
<br>



# Introduction to digital circuits

In these lessons you will learn what digital circuits are and their different types. You will find examples and exercises to understand combinational circuits, sequential circuits, and arithmetic circuits.

The **digital circuits** process information represented in binary format, which uses only two electrical states: low voltage and high voltage, which represent binary values 0 and 1. The fundamental components of digital circuits are logic gates. These are the basis of microprocessors, memories, controllers, and any other complex digital circuit.

The **logic gates** are small circuits that perform basic logical operations on one or more binary input signals and produce a single binary output signal. To use logic gates and create digital circuits, you need to understand Boolean algebra concepts and truth tables. In many examples and exercises in digital circuits we will use truth tables or a Boolean expression to describe the logical behaviour of a circuit.

|**Logic gate**|**Symbol** |**Logical Expression** |**Description**|
|------          |------     |:---:                |------        |
|Buffer |<img src="../../Intro/Buffer_ANSI_Labelled.png" style="background-color:white; height:80px;"/>   |$A$                        |Returns the same bit|
|NOT    |<img src="../../Intro/NOT_ANSI_Labelled.png" style="background-color:white; height:80px;"/>      |$\bar{A}$                  |Inverts the bit|
|AND    |<img src="../../Intro/AND_ANSI_Labelled.png" style="background-color:white; height:80px;"/>      |$A·B$                      |1 if both inputs are 1|
|OR     |<img src="../../Intro/OR_ANSI_Labelled.png" style="background-color:white; height:80px;"/>       |$A+B$                      |1 if at least one input is 1|
|NAND   |<img src="../../Intro/NAND_ANSI_Labelled.png" style="background-color:white; height:80px;"/>     |$\overline{A·B}$           |AND inverted (AND followed by NOT)|
|NOR    |<img src="../../Intro/NOR_ANSI_Labelled.png" style="background-color:white; height:80px;"/>      |$\overline{A+B}$           |OR inverted (OR followed by NOT)|
|XOR    |<img src="../../Intro/XOR_ANSI_Labelled.png" style="background-color:white; height:80px;"/>      |$A·\bar{B}+\bar{A}·B$      |1 if the inputs are different|
|XNOR   |<img src="../../Intro/XNOR_ANSI_Labelled.png" style="background-color:white; height:80px;"/>     |$(A·B)+(\bar{A}·\bar{B})$  |1 if the inputs are equal|


<br>

The basic logic gates are AND, OR, and NOT. A **truth table** shows all possible input combinations for a logic circuit or Boolean function, and the corresponding output for each of those combinations.

A [**combinational circuit**](../CircCombin/intro.md) is a type of digital circuit in which the value of its output at any moment depends solely on the current values of its inputs. Built only with simple logic gates, they have no feedback or memory. Their behaviour can be described with truth tables and Boolean functions.

<img src='../../Intro/combinacional.png' alt="Combinational circuit" style="display:block; width:500px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;"/>
<center><i>Combinational circuit</i></center>

The [**arithmetic circuits**](../CircAritm/intro.md) are an important subclass of digital circuits that are combinational. Their function is to perform basic mathematical operations on binary numbers.

<img src='../../Intro/aritmetic.png' alt="Arithmetic circuit" style="display:block; width:400px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;"/>
<center><i>This example is an arithmetic circuit: an adder</i></center>

The [**sequential circuits**](../CircSeq/intro.md) are a type of digital circuit that, unlike combinational or arithmetic circuits, incorporate feedback and have memory. Consequently, their output depends not only on the current inputs but also on their previous state or input history. Many of them use a clock to coordinate state changes.

<img src='../../Intro/sequencial.png' alt="Sequential circuit" style="display:block; width:500px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;"/>
<center><i>Sequential circuit</i></center>

The lesson [**Tiny Micro**](../TinyMicro/intro.md) is a collection of advanced exercises on the operation of a small computer.

<!-- This image should go at the end of each lesson, either with this line or within the signature. Leave commented if it is already in the signature-->
<br><br><img src="../../logos/TotsLogosBlanc.png" alt="CHIP Chair Logos" width="100%" style="display:block; margin:0 auto; border-radius:8px;"/>
<Autors autors="xcasas fmadrid"/>
