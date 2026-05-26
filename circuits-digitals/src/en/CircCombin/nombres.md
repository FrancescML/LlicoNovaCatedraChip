<!-- Posar aquesta imatge al començament de cada lliçó -->
<img src="../../logos/illustracio1.png" alt="Digital circuits" style="float: left; border-radius: 8px; height: 120px;"/>
<img src="../../logos/LogoCatedraCHIPBlanc.jpg" alt="CHIP Chair Logo" style="float: right; border-radius: 8px; height: 120px;"/>
<div style="clear: both;"></div>
<br>


# Numbers

In digital circuits, numbers are implemented in **binary notation** and all mathematical operations - addition, subtraction, comparison, multiplication, division or modulo - are performed by manipulating bits.

## Example: Even or Odd Number

We will design a circuit that receives a 4-bit input number and activates the output ($Parell=1$) when the input number is **even**.

A binary number is even if its **least significant bit (LSB)** has the value 0.

We define the input variable:

$$nombre[3:0] = [nombre_3\ nombre_2\ nombre_1\ nombre_0]$$

The least significant bit is $nombre_0$.

The output is a single bit:
- $Parell = 1$ if the number is even.
- $Parell = 0$ if the number is odd.

Partial example table (the complete one would have 16 rows):

|**$nombre$**|**Number in decimal**|$nombre_0$ (LSB)|Parity| $Parell$|
|:---:|:---:|:---:|:---|:---:|
| 0000 | 0  | 0 | Even | 1 |
| 0001 | 1  | 1 | Odd  | 0 |
| 0010 | 2  | 0 | Even | 1 |
| 0011 | 3  | 1 | Odd  | 0 |
| 1110 | 14 | 0 | Even | 1 |
| 1111 | 15 | 1 | Odd  | 0 |


Building the circuit is fairly straightforward; the output Parell must be activated (value 1) if and only if nombre[0] has the value 0, regardless of the value of the remaining bits of nombre.

Therefore, the output is the negation of $nombre_0$.

$$Parell = \overline{nombre_0}$$

Thus, only a single NOT gate is required.

<img src="../../CircCombin/nombres_exemple1.png" alt="Parity circuit" style="display:block; height:130px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;"/>
<center><i>Circuit that determines the parity of a number</i></center>

## Example: Modulo 7 of a 4-bit number

We will design a circuit that computes the modulo 7 of a binary number $n$, of 4 bits. Computing modulo 7 of a number consists of finding the remainder when it is divided by 7. The notation for this operation is:

$$residu = n \bmod 7$$

A 4-bit number $n[3:0]=[n_3 \; n_2 \; n_1 \; n_0]$ can take 16 different values from 0000 to 1111 (0 to 15 in decimal).

The remainders after dividing a number by 7 can take values from 0 to 6. To represent the result of the operation, a 3-bit number will suffice, which can take values from 000 to 111 (0 to 7 in decimal).

$$residu[2:0] = [residu_2 \ residu_1\ residu_0]$$

The first step in designing this circuit is to create the **complete truth table** that relates each 4-bit input $n[3:0]$ to its corresponding 3-bit remainder $residu[2:0]$.

$residu[2:0] = n[3:0] \mod 7$

| $n$ (decimal) | $n_3 \; n_2 \; n_1 \; n_0$ | $residu$ (decimal) | $residu_2 \; residu_1 \; residu_0$ |
|---|---|---|---|
| 0  | 0000 | 0 | 000 |
| 1  | 0001 | 1 | 001 |
| 2  | 0010 | 2 | 010 |
| 3  | 0011 | 3 | 011 |
| 4  | 0100 | 4 | 100 |
| 5  | 0101 | 5 | 101 |
| 6  | 0110 | 6 | 110 |
| 7  | 0111 | 0 | 000 |
| 8  | 1000 | 1 | 001 |
| 9  | 1001 | 2 | 010 |
| 10 | 1010 | 3 | 011 |
| 11 | 1011 | 4 | 100 |
| 12 | 1100 | 5 | 101 |
| 13 | 1101 | 6 | 110 |
| 14 | 1110 | 0 | 000 |
| 15 | 1111 | 1 | 001 |


For each output ($residu_0$, $residu_1$, $residu_2$) a Karnaugh map with 4 variables is built to obtain its simplified Boolean expression.

### Output $residu_0$
We construct the Karnaugh map for the 4 input variables for the output residue_0 and identify 3 groups.

<!-- GREEN -->
<table style="border-collapse: collapse; text-align: center;">
  <thead>
    <tr>
      <th style="border: 1px solid #ccc; position: relative; width: 60px; height: 60px;">
        <div style="position: absolute; top: 5px; right: 5px;">   n1 n0 </div>
        <div style="position: absolute; bottom: 5px; left: 5px;"> n3 n2 </div>
        <div style="position: absolute; bottom: 0; left: 0; width: 100%; height: 1px; background: #ccc; transform-origin: top right; transform: rotate(+45deg);"></div>
      </th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">00</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">01</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">11</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">10</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">00</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightgreen;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">01</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightgreen;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">11</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightgreen;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">10</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightgreen;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
    </tr>
  </tbody>
</table>

