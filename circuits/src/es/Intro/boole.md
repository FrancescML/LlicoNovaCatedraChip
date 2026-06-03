<!-- Colocar esta imagen al inicio de cada lección -->
<img src="../../logos/illustracio1.png" alt="Digital circuits" style="float: left; border-radius: 8px; height: 120px;"/>
<img src="../../logos/LogoCatedraCHIPBlanc.jpg" alt="CHIP Chair Logo" style="float: right; border-radius: 8px; height: 120px;"/>
<div style="clear: both;"></div>
<br>





# Introducción al álgebra de Boole

El álgebra de Boole fue creada por George Boole en el siglo XIX, pero los ingenieros vieron que era perfecta para la electrónica, donde su función es describir y simplificar los circuitos.

El álgebra de Boole, también llamada álgebra booleana, es una estructura algebraica que utiliza variables y operaciones lógicas.
Sus variables solo pueden adoptar dos valores, tradicionalmente llamados verdadero y falso, representados como 1 y 0 respectivamente.

En electrónica digital estos dos valores corresponden directamente a los estados eléctricos de los circuitos digitales: un voltaje alto (1) o bajo (0). Por ello, el álgebra de Boole se puede utilizar para describir las operaciones lógicas de los circuitos digitales.

* Base de la computación: El álgebra de Boole es una herramienta fundamental para el análisis y el diseño de los circuitos digitales y es la base de la aritmética computacional moderna.

* Análisis: Ayuda a entender el funcionamiento de un circuito existente, permitiendo determinar su salida a partir de las entradas.

* Diseño: Proporciona un método sistemático para diseñar circuitos digitales que realicen una función específica (por ejemplo, un sumador, un comparador o un multiplexor).

* Optimización: Permite simplificar expresiones lógicas complejas. Esto se traduce directamente en circuitos digitales más simples, que consumirán menos y serán más rápidos y fiables.

## Operadores booleanos

El álgebra de Boole utiliza tres operadores fundamentales. Las puertas lógicas se corresponden directamente con ellos y llevan el mismo nombre.
Los operadores booleanos se pueden representar de distintas maneras según el ámbito de aplicación: matemáticas, electrónica o programación.

### **NO**:
El operador NO también se llama negación o inversión lógica.
Para una variable booleana $A$, se expresa con el símbolo "$\overline{\quad}$" sobre la variable, con el símbolo "$\neg$" o con un apóstrofo "$'$".
$\overline{A}$ o también $\neg A$ o bien $A'$

La tabla de verdad se corresponde con la puerta lógica NO. La salida es el valor contrario a la entrada.

|$A$| $\overline{A}$ |
|---|:-----:|
| 0 | 1 |
| 1 | 0 |


### **OR (Disyunción)**:
El operador OR también se llama suma o disyunción lógica.
Por ejemplo, para las variables booleanas $A$ y $B$ se expresa con el símbolo "$+$".
$A+B$ o también $A \lor B$

La tabla de verdad se corresponde con la puerta lógica OR. La salida es $1$ si alguna de las entradas es $1$.

|$A$|$B$| $A+B$ |
|---|---|:-----:|
| 0 | 0 | 0 |
| 0 | 1 | 1 |
| 1 | 0 | 1 |
| 1 | 1 | 1 |

### **AND (Conjunción)**:
El operador AND también se llama multiplicación o conjunción lógica.
Por ejemplo, para las variables booleanas $A$ y $B$ se expresa con el símbolo "$·$" o la simple juxtaposición.
$A·B$ o también $AB$ o bien $A \land B$

La tabla de verdad se corresponde con la puerta lógica AND. La salida es $1$ solo si todas las entradas son $1$.

|$A$|$B$| $AB$ |
|---|---|:-----:|
| 0 | 0 | 0     |
| 0 | 1 | 0     |
| 1 | 0 | 0     |
| 1 | 1 | 1     |

## Prioridad de operaciones

La prioridad de las operaciones booleanas es la siguiente (de mayor a menor):
1. Paréntesis
2. Negación
3. AND (Conjunción)
4. OR (Disyunción)



## Postulados Fundamentales o Axiomas de Boole
Los postulados de Boole son reglas básicas, verdades aceptadas sobre las cuales se construye toda el álgebra de Boole.

**Propiedades de la Suma Lógica (OR)**

$A + 0 = A$ &emsp;&emsp;&emsp; *El 0 es el elemento neutro (identidad) de la suma lógica*

$A + 1 = 1$

$A + \bar{A} = 1$

$A + A = A$ &emsp;&emsp;&emsp; *Ley de Idempotencia*

**Propiedades de la Multiplicación Lógica (AND)**

$A · 1 = A$ &emsp;&emsp;&emsp; *El 1 es el elemento neutro de la multiplicación lógica*

$A · 0 = 0$

$A · \bar{A} = 0$

$A · A = A$ &emsp;&emsp;&emsp; *Ley de Idempotencia*

**Propiedades de la Negación**

$\bar{0} = 1$

$\bar{1} = 0$

$\overline{\overline{A}} = A$

**Propiedad Conmutativa:** El orden de las variables no altera el resultado.
* $A + B = B + A$
* $A · B = B · A$

**Propiedad Asociativa:** En operaciones con más de dos variables, la forma en que se agrupan las operaciones no afecta el resultado.
* $(A + B) + C = A + (B + C)$
* $(A · B) · C = A · (B · C)$

**Propiedad Distributiva:** La multiplicación lógica se distribuye sobre la suma lógica.
* $A · (B + C) = (A · B) + (A · C)$

**Atención!** A diferencia del álgebra tradicional, la suma lógica se distribuye sobre la multiplicación lógica.
* $A + (B · C) = (A + B) · (A + C)$

**Leyes de Absorción:**
* $A + (A · B) = A$
* $A · (A + B) = A$

**Leyes de De Morgan:** Muy importantes para la simplificación.
* $\overline{A + B} = \bar{A} · \bar{B}$
* $\overline{A · B} = \bar{A} + \bar{B}$

**Algunas propiedades derivadas:**
* $A + \bar{A}·B=A+B$
* $A(\bar{A}+B) = A·B$


## Funciones booleanas
Una función booleana es una aplicación que asigna a unas variables booleanas de entrada un resultado en forma de variable booleana.

Esta función se puede representar de diferentes maneras; con una expresión booleana, una tabla de verdad, un mapa de Karnaugh o bien con un circuito digital combinacional. Con esta base podrás simplificar expresiones, diseñar funciones lógicas y sistemas digitales cada vez más complejos.

Simplificar una función booleana significa encontrar una expresión equivalente con el menor número posible de términos y variables. Esto permite construir el circuito con menos puertas lógicas.
Para simplificar se utilizan las leyes y propiedades vistas anteriormente, o bien los Mapas de Karnaugh.



<!-- Esta imagen debe ir al final de cada lección, ya sea con esta línea o dentro de la firma. Dejar comentado si ya está a la firma-->
<br><br><img src="../../logos/TotsLogosBlanc.png" alt="CHIP Chair Logos" width="100%" style="display:block; margin:0 auto; border-radius:8px;"/>
<Autors autors="xcasas fmadrid"/>