
# Exemples

<img src='./exemples.png' style='height: 8em; float: right; margin: 0 0 1em 2em;'/>

En aquesta lliçó es presenten diferents exemples d'ús de llistes. 


## Nombre d'elements iguals al darrer

Considerem que volem fer un programa que llegeixi una seqüència de nombres enters i escrigui quants d'ells són iguals al darrer. Per exemple, si l'entrada són els nombres 11 21 11 45 21 13 21, caldria respondre 3.

Aquest problema no es pot resoldre amb un simple recorregut com n'havíem resolt tants d'altres (bé, amb recursivitat sí que es podria fer...). En canvi, és fàcil de resoldre amb llistes.

Aquesta és la idea principal de l'algorisme: 

- Primer, es llegeixen tots els elements de la seqüència i es desen en una llista.

- Després, es recorre la llista tot comptant el nombre d'elements iguals al darrer.

El programa següent implementa aquesta idea:

```python
from yogi import *

# desar tota la seqüència en una llista
L: list[int] = []
for x in tokens(int):
    L.append(x)

# comptar aparicions del darrer element
c = 0
for x in L:
    if x == L[-1]:
        c += 1
print(c)
```

La llista d'enters on es desaran totes les dades de la seqüència és `L`, que es crea buida (per això se li anota el tipus `list[int]`). A continuació, cada element `x` de la seqüència d'entrada es llegeix i s'afegeix al final de `L`. Un cop tots els elements han estat llegits, es troben tots en `L`. Llavors, per cada element `x` de `L` que sigui igual al darrer element de `L` (és a `L[-1]`), s'incrementa un comptador `c`.

El programa anterior es pot refactoritzar amb dues funcions per estructurar-lo millor: una que retorni les dades llegides, i una altra que realitzi el comptatge de les ocurrències d'un element donat:


```python
from yogi import *

def llegir_llista() -> list[int]:
    """Retorna la llista de tots els enters de l'entrada."""

    L: list[int] = []
    for x in tokens(int):
        L.append(x)
    return L

def ocurrencies(L: list[int], elem: int) -> int:
    """Retorna el nombre d'elements de L iguals a elem."""

    c = 0
    for x in L:
        if x == elem:
            c += 1
    return c

def main() -> None:
    L = llegir_llista()
    print(ocurrencies(L, L[-1]))

main()
```

**Avançat:** De fet, amb una mica de màgia podem fer tot el programa amb només dues línies:

```python
L = list(tokens(int))  
print(L.count(L[-1]))   
```

La primera línia llegeix totes les dades d'un cop convertint la seqüència retornada per `tokens` en una llista. La segona utilitza el mètode `count` que tenen les llistes per comptar ocurrències. Ja m'està bé que conegueu aquests trucs, però heu de saber fer-ho sense també.


## És capicua?

Considerem que volem escriure una funció que, donada una llista d'enters, digui si aquesta és o no capicua. Una llista és **capicua** o **palindròmica** si conté els mateixos elements del dret que del revés. Així, `[7, 5, 6, 5, 7]` és capicua però `[3, 4, 2, 2, 5, 3]` no ho és.

La capçalera de la funció seria la següent:

```python
def capicua(llista: list[int]) -> bool:
    """Indica si llista és capicua o no."""
```

Usant comparacions de llistes i la funció predefinida `reversed`, la implementació és ben clara i senzilla:

```python
def capicua(llista: list[int]) -> bool:
    """Indica si llista és capicua o no."""

    return llista == list(reversed(llista))
```

Ara bé, el mal d'aquesta solució és que quan la llista no és capicua, necessita girar tots els seus elements. Una manera de millorar-ho seria anar recorrent els elements simètrics de la llista des del principi i el final tot comprovant si són o no iguals. Es podria fer així:


```python
def capicua(llista: list[int]) -> bool:
    """Indica si llista és capicua o no."""

    n = len(llista)
    for i in range(n // 2):
        if llista[i] != llista[n - i - 1]:
            return False 
    return True
```

Comproveu que aquest algorisme funciona, independentment de si la llista té un nombre parell o senars d'elements. Fixeu-vos bé en com s'accedeixen a elements simètrics des del mig de la llista a través de `llista[i]` i `llista[n - i - 1]`.

I fixeu-vos també com hem aprofitat l'accés directe a les llistes: cada cop s'accedeix a elements ben distants.



## Operacions amb vectors

Considerem ara que volem una funció per calcular el producte escalar de dos vectors de reals. Recordeu que el producte escalar de dos vectors $x=(x\_1,...,x\_n)$ i $y=(y\_1,...,y\_n)$ d'$n$ elements és $\sum\_{i=1}^n x_i y_i$.

La capçalera, especificació i implementació d'aquesta funció podria ser així:

```python
def producte_escalar(x: list[float], y: list: [float]) -> float:
    """Retorna el producte escalar de dos vectors de la mateixa mida."""

    s = 0.0
    for i in range(len(x)):
        s += x[i] * y[i]
    return s
```

