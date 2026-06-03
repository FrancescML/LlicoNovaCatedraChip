<!-- Colocar esta imagen al inicio de cada lección -->
<img src="../../logos/illustracio1.png" alt="Digital circuits" style="float: left; border-radius: 8px; height: 120px;"/>
<img src="../../logos/LogoCatedraCHIPBlanc.jpg" alt="CHIP Chair Logo" style="float: right; border-radius: 8px; height: 120px;"/>
<div style="clear: both;"></div>
<br>




# Introducción a los circuitos aritméticos

Los circuitos aritméticos son una subclase fundamental de los **circuitos digitales combinacionales**. Las operaciones básicas más habituales que implementan son:

**Semisumador (*Medio sumador*)**: Circuito que suma dos bits y produce una salida de suma $S$ y un bit de acarreo $C$.

<img src="../../CircAritm/blochalfadder.png" alt="Semisumador (Medio sumador)" style="display:block; width:200px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;" />
<center><i>Semisumador (Medio sumador)</i></center>

**Sumador completo (*Sumador completo*)**: Suma tres bits (dos de entrada y el acarreo de la etapa anterior). Es el bloque básico para construir sumadores de varios bits mediante la conexión en cascada.

<img src="../../CircAritm/blocfulladder.png" alt="Sumador completo (Sumador completo)" style="display:block; width:200px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;" />
<center><i>Sumador completo (Sumador completo)</i></center>

**Sumador de n bits**: Con semisumadores y sumadores completos se pueden construir sumadores de $n$ bits. Este circuito realiza la suma binaria de dos números $A$ y $B$.

<img src="../../CircAritm/blocsumador4bits.png" alt="Sumador de 4 bits" style="display:block; width:600px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;" />
<center><i>Sumador de 4 bits</i></center>


**Restador**: La resta binaria se resuelve habitualmente empleando sumadores y la representación en **complemento a dos**.
Así, la resta $A - B$ se transforma en la suma:

$$A + (-B)$$

<img src="../../CircAritm/blocrestador4bits.png" alt="Restador de 4 bits" style="display:block; width:600px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;" />
<center><i>Restador de 4 bits</i></center>

**Comparadores**:
Circuitos que determinen si un número binario es **mayor**, **menor** o **igual** que otro.

<img src="../../CircAritm/bloccomparador.png" alt="Comparador" style="display:block; width:200px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;" />
<center><i>Comparador</i></center>

**Multiplicadores y divisores**:
Circuitos más complejos que se implementan mediante algoritmos basados en sumas repetidas y desplazamientos.

<img src="../../CircAritm/blocmultiplicador.png" alt="Multiplicador" style="display:block; width:200px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;" />
<center><i>Multiplicador</i></center>

Los circuitos aritméticos constituyen el núcleo de las **Unidades Aritmético-Lógicas (UAL)**, el corazón de cualquier microprocesador.
La UAL es la encargada de ejecutar tanto las operaciones aritméticas como las operaciones lógicas necesarias para la ejecución de los programas.

La Unidad Aritmético-Lógica (**UAL**) se denomina ALU en inglés.

<img src="../../CircAritm/ALU.png" alt="UAL" style="display:block; width:400px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;" />
<center><i>Unidad Aritmético-Lógica (UAL)</i></center>

## Contenido de la lección

* En el tema [**Circuitos básicos**](./CircBasics.md) se presentan el semisumador, el sumador completo y los comparadores.
* En el tema [**Aritmética de 4 bits**](./Aritm4bits.md) se trabajan incrementadores, sumadores de 4 bits y un ejemplo de UAL.
* En el tema [**Aritmética de n bits**](./Aritmnbits.md) se generalizan incrementadores, sumadores y comparadores para $n$ bits.
* Finalmente, en el tema de [**Miscelánea**](./miscellania.md) se recogen ejercicios más avanzados como multiplicadores, acumuladores de bits y circuitos secuenciales *sumadores*.


<!-- Esta imagen debe ir al final de cada lección, ya sea con esta línea o dentro de la firma. Dejar comentado si ya está a la firma-->
<br><br><img src="../../logos/TotsLogosBlanc.png" alt="CHIP Chair Logos" width="100%" style="display:block; margin:0 auto; border-radius:8px;"/>
<Autors autors="xcasas fmadrid"/>