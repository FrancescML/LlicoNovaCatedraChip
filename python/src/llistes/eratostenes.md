# Garbell d'Eratòstenes

<img src='./eratostenes.png' style='height: 8em; float: right; margin: 0 0 1em 2em;'/>

En aquesta lliçó es considera de nou el problema de la primalitat. Aquest cop, però, enlloc de determinar si un nombre és primer o no, es presenta un algorisme que permet determinar tots els nombres primers fins a un valor donat. Aquest algorsime, conegut com el Garbell d'Eratòstenes, és molt més eficient que determinar si cada nombre és o no primer per separat.


## Descripció del problema i anàlisi d'una primera solució

[Anteriorment](/funcions/exemples-funcions.html) hem desenvolupat una funció que, donat un natural `n`, indica si `n` és o no un nombre primer. La idea era provar de trobar algun nombre entre 2 i `√n` que dividís `n`. Si s'en troba algun, és que el nombre és compost, altrament és primer. El codi era aquest:

```python
def es_primer(n: int) -> bool:
    """Indica si el natural n és primer o no."""

    if n <= 1:
        return False
    d = 2
    while d * d <= n:
        if n % d == 0:
            return False
        d = d + 1
    return True
```

Aquest cop volem resoldre un problema diferent però relacionat: Donat un natural `m`, volem determinar tots els nombres primers fins a `m`. Per exemple, si `m` val 26, caldria retornar 2, 3, 5, 7, 11, 13, 17, 19 i 23.

Aquest problema es podria resoldre a través d'una funció com aquesta:

```python
def primers(m: int) -> list[int]:
    """Donat un natural m, retorna la llista de tots els nombres primers de 0 a m."""
```

Fixeu-vos per tal de poder retornar un nombre variable de valors, aquesta funció retorna una llista d'enters. 

Com que ja tenim una funció que donat un nombre diu si és o no primer, podem implementar `primers` generant tots els nombres de 0 a `m` tot afegint a una llista els que són primers:

```python
def primers(m: int) -> list[int]:
    """Donat un natural m, retorna la llista de tots els nombres primers de 0 a m."""

    ps: list[int] = []
    for n in range(m + 1):
        if es_primer(n):
            ps.append(n)
    return ps
```

O, més elegantment, podem descriure la llista dels elements a retornar amb una llista per comprensió:

```python
def primers(m: int) -> list[int]:
    """Donat un natural m, retorna la llista de tots els nombres primers de 0 a m."""

    return [n for n in range(m + 1) if es_primer(n)]
```

La solució és perfectament correcta, senzilla i aprofita codi que ja tenim escrit. Malauradament, és força lenta: Al meu ordinador, trobar els 78498 nombres primers que hi ha fins a 1000000 triga 7,428 segons. Per mesurar aquests temps he creat un programa que simplement fa un `print(len(primers(1000000)))` i l'he executat amb la comanda `time` davant:

```bash
> time python3 primers.py 
78498
real    0m7,428s
user    0m7,359s
sys     0m0,022s
```

Es podria intentar reduir el temps a la meitat tractant només els nombres senars:

```python
def primers(m: int) -> list[int]:
    """Donat un natural m, retorna la llista de tots els nombres primers de 0 a m."""

    if m <= 1:      # cas especial
        return []
    else:
        return [2] + return [n for n in range(3, m + 1, 2) if es_primer(n)]
```

Però el temps no canvia gaire: Ara em triga 7,388 segons. És clar: pels nombres parells, la funció `es_primer` acaba de seguida. Per això la millora no és gens substancial. Potser també caldria no passar pels múltiples de 3, ni els de 5... És a dir, per cap múltiple d'un primer. Això ens condueix a la solució següent.


## El Garbell d'Eratòstenes

