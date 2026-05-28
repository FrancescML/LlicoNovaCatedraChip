<!-- Posar aquesta imatge al començament de cada lliçó -->
<img src="../../logos/illustracio1.png" alt="Digital circuits" style="float: left; border-radius: 8px; height: 120px;"/>
<img src="../../logos/LogoCatedraCHIPBlanc.jpg" alt="CHIP Chair Logo" style="float: right; border-radius: 8px; height: 120px;"/>
<div style="clear: both;"></div>
<br>


# Voting systems

In the context of digital circuits, voting systems refer to electronic or logical implementations designed to process multiple inputs and determine a result based on a majority rule or predefined logic.

## Example: Committee voting system

We will design an electronic voting system for the Executive Committee of a football team. This committee has four members: the President, the Secretary, the Treasurer, and the Vocal. Each may vote **Yes** (1) or **No** (0).

The **approval rules** are:

1. A proposal is approved when **three or more members** vote in favour.
2. In case of a tie (2 in favour and 2 against), the **President's** vote decides. If the President votes "Yes", the proposal is approved; if he votes "No", it is rejected.

We will design a logic circuit with four inputs ($P$, $S$, $T$, $V$) and one output ($A$) that indicates whether the proposal is approved.

Define the **input variables** ($1$ means "Yes", $0$ means "No"):

* $P$: vote of the President
* $S$: vote of the Secretary
* $T$: vote of the Treasurer
* $V$: vote of the Vocal

The **output variable** is $A$ (*Approved*). $1$ means approved, $0$ means rejected.

We will analyse under which assumptions the proposal will be approved; we will call these the **approval conditions** and they are derived from the approval rules.

**Condition 1:** Three or more votes in favour.

We identify all combinations where the sum of P, S, T, V is 3 or 4.

* Approved by three votes in favour
    * $P=0$, $S=1$, $T=1$ and $V=1$ --> ($\bar{P}STV$)
    * $P=1$, $S=1$, $T=1$ and $V=0$ --> ($PST\bar{V}$)
    * $P=1$, $S=1$, $T=0$ and $V=1$ --> ($PS\bar{T}V$)
    * $P=1$, $S=0$, $T=1$ and $V=1$ --> ($P\bar{S}TV$)
* Approved by four votes in favour
    * $P=1$, $S=1$, $T=1$ and $V=1$ --> ($PSTV$)

The proposal will be approved if any of these circumstances is met (logical OR). Condition 1 is expressed in Boolean algebra as:

$$
C_1 = \bar{P}STV + PST\bar{V} + PS\bar{T}V + P\bar{S}TV + PSTV
$$

**Condition 2:** Tie resolved in favour of the President.

We must identify all combinations with two votes for and two against. Of these, those with $P=1$ are of interest.
* Approved
    * $P=1$, $S=1$, $T=0$ and $V=0$ --> ($PS\bar{T}\bar{V}$)
    * $P=1$, $S=0$, $T=1$ and $V=0$ --> ($P\bar{S}T\bar{V}$)
    * $P=1$, $S=0$, $T=0$ and $V=1$ --> ($P\bar{S}\bar{T}V$)
* Not approved
    * $P=0$, $S=1$, $T=1$ and $V=0$
    * $P=0$, $T=0$, $S=1$ and $V=1$
    * $P=0$, $S=0$, $T=1$ and $V=1$

The proposal will be approved if any of these assumptions hold. Condition 2 is expressed as:

$$
C_2 = PS\bar{T}\bar{V} + P\bar{S}T\bar{V} + P\bar{S}\bar{T}V
$$

The output $A$ will be $1$ if condition $C_1$ or condition $C_2$ is satisfied. The Boolean function is a logical OR of these two conditions:

$$
A=C_1+C_2
$$

And therefore the expression for $A$, as a function of $P$, $S$, $T$ and $V$, is:

$$
A = \bar{P}STV + PST\bar{V} + PS\bar{T}V + P\bar{S}TV + PSTV + PS\bar{T}\bar{V} + P\bar{S}T\bar{V} + P\bar{S}\bar{T}V
$$

We build the truth table with all possible cases:

| $P$ | $S$ | $T$ | $V$ | Votes in favour | $C_1$ | $C_2$ | $A$ |
| --- | --- | --- | --- | :-------------: | ----- | ----- | --- |
| 0   | 0   | 0   | 0   |        0        | 0     | 0     | 0   |
| 0   | 0   | 0   | 1   |        1        | 0     | 0     | 0   |
| 0   | 0   | 1   | 0   |        1        | 0     | 0     | 0   |
| 0   | 0   | 1   | 1   |        2        | 0     | 0     | 0   |
| 0   | 1   | 0   | 0   |        1        | 0     | 0     | 0   |
| 0   | 1   | 0   | 1   |        2        | 0     | 0     | 0   |
| 0   | 1   | 1   | 0   |        2        | 0     | 0     | 0   |
| 0   | 1   | 1   | 1   |        3        | 1     | 0     | 1   |
| 1   | 0   | 0   | 0   |        1        | 0     | 0     | 0   |
| 1   | 0   | 0   | 1   |        2        | 0     | 1     | 1   |
| 1   | 0   | 1   | 0   |        2        | 0     | 1     | 1   |
| 1   | 0   | 1   | 1   |        3        | 1     | 0     | 1   |
| 1   | 1   | 0   | 0   |        2        | 0     | 1     | 1   |
| 1   | 1   | 0   | 1   |        3        | 1     | 0     | 1   |
| 1   | 1   | 1   | 0   |        3        | 1     | 0     | 1   |
| 1   | 1   | 1   | 1   |        4        | 1     | 0     | 1   |

