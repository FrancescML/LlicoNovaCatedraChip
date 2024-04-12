# Referències


<img src='./referencies.png' style='height: 8em; float: right; margin: 0 0 1em 2em;'/>

Aquesta lliçó presenta uns detalls importants sobre les llistes. En efecte, les llistes són objectes que es manipulen a través de referències i cal tenir en compte què passa quan s'assignen referències, ja sigui explícitament amb l'operador d'assignació o implícitament a través del pas de paràmetres en crides a funcions.


## Introducció a Python Tutor

Per tal d'explicar millor els conceptes en aquesta lliçó, ens valdrem de [Python Tutor](https://pythontutor.com/visualize.html#mode=edit), un sistema que permet visualitzar l'execució de programes en Python al vostre navegador, de forma interactiva.

Familiaritzeu-vos amb Python Tutor jugant amb l'execució d'aquest primer programa que calcula el màxim comú divisor de 24 i 8 amb l'algorisme d'Euclides. A sota en teniu explicacions.


<iframe width="800" height="500" frameborder="0" src="https://pythontutor.com/iframe-embed.html#code=a%20%3D%2024%0Ab%20%3D%208%0Awhile%20a%20!%3D%20b%3A%0A%20%20%20%20if%20a%20%3E%20b%3A%0A%20%20%20%20%20%20%20%20a%20%3D%20a%20-%20b%20%0A%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20b%20%3D%20b%20-%20a%0Aprint%28a%29&codeDivHeight=400&codeDivWidth=350&cumulative=false&curInstr=0&heapPrimitives=nevernest&origin=opt-frontend.js&py=3&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe>

Si cliqueu el botó **Next>** veureu com el programa s'executa, instrucció rera instrucció. La fletxa roja assenyala la següent instrucció a realitzar, la fletxa verda assenyala la darrera instrucció realitzada. Alhora que el programa avança, a la dreta teniu una representació de l'estat actual de la memòria, on es poden veure les variables definides i el seu valor. El *global frame* representa l'espai de memòria on es desen les variables globals.

Segur que no teniu cap problema en entendre com les variables `a` i `b` es van afegint a la memòria i com van canviant els seus valors.

D'acord? Seguim!


## Situació 1A

Considereu ara aquest petit programa:

```python
a = 2
b = a
a = a + 1
print(a)
print(b)
```

Prengueu-vos un moment per pensar què escriu aquest programa.

Comproveu si ho heu encertat executant el programa anterior instrucció a instrucció amb el Python Tutor:

<iframe width="800" height="500" frameborder="0" src="https://pythontutor.com/iframe-embed.html#code=a%20%3D%202%0Ab%20%3D%20a%0Aa%20%3D%20a%20%2B%201%20%0Aprint%28a%29%0Aprint%28b%29%0A&codeDivHeight=400&codeDivWidth=350&cumulative=false&curInstr=0&heapPrimitives=nevernest&origin=opt-frontend.js&py=3&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe>

Fixeu-vos que quan s'assigna `2` a `a`, la variable `a` es crea a la memòria i el seu contingut és `2`. Després,  quan s'assigna `a` a `b`, la variable `b` es crea a la memòria i el seu contingut esdevé doncs `2`, que és una còpia del valor d'`a`. Quan s'incrementa `a`, el valor `2` d'`a` es perd per esdevenir `3` i, evidentment, el valor de `b` no canvia. Per això el programa acaba imprimint ~~3 2~~.

Cap sorpresa, oi?


## Situació 1B

A veure si ara això us pot sorprendre una mica més! Considerem una situació quasi idèntica, però on `a` és una llista i, enlloc de sumar-li 1, li afegim un element al final:

```python
a = [3, 2, 1]
b = a
a.append(9)
print(a)
print(b)
```

Prengueu-vos un moment per pensar què escriu aquest programa.  Quan ho hagueu fet, mireu què passa realment:

<iframe width="800" height="500" frameborder="0" src="https://pythontutor.com/iframe-embed.html#code=a%20%3D%20%5B3,%202,%201%5D%0Ab%20%3D%20a%0Aa.append%289%29%0Aprint%28a%29%0Aprint%28b%29&codeDivHeight=400&codeDivWidth=350&cumulative=false&curInstr=0&heapPrimitives=nevernest&origin=opt-frontend.js&py=3&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe>

Aquest cop, es veu que la llista `[3, 2, 1]` no s'emmagatzema directament com a contingut de la variable `a`, sinó que es desa en un altre espai (*objects*) i la variable `a` assenyala (amb una fletxa) on es troba. Això és degut al fet que les llistes són **objectes** i que es manipulen a través de **referències**. Internament, aquestes fletxes i referències es desen com a **adreces de memòria**, però això no és rellevant ara mateix.