<!-- RED -->
<table style="border-collapse: collapse; text-align: center;">
  <thead>
    <tr>
      <th style="border: 1px solid #ccc; position: relative; width: 60px; height: 60px;">
        <div style="position: absolute; top: 5px; right: 5px;">   n1 n0 </div>
        <div style="position: absolute; bottom: 5px; left: 5px;"> n3 n2 </div>
        <div style="position: absolute; bottom: 0; left: 0; width: 100%; height: 1px; background: #ccc; transform-origin: top right; transform: rotate(+45deg);"></div>
      </th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">00</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">01</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">11</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">10</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">00</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: red;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: red;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">01</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: red;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: red;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">11</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">10</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: red;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: red;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
    </tr>
  </tbody>
</table>

The simplified Boolean expression for residue_0 will have 3 terms:

$$residu_0 = \overline{n_1}n_0 + \overline{n_3}n_0 + \overline{n_2}n_0$$

### Output $residu_1$
We build the Karnaugh map for the 4 input variables for the output residue_1 and identify 2 groups.

<!-- RED -->
<table style="border-collapse: collapse; text-align: center;">
  <thead>
    <tr>
      <th style="border: 1px solid #ccc; position: relative; width: 60px; height: 60px;">
        <div style="position: absolute; top: 5px; right: 5px;">   n1 n0 </div>
        <div style="position: absolute; bottom: 5px; left: 5px;"> n3 n2 </div>
        <div style="position: absolute; bottom: 0; left: 0; width: 100%; height: 1px; background: #ccc; transform-origin: top right; transform: rotate(+45deg);"></div>
      </th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">00</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">01</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">11</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">10</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">00</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: red;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: red;">1 </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">01</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: red;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: red;">1 </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">11</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">10</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1 </td>
    </tr>
  </tbody>
</table>

<!-- BLUE -->
<table style="border-collapse: collapse; text-align: center;">
  <thead>
    <tr>
      <th style="border: 1px solid #ccc; position: relative; width: 60px; height: 60px;">
        <div style="position: absolute; top: 5px; right: 5px;">   n1 n0 </div>
        <div style="position: absolute; bottom: 5px; left: 5px;"> n3 n2 </div>
        <div style="position: absolute; bottom: 0; left: 0; width: 100%; height: 1px; background: #ccc; transform-origin: top right; transform: rotate(+45deg);"></div>
      </th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">00</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">01</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">11</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">10</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">00</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightblue;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightblue;">1 </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">01</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1 </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">11</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">10</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightblue;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightblue;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
    </tr>
  </tbody>
</table>

Aquesta expressió booleana simplified for residue_1 tindrà 2 termes:

$$residu_1 = \overline{n_3}n_1 + \overline{n_2}n_1$$

### Output $residu_2$
For the output residue_2, identify 2 groups on its Karnaugh map.

<!-- RED -->
<table style="border-collapse: collapse; text-align: center;">
  <thead>
    <tr>
      <th style="border: 1px solid #ccc; position: relative; width: 60px; height: 60px;">
        <div style="position: absolute; top: 5px; right: 5px;">   n1 n0 </div>
        <div style="position: absolute; bottom: 5px; left: 5px;"> n3 n2 </div>
        <div style="position: absolute; bottom: 0; left: 0; width: 100%; height: 1px; background: #ccc; transform-origin: top right; transform: rotate(+45deg);"></div>
      </th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">00</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">01</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">11</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">10</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">00</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">01</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: red;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: red;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1 </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">11</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: red;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: red;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">10</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
    </tr>
  </tbody>
</table>


<!-- BLUE -->
<table style="border-collapse: collapse; text-align: center;">
  <thead>
    <tr>
      <th style="border: 1px solid #ccc; position: relative; width: 60px; height: 60px;">
        <div style="position: absolute; top: 5px; right: 5px;">   n1 n0 </div>
        <div style="position: absolute; bottom: 5px; left: 5px;"> n3 n2 </div>
        <div style="position: absolute; bottom: 0; left: 0; width: 100%; height: 1px; background: #ccc; transform-origin: top right; transform: rotate(+45deg);"></div>
      </th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">00</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">01</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">11</th>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">10</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">00</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightblue;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightblue;">0 </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">01</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightblue;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightblue;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightblue;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightblue;">1 </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">11</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">10</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightblue;">1 </td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightblue;">1 </td>
    </tr>
  </tbody>en | 1 |
| 1111 | 15 | 1 | Odd  | 0 |


</table>

Thus, the simplified Boolean expression for residue_2 will have 2 terms:

$$residu_2 = n_2\overline{n_1} + \overline{n_3}n_2$$


From these three expressions we can use logic gates to create the digital circuit that will implement the function $n \bmod{7}$.

<img src="../../CircCombin/nombres_exemple2.png" alt="Circuit modulo 7" style="display:block; height:500px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;"/>
<center><i>Digital circuit that implements the function $n \bmod 7$</i></center>

## Exercises on Jutge.org: [Introduction to Digital Circuit Design]

- [Even number](https://jutge.org/problems/X36253_en)
- [Prime number](https://jutge.org/problems/X07160_en)
- [Maximum of two numbers](https://jutge.org/problems/X37473_en)
- [Remainder modulo 7](https://jutge.org/problems/X91814_en)

<small>*Remember that to access the exercises and for the Jutge judge to evaluate your solutions you must be enrolled in the [course](https://jutge.org/courses/JordiCortadella:IntroCircuits). You will find all the instructions [here](../Inici/instruccions.md).*</small>

<!-- This image should go at the end of each lesson, either with this line or within the signature. Leave commented if it is already in the signature-->
<br><br><img src="../../logos/TotsLogosBlanc.png" alt="CHIP Chair Logos" width="100%" style="display:block; margin:0 auto; border-radius:8px;"/>
<Autors autors="xcasas fmadrid"/>