Aquí, hem decidit que representarem el concepte matemàtic de vector a través de llistes de reals. Aquesta identificació és molt habitual i útil en programació. Ara bé, cal tenir en compte que en matemàtiques els vectors solen començar per 1, mentre que les llistes de Python comencen per 0. Per implementar el programa, només hem hagut de traduir a Python el sumatori $\sum\_{i=0}^{n-1} x_i y_i$ realitzant un bucle controlat per les $i$.

Considerem ara que també volem una funció per calcular el mòdul d'un vector. Recordeu que el mòdul d'un vector $x=(x\_1,...,x\_n)$ d'$n$ reals és $\sqrt{\sum\_{i=1}^n x_i^2}$. 

Aquesta seria una possible solució:

```python
import math

def modul(x: list[float]) -> float:
    """Retorna el mòdul d'un vector."""

    m = 0.0
    for i in range(len(x)):
        m += x[i] * x[i]
    return math.sqrt(m)
```

Però és més senzill fer-ho aplicant el fet que el mòdul d'un vector és el mateix que el producte vectorial del vector per ell mateix. Aquesta solució aprofita la funció anterior i és molt més curta i segura:

```python
import math

def modul(x: list[float]) -> float:
    """Retorna el mòdul d'un vector."""

    return math.sqrt(producte_escalar(x, x))
```

No és genial poder aprofitar codi?

I considerem ara que volem una funció que ens digui si dos vectors de $\mathbb{R}^3$ són o no perpendiculars. Com sabreu, dos vectors de l'espai són perpendiculars si i només si el seu producte escalar és zero. Només caldria usar `producte_escalar` de nou:

```python
def perpendiculars(a: list[float], b: list[flot]) -> bool:
    """Indica si dos vectors són o no perpendiculars."""

    return producte_escalar(a, b) == 0
```

De totes maneres, ja sabeu que comparar reals sempre és arriscat. Aquesta implementació és més tolerant:

```python
def perpendiculars(a: list[float], b: list[flot]) -> bool:
    """Indica si dos vectors són o no perpendiculars."""

    return abs(producte_escalar(a, b)) < 1e-12
```

Aquestes podrien ser algunes proves per testejar les funcions anteriors:

```python
v1 = [1.1, 2.2, 3.3]
v2 = [0, 4.2, -2.1]
print(producte_escalar(v1, v2))
print(modul(v1))
print(perpendiculars(v1, v2))
```



## Cercar un subtext en un text 

Ja sabem que els textos (`str`s) són semblants a les llistes, però que són immutables. Anem ara a mostrar com resoldre un problema sobre textos accedint als seus caràcters individuals. En particular, donats dos textos, volem saber si el primer conté o no el segon. Per exemple, `'aprofitament'` conté `'fita'` però `'margarita'` no conté `'gata'`.  Aquesta operació és molt corrent: per exemple, això és el que el vostre processador de textos o navegador d'Internet ha de fer quan li dieu de buscar algun text en un document.

Com de costum, comencem amb l'especificació de la funció:

```python
def conte(text: str, subtext: str) -> bool:
    """Diu si text conté subtext."""
```

A partir d'ara, suposarem que `text` té `n` caràcters i que `subtext` té `m` caràcters.

Per implementar la funció `conte`, és força clar que caldrà comprovar si el `subtext` es troba en `text` començant en alguna posició `pos`, per alguna `pos` entre 0 i `n - m`. Per tant, podem extreure de `text` els caràcters entre la posició `pos` i `pos + m` i mirar si algun d'ells coincideix amb `subtext`. Una manera de fer-ho seria així:

```python
def conte(text: str, subtext: str) -> bool:
    """Diu si text conté subtext."""

    n, m = len(text), len(subtext)
    for pos in range(n - m + 1):
        if text[pos : pos + m] == subtext:
            return True
    return False
```

Fixeu-vos com hem utilitzat les llesques per extreure una part de `text` amb `text[pos : pos + m]` començant a la posició `pos` i amb llargada `m`.

Malauradament, aquesta solució pot ser bastant lenta a la pràctica, perquè moltes vegades caldrà extreure aquesta part de `text` de llargada `m` per acabar veient que el seu primer caràcter ja és diferent del primer de `subtext`. Per tant, seria millor comparar directament els caràcters un a un, sense extracció i plegant quan ja es troba una diferència. Aquest cerca es podria relegar en una funció:

```python
def conte_a(text: str, subtext: str, pos: int) -> bool:
    """Diu si text conté subtext a la posició pos."""

    for i in range(len(subtext)):
        if subtext[i] != text[pos + i]:
            return False
    return True
```

I, ara, la segona versió de `conte` fa ús de la funció auxiliar que hem creat:

```python
def conte(text: str, subtext: str) -> bool:
    """Diu si text conté subtext."""

    n, m = len(text), len(subtext)
    for pos in range(n - m + 1):
        if conte_a(text, subtext, pos):
            return True
    return False
```

De fet, en el cas pitjor, aquesta versió és encara tant lenta com la primera, però a la pràctica hauria de ser molt més ràpida. Hi ha algorismes alternatius més avançats que són molt més eficients per resoldre aquest problema; probablement es troben implementats en l'operador `in` que fa exactament això.



<Autors autors="jpetit"/> 