Després, quan es fa l'assignació `b = a`, no es copia el contingut de la llista, sinó que, com que `a` és una referència, es copia la referència (és a dir, es copia "la fletxa"). Per això hi ha ara dues fletxes cap a la llista `[3, 2, 1]`. Per tant, aquesta llista té ara dos noms: `a` i `b`.

Llavors, quan s'executa `a.append(9)`, el `9` és afegit al final de la llista referenciada per `a`. Per tant la llista `[3, 2, 1]` esdevé `[3, 2, 1, 9]`. Però, ostres!, amb això, resulta que no només s'ha canviat `a`, sinó que, de retruc, també s'ha canviat `b`. O no del tot... perquè, de fet, ni `a` ni `b` no han canviat: `a` i `b` continuen sent la mateixa referència que eren, a una llista que és la que sí ha canviat.  Com veieu, la crida `append(9)` aplicada a `a`, canvia la llista referenciada per `a`.

Amb tot, el programa escriu doncs ~~[3, 2, 1, 9] [3, 2, 1, 9]~~.

Amb aquest exemple hem après doncs que les llistes no es manipulen directament, sinó que es tracten a través de referències. Les assignacions entre referències només copien la referència, i no copien l'objecte referit.


## Situació 1C

Fem un petit canvi al programa anterior:

```python
a = [3, 2, 1]
b = a[:]
a.append(9)
print(a)
print(b)
```

Què escriu? Mireu què passa:

<iframe width="800" height="500" frameborder="0" src="https://pythontutor.com/iframe-embed.html#code=a%20%3D%20%5B3,%202,%201%5D%0Ab%20%3D%20a%5B%3A%5D%0Aa.append%289%29%0Aprint%28a%29%0Aprint%28b%29&codeDivHeight=400&codeDivWidth=350&cumulative=false&curInstr=0&heapPrimitives=nevernest&origin=opt-frontend.js&py=3&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe>


Recordeu que els operadors de llesques retornen noves llistes. Per tant, ara `b` és un referència a un altre objecte, el qual és una còpia de l'objecte referenciat per `a`. Per això, quan s'afegeix el `9` a la llista referenciada per `a`, la llista referenciada per `b` no canvia.


## Exercici 1

Penseu què escriu aquest programa i comproveu-ho amb el tutor:

```python
a = [3, 2, 1]
b = a
a[1] = 9
print(a)
print(b)
```

<iframe width="800" height="500" frameborder="0" src="https://pythontutor.com/iframe-embed.html#code=a%20%3D%20%5B3,%202,%201%5D%0Ab%20%3D%20a%0Aa%5B1%5D%20%3D%209%0Aprint%28a%29%0Aprint%28b%29&codeDivHeight=400&codeDivWidth=350&cumulative=false&curInstr=0&heapPrimitives=nevernest&origin=opt-frontend.js&py=3&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe>


## Situació 2A

Considereu ara aquest senzill programa que té una funció (de fet, una acció, perquè no retorna res):

```python
def f(x: int) -> None:
    x = 3

a = 2
f(a)
print(a)
```

Prengueu-vos un moment per pensar què escriu aquest programa i, com de costum, comproveu si ho heu encertat executant el programa anterior instrucció a instrucció amb el Python Tutor:

<iframe width="800" height="500" frameborder="0" src="https://pythontutor.com/iframe-embed.html#code=def%20f%28x%3A%20int%29%20-%3E%20None%3A%0A%20%20%20%20x%20%3D%203%0A%0Aa%20%3D%202%0Af%28a%29%0Aprint%28a%29&codeDivHeight=400&codeDivWidth=350&cumulative=false&curInstr=0&heapPrimitives=nevernest&origin=opt-frontend.js&py=3&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe>

Quan executeu el programa veureu que es defineix una nova variable global `f`. Aquesta variable es correspon a la funció; no cal que li presteu atenció. Quan es crida `f` a la línia 5, veureu que el codi passa a executar la funció `f`. I, just quan es comença a executar, apareix un nou *frame* que representa l'espai de memòria on es desen les variables locals corresponents en aquesta invocació de `f`. Per això, el paràmetre `x` hi rep una còpia del valor actual d'`a`, és a dir un `2`. Fixeu-vos que quan es fa l'assignació `x = 3`, el valor emmagatzemat al paràmetre formal `x` esdevé un `3`, perdent-se el `2`. Ara bé, el valor del paràmetre real corresponent (`a` al *global frame*) no queda modificat. Per això, quan acaba l'execució de la funció `f` i el seu *frame* desapareix de la memòria, `a` reté el seu valor original `2`. Per tant, el programa escriu `2`.