<img src='./sr-eratostenes.png' style='height: 8em; float: right; margin: 0 0 1em 2em;'/>
Per accelerar la cerca dels nombres primers, presentem l'algorisme anomenat el **Garbell d'Eratòstenes** (el Sedàs d'Eratòstenes). Aquest és un algorisme antic, la primera referència del qual s'ha trobat en un document del segle II que l'atribueix al matemàtic i astrònom grec Eratòstenes de Cirene, nascut al segle III aC. Eratòstenes era un crac: Una de les seves principals contribucions va ser l'estimació del diàmetre de la terra, a través de la mesura de l'angle de dues ombres, amb només un 2% d'error.

La idea de l'algorisme d'Eratòstenes per trobar tots els nombres primers fins a un determinat enter `m` és la següent:

- Primer, s'escriuen tots els nombres de 0 fins a `m`. El 0 i l'1 es ratllen, perquè no són primers. El primer no ratllat (el 2) és un nombre primer.

- Com que s'ha determinat que el 2 és un nombre primer, tots els nombres restants múltiples de 2 es ratllen, perquè no poden ser primers.

- Dels nombres que encara no han estat ratllats, el primer d'ells és un nombre primer. Per tant, tots els seus múltiples també es ratllen. Aquest pas es repeteix fins arribar a `m`.

Vegem-ho amb un exemple, triant `m = 26`. 

Primer, escrivim tots els nombres de 0 a 26 i ratllem el 0 i l'1:

<del>0</del> <del>1</del> 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26

El primer non ratllat és primer: el 2. Per tant, ratllem tots els múltiples de 2:

<del>0</del> <del>1</del> **2** 3 <del>4</del> 5 <del>6</del> 7 <del>8</del> 9 <del>10</del> 11 <del>12</del> 13 <del>14</del> 15 <del>16</del> 17 <del>18</del> 19 <del>20</del> 21 <del>22</del> 23 <del>24</del> 25 <del>26</del>

El següent nombre no ratllat (el 3) també ha de ser un primer. Per tant, ratllem tots els múltiples de 2 (alguns ja estaven ratllats):

<del>0</del> <del>1</del> **2** **3** <del>4</del> 5 <del>6</del> 7 <del>8</del> <del>9</del> <del>10</del> 11 <del>12</del> 13 <del>14</del> <del>15</del> <del>16</del> 17 <del>18</del> 19 <del>20</del> <del>21</del> <del>22</del> 23 <del>24</del> 25 <del>26</del>

El següent nombre no ratllat (el 5) també ha de ser un primer. Per tant, ratllem tots els múltiples de 5:

<del>0</del> <del>1</del> **2** **3** <del>4</del> **5** <del>6</del> 7 <del>8</del> <del>9</del> <del>10</del> 11 <del>12</del> 13 <del>14</del> <del>15</del> <del>16</del> 17 <del>18</del> 19 <del>20</del> <del>21</del> <del>22</del> 23 <del>24</del> <del>25</del> <del>26</del>

I ara ja no tenim cap més canvi. Per tant tots els nombres no ratllats (2, 3, 5, 7, 11, 13, 17, 19, 23) són els nombres primers fins a 26.

El final de l'algorisme es pot detectar quan el darrer primer considerat ja sigui més gran que `√m`. Ja sabem que a partir d'aquest punt no trobarem cap nou divisor pels nombres fins a `m` (hem usat aquesta propietat moltes vegades).

!!! Una animació quedaria de PM.


## Implementació

Per implementar l'algorisme del Garbell d'Eratòstenes, partirem la feina en dues parts. La primera part defineix la funció `eratostenes`, amb l'especificació següent:

```python
def eratostenes(m: int) -> list[bool]:
    """
    Retorna una llista de m+1 booleans tal que el valor a la posició i indica si i és o no és primer. 
    Prec: m >= 2.
    """
```

La precondició és senzillament per evitar casos degenerats. El valor retornat és la indicació, per a cada nombre entre 0 i `m` inclosos, de si està ratllat (fals) o no (cert). Per exemple, `eratostenes(26)` hauria de retornar `[False, False, True, True, False, True, False, True, False, False, False, True, False, True, False, False, False, True, False, True, False, False, False, True, False, False, False]`.  

A partir de la funció `eratostenes` és senzill implementar la funció `primers`:

```python
def primers(m: int) -> list[int]:
    """Donat un natural m, retorna la llista de tots els nombres primers de 0 a m."""

    if m <= 1: 
        return []
    else:
        garbell = eratostenes(m)
        return [n for n in range(m + 1) if garbell[n]]
```

La implementació de la funció `eratostenes` és més complexa, però es pot fer així:

```python
def eratostenes(m: int) -> list[bool]:
    """Retorna una llista de m+1 booleans tal que el valor a la posició i indica si i és o no és primer. Prec: m >= 2."""

    garbell = [False, False] + [True] * (m - 1)
    i = 2
    while i * i <= m:
        if garbell[i]:
            for j in range(2 * i, m + 1, i):
                garbell[j] = False
        i += 1
    return garbell
``` 

La llista `garbell` és una llista de `m + 1` booleans, indicant els nombres que encara poden ser primers. Al principi, tots els nombres poden ser primers, excepte el 0 i l'1. A continuació s'exploren tots els nombres `i` entre 2 i `√n`. Si el nombre `i` està "ratllat" (quan `garbell[i]` és fals), no cal fer res. Si no ho està (quan `garbell[i]` és cert), és que `i` és primer i, per tant, cal ratllar tots els seus múltiples, cosa que fa el bucle de les `j`.

Perfecte, ja ho tenim! Si executem `primers(26)` obtenim `[2, 3, 5, 7, 11, 13, 17, 19, 23]`, tal com cal. I ara, el temps per trobar els primers fins a 1000000 és de només 0,364 segons! 

La raó per la qual el Garbell d'Eratòstenes és molt més ràpid és que funciona per eliminació enlloc de per cerca de potencials divisors. Un fet sorprenent és que el Garbell no fa ni una sola divisió per establir quins nombres tenen o no tenen divisors! 

En moltes aplicacions on cal determinar nombres primers, es sol fer un precalcul inicial amb el Garbell d'Eratòstenes per determinar tots els primers prou grans. Segons què calgui fer pot ser més convenient guardar la llista dels primers o la llista dels booleans (o ambdues). 

**Exercici:** Què passaria si la condició del bucle principal d'`eratostenes` fós `while i <= m`? L'algorisme continuaria funcionant? Què passaria amb la seva eficiència? Penseu-ho i proveu-ho!


<Autors autors="jpetit"/> 


