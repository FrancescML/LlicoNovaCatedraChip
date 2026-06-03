<!-- Colocar esta imagen al inicio de cada lección -->
<img src="../../logos/illustracio1.png" alt="Digital circuits" style="float: left; border-radius: 8px; height: 120px;"/>
<img src="../../logos/LogoCatedraCHIPBlanc.jpg" alt="CHIP Chair Logo" style="float: right; border-radius: 8px; height: 120px;"/>
<div style="clear: both;"></div>
<br>



# Introducción a los circuitos digitales

En estas lecciones aprenderás qué son los circuitos digitales y sus diferentes tipos. Encontrarás ejemplos y ejercicios para entender los circuitos combinacionales, los circuitos secuenciales y los circuitos aritméticos.

Los ** circuitos digitales** procesan información representada en formato binario, que utiliza solo dos estados eléctricos: voltaje bajo y voltaje alto, los cuales representan los valores binarios 0 y 1. Los componentes fundamentales de los circuitos digitales son las puertas lógicas. Estas son la base de los microprocesadores, memorias, controladores y de cualquier otro circuito digital complejo.

Las **puertas lógicas** son pequeños circuitos que realizan operaciones lógicas básicas sobre una o más señales binarias de entrada y producen una única señal binaria de salida. Para utilizar las puertas lógicas y crear circuitos digitales, es necesario conocer los conceptos de álgebra de Boole y las tablas de verificación. En muchos ejemplos y ejercicios de circuitos digitales utilizaremos las tablas de verdad o una expresión booleana para describir el comportamiento lógico de un circuito.

|**Puerta lógica**|**Símbolo** |**Expresión Lógica** |**Descripción**|
|------           |------      |:---:                |------         |
|Búfer |<img src="../../Intro/Buffer_ANSI_Labelled.png" style="background-color:white; height:80px;"/>   |$A$                        |Devuelve el mismo bit|
|NOT   |<img src="../../Intro/NOT_ANSI_Labelled.png" style="background-color:white; height:80px;"/>      |$\bar{A}$                  |Invierte el bit|
|AND   |<img src="../../Intro/AND_ANSI_Labelled.png" style="background-color:white; height:80px;"/>      |$A·B$                      |1 si las dos entradas son 1|
|OR    |<img src="../../Intro/OR_ANSI_Labelled.png" style="background-color:white; height:80px;"/>       |$A+B$                      |1 si al menos una entrada es 1|
|NAND  |<img src="../../Intro/NAND_ANSI_Labelled.png" style="background-color:white; height:80px;"/>     |$\overline{A·B}$           |AND invertido (combinación de AND y NOT)|
|NOR   |<img src="../../Intro/NOR_ANSI_Labelled.png" style="background-color:white; height:80px;"/>      |$\overline{A+B}$           |OR invertido (combinación de OR y NOT)|
|XOR   |<img src="../../Intro/XOR_ANSI_Labelled.png" style="background-color:white; height:80px;"/>      |$A·\bar{B}+\bar{A}·B$      |1 si las entradas son diferentes|
|XNOR  |<img src="../../Intro/XNOR_ANSI_Labelled.png" style="background-color:white; height:80px;"/>     |$(A·B)+(\bar{A}·\bar{B})$  |1 si las entradas son iguales|


<br>

Las puertas lógicas básicas son AND, OR y NOT. Una **tabla de verdad** muestra todas las posibles combinaciones de entradas de un circuito lógico o de una función booleana, y el resultado correspondiente a la salida para cada una de estas combinaciones.

Un [**circuito combinacional**](../CircCombin/intro.md) es un tipo de circuito digital en el que el valor de su salida en un instante depende únicamente de los valores actuales de sus entradas. Construidos únicamente con puertas lógicas simples, no tienen retroalimentación ni memoria. Su comportamiento se puede describir con tablas de verdad y funciones booleanas.

<img src='../../Intro/combinacional.png' alt="Circuito combinacional" style="display:block; width:500px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;"/>
<center><i>Circuito combinacional</i></center>

Los [**circuitos aritméticos**](../CircAritm/intro.md) son una subclase importante de los circuitos digitales combinacionales. Su función es efectuar operaciones matemáticas básicas con números binarios.

<img src='../../Intro/aritmetic.png' alt="Circuito aritmético" style="display:block; width:400px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;"/>
<center><i>Este ejemplo es un circuito aritmético sumador</i></center>

Los [**circuitos secuenciales**](../CircSeq/intro.md) son un tipo de circuito digital que, a diferencia de los circuitos combinacionales o aritméticos, incorporan retroalimentación y tienen memoria. En consecuencia, su salida no solo depende de las entradas actuales, sino también de su estado previo o historial de entradas. Muchos de ellos utilizan un reloj para coordinar los cambios de estado.

<img src='../../Intro/sequencial.png' alt="Circuito secuencial" style="display:block; width:500px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;"/>
<center><i>Circuito secuencial</i></center>

La lección [**Tiny Micro**](../TinyMicro/intro.md) es un recopilatorio de ejercicios avanzados sobre el funcionamiento de un pequeño ordenador.

<!-- Esta imagen debe ir al final de cada lección, ya sea con esta línea o dentro de la firma. Dejar comentado si ya está a la firma-->
<br><br><img src="../../logos/TotsLogosBlanc.png" alt="CHIP Chair Logos" width="100%" style="display:block; margin:0 auto; border-radius:8px;"/>
<Autors autors="xcasas fmadrid"/>