Amb aquest exemple hem vist doncs com, quan es crida una funció, els seus paràmetres formals esdevenen variables locals que reben una còpia dels valors dels paràmetres reals corresponents. Per tant, si els paràmetres formals es modifiquen amb una assignació, aquest canvi no és visible des del programa que els ha invocat.



## Situació 2B

Ara repetim la situació anterior, però amb llistes enlloc d'enters:

```python
def f(x: list[int]) -> None:
    x.append(9)

a = [3, 2, 1]
f(a)
print(a)
```

Com sempre, intenteu pensar primer quina és la sortida del programa i, després, executeu el programa poc a poc:

<iframe width="800" height="500" frameborder="0" src="https://pythontutor.com/iframe-embed.html#code=def%20f%28x%29%3A%0A%20%20%20%20x.append%289%29%0A%0Aa%20%3D%20%5B3,%202,%201%5D%0Af%28a%29%0Aprint%28a%29&codeDivHeight=400&codeDivWidth=350&cumulative=false&curInstr=0&heapPrimitives=nevernest&origin=opt-frontend.js&py=3&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe>

Aquest cop, quan es crida `f`, el valor del paràmetre real `a` es copia a la variable local corresponent al paràmetre formal `x`. Aquesta còpia es fa, com sempre, a través d'una assignació. I, com que ara `a` és una referència, l'assignació copia la referència. Per tant, `a` i `x` referencien la mateixa llista.

Llavors, quan el `9` és afegit al final de la llista `x`, aquesta esdevé `[3, 2, 1, 9]`. Però, ostres!, amb això, resulta que no només s'ha canviat `x`, sinó que també s'ha canviat `a`. O no... Perquè, de fet ni `x` ni `a` no han canviat: `x` i `a` continuen sent la mateixa referència a una llista, que sí que ha canviat.

Un cop la crida a `f` finalitza, `x` es perd, però `a` continua viva i continua referenciant la llista `[3, 2, 1, 9]`. Per tant, en aquest cas, el programa escriu ~~[3, 2, 1, 9]~~.

Amb aquest exemple hem après doncs que les funcions poden canviar el valors dels objectes que reben com a paràmetres.


## Exercici 2

Què escriu aquest programa?

```python
def f(x: list[int]) -> None:
    x = x + [9]

a = [3, 2, 1]
f(a)
print(a)
```

Comproveu la vostra resposta amb [Python Tutor](https://pythontutor.com/visualize.html#mode=edit). Quina és la diferència amb el programa de la Situació 2B?


## Exercici 3

Considereu aquests dos programes:

```python
def f(x: list[int]) -> None:
    x = []

a = [10, 20, 30]
f(a)
```

```python
def f(x: list[int]) -> None:
    x.clear()

a = [10, 20, 30]
f(a)
```

Amb quin dels dos programes s'aconsegueix que `a` esdevingui una llista buida? Comproveu la vostra resposta amb [Python Tutor](https://pythontutor.com/visualize.html#mode=edit).


## Exercici 4

Considereu aquests programes:

```python
def f(x: list[int]) -> None:
    x = x + x
    print(x)

a = [2, 4, 8]
f(a)
print(a)
```

```python
def f(x: list[int]) -> None:
    x = x * 2
    print(x)

a = [2, 4, 8]
f(a)
print(a)
```

```python
def f(x: list[int]) -> None:
    x.extend(x)
    print(x)

a = [2, 4, 8]
f(a)
print(a)
```

Què escriu cada programa? Comproveu la vostra resposta amb [Python Tutor](https://pythontutor.com/visualize.html#mode=edit). Observeu les diferències.





## Sumari

En Python, les llistes són objectes. Per tant, una variable de tipus llista no emmagatzema directament el contingut de la llista, sinó que només en desa la seva referència. En conseqüència, quan s'aplica un canvi en aquesta llista, el canvi es reflecteix directament a totes les seves referències. En canvi, l'operador d'assignació (`=`), no realitza canvis als objectes, sinó que canvia les referències.

Com a corol·lari, això vol dir que les assignacions a paràmetres formals de funcions i accions no afecten el paràmetre real corresponent, però que les mutacions a través de mètodes o indexacions sí que poden fer-ho.

De moment, això és tot el que us cal saber, però caldrà que revisitem aquest tema més endavant.



<Autors autors="jpetit"/>
