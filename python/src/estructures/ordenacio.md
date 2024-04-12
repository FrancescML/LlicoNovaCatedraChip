# Ordenació d'estructures

<img src='./ordenacio.png' style='height: 8em; float: right; margin: 0 0 1em 2em;'/>

En aquesta lliçó es mostra com ordenar llistes d'estructures.



## Ordenació amb `key`

Considereu aquesta senzilla estructura per desar una hora de rellotge:

```python
@dataclass
class Hora:
    h: int
    m: int
    s: int
```

Si intentem ordenar una llista d'hores, Python dóna un antipàtic error:

```python
>>> L = [Hora(15,30,0), Hora(14,49,59), Hora(15,30,0), Hora(9,0,0)]
>>> sorted(L)
TypeError: "'<' not supported between instances of 'Hora' and 'Hora'"
```

La raó és que les estructures es poden comparar amb `==` i `!=` però no amb `<`, `>`, `>=`i `<=`. Com que, internament, `sorted` crida a `<`, es dóna l'error.

Per tant, una primera manera d'ordenar estructures és usar el paràmetre `key` de `sorted` com ja havíem vist a !!!Enllaç per ordenar cada element segons el valor retornat per una funció. Per exemple:

```python
def nombre_de_segons(hora: Hora) -> int:
    """Retorna el nombre de segons acumulats en una hora."""
    return hora.s + hora.m * 60 + hora.h * 60 * 60

>>> sorted(L, key=nombre_de_segons)
[Hora(h=9, m=0, s=0), Hora(h=14, m=49, s=59), Hora(h=15, m=30, s=0), Hora(h=15, m=30, s=0)]
```

## Ordenació amb `cmp_to_key`

Moltes vegades, projectar un valor a un número per ordenar els valors es fa infactible però, en canvi, donats dos valors, és fàcil determinar quin ha de venir abans. En aquests casos, al `key` del `sorted` o `sort` es pot passar la funció que compara els dos valors a través de `functools.cmp_to_key`. Concretament, aquesta funció de comparació ha de retornar un valor zero si els dos elements són iguals, un valor negatiu si el primer és inferior al segon, i un valor positiu si el primer és superior al segon.

Vegen-me un exemple (que, essencialment, correspon al problema [P33147](https://jutge.org/problems/P33147) del Jutge):

Cal ordenar una llista de rectangles, cadascun definit per la seva amplada i la seva alçada. Com a primer criteri, els rectangles s'han d'ordenar de petit a gran en funció de l’àrea. En cas d’empat, els rectangles s'han d'ordenar de gran a petit en funció del perímetre. En cas d’un altre empat, primer el rectangle amb menys amplada.

Al programa següent, la funció `comparacio`, donats dos rectangles retorna:

   - un valor negatiu si el primer és inferior al segon,
   - zero si el primer és igual al segon,
   - un valor positiu si el primer és superior al segon.

La manera professional de fer-ho és seguint l'ordre dels criteris, deixant els empats per més tard.

Llavors, l'ordenació desitjada s'aconsegueix amb `sorted(L, key=cmp_to_key(comparació))`.



```python
from dataclasses import dataclass
from functools import cmp_to_key

@dataclass
class Rectangle:
    amplada: int
    alçada: int

def comparacio(r1: Rectangle, r2: Rectangle) -> int:
    a1 = r1.amplada * r1.alçada
    a2 = r2.amplada * r2.alçada
    if a1 != a2:
        return a1 - a2
    p1 = r1.amplada + r1.alçada
    p2 = r2.amplada + r2.alçada
    if p1 != p2:
        return p2 - p1
    return r1.amplada - r2.amplada

def main(): 
    L = [
        Rectangle(20, 1),
        Rectangle(2, 4),
        Rectangle(6, 6),
        Rectangle(4, 9),
        Rectangle(20, 1),
        Rectangle(9, 4),
    ]
    print(sorted(L, key=cmp_to_key(comparacio)))
```


<Autors autors="jpetit"/> 