The expression for $A$ as a function of $P$, $S$, $T$ and $V$ is quite long. A logical simplification with Boolean algebra would be complex. Alternatively we can use a Karnaugh map for the output function $A$, with inputs $P$, $S$, $T$ and $V$ grouped.

<!-- 
| PS\TV | 00 | 01 | 11 | 10 |
| --- | --- | --- | --- | --- | 
| 00 | 0 | 0 | 0 | 0 |  
| 01 | 0 | 0 | 1 | 0 | 
| 11 | 1 | 1 | 1 | 1 |
| 10 | 0 | 1 | 1 | 1 |
-->

<table style="border-collapse: collapse; text-align: center;">
  <thead>
    <tr>
      <th style="border: 1px solid #ccc; position: relative; width: 60px; height: 60px;">
        <div style="position: absolute; top: 5px; right: 5px;">TV</div>
        <div style="position: absolute; bottom: 5px; left: 5px;">PS</div>
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
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">01</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">11</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">10</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
    </tr>
  </tbody>
</table>

The next step is to group the '1's into four groups, which we mark with different colours.

<table style="border-collapse: collapse; text-align: center;">
  <thead>
    <tr>
      <th style="border: 1px solid #ccc; position: relative; width: 60px; height: 60px;">
        <div style="position: absolute; top: 5px; right: 5px;">TV</div>
        <div style="position: absolute; bottom: 5px; left: 5px;">PS</div>
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
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">01</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">11</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightblue;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightblue;">1</td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">10</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightblue;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightblue;">1</td>
    </tr>
  </tbody>
</table>

The fixed variables in the blue group are $P=1$ and $T=1$, which translates to the term $PT$ in the solution.

$$A=PT+···$$

<table style="border-collapse: collapse; text-align: center;">
  <thead>
    <tr>
      <th style="border: 1px solid #ccc; position: relative; width: 60px; height: 60px;">
        <div style="position: absolute; top: 5px; right: 5px;">TV</div>
        <div style="position: absolute; bottom: 5px; left: 5px;">PS</div>
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
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">01</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">11</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightgreen;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightgreen;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightgreen;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: lightgreen;">1</td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">10</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
    </tr>
  </tbody>
</table>

The fixed variables in the yellow group are $P=1$ and $V=1$, add the term $PV$ to the solution.

$$A=PT + PV + ···$$


<table style="border-collapse: collapse; text-align: center;">
  <thead>
    <tr>
      <th style="border: 1px solid #ccc; position: relative; width: 60px; height: 60px;">
        <div style="position: absolute; top: 5px; right: 5px;">TV</div>
        <div style="position: absolute; bottom: 5px; left: 5px;">PS</div>
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
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">01</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: red;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">11</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: red;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">10</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
    </tr>
  </tbody>
</table>

The green colour grouping has in common $P=1$ and $S=1$, add the term $PS$ to the solution

$$A=PT + PV + PS + ···$$


<table style="border-collapse: collapse; text-align: center;">
  <thead>
    <tr>
      <th style="border: 1px solid #ccc; position: relative; width: 60px; height: 60px;">
        <div style="position: absolute; top: 5px; right: 5px;">TV</div>
        <div style="position: absolute; bottom: 5px; left: 5px;">PS</div>
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
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">01</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: red;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">11</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: red;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">10</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
    </tr>
  </tbody>
</table>

The fixed variables in the green group have in common $P=1$ and $S=1$, so we add the term PS to the solution

$$A=PT + PV + PS + ···$$


<table style="border-collapse: collapse; text-align: center;">
  <thead>
    <tr>
      <th style="border: 1px solid #ccc; position: relative; width: 60px; height: 60px;">
        <div style="position: absolute; top: 5px; right: 5px;">TV</div>
        <div style="position: absolute; bottom: 5px; left: 5px;">PS</div>
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
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">01</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: yellow;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">11</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;background-color: yellow;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
    </tr>
    <tr>
      <th style="border: 1px solid #ccc; padding: 5px 10px;">10</th>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">0</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
      <td style="border: 1px solid #ccc; padding: 5px 10px;">1</td>
    </tr>
  </tbody>
</table>

Finally, in the red group the fixed variables are $S=1$, $T=1$ and $V=1$, add the term $STV$ to the solution.

$$A = PT + PV + PS + STV$$

This is the final simplified Boolean expression, because all the '1's have already been accounted for in some group.

The digital circuit derived from this expression is the following:


<img src='../../CircCombin/svotacio_exemple.png' alt="Digital circuit" style="display:block; height:280px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;"/>
<center><i>Digital circuit implementing the voting system for a committee</i></center>

## Exercises on Jutge.org: Introduction to Digital Circuit Design

- [Executive Committee](https://jutge.org/problems/X16063_en)
- [Two or more ones](https://jutge.org/problems/X67345_en)
- [4-input majority voter](https://jutge.org/problems/X42168_en)
- [Majority of 5 inputs](https://jutge.org/problems/X72286_en)

<small>*Remember that to access the exercises and for the Judge to evaluate your solutions you must be enrolled in the [course](https://jutge.org/courses/JordiCortadella:IntroCircuits). You will find all instructions [here](../Inici/instruccions.md).*</small>

<!-- This image should go at the end of each lesson, either with this line or within the signature. Leave commented if it is already in the signature-->
<br><br><img src="../../logos/TotsLogosBlanc.png" alt="CHIP Chair Logos" width="100%" style="display:block; margin:0 auto; border-radius:8px;"/>
<Autors autors="xcasas fmadrid"/>
