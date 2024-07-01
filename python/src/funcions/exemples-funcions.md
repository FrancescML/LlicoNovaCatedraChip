# Exemples de funcions

<img src='./exemples-funcions.png' style='height: 9em; float: right; margin: 0 0 1em 1em;'/>

En aquesta lliçó es presenten diversos exemples de funcions. Els exemples inclouen funcions per calcular del factorial, determinar si un nombre és primer, calcular el màxim comú divisor i calcular el màxim comú múltiple. A més, en aquesta lliçó es mostra com pensar jocs de proves per provar les funcions i presenta el concepte de precondició d'una funció.



## Funció per al factorial

Recordeu ([aquí](/iteracions/factorial.html)) que ja hem escrit un programa complet que llegeix un natural i n'escriu el seu factorial. Seria més convenient que el càlcul del factorial es faci dins d'una funció. La capçalera podria ser la següent:

```python
def factorial(n: int) -> int:
    """Retorna el factorial d'un natural n."""
```

És a dir, el nom de la funció és `factorial`, té un sol paràmetre enter anomenat `n`, i retorna un enter. A més, a la documentació hem pres cura d'indicar que `n` ha de ser un natural, ja que el factorial dels enters negatius no està ben definit.

El cos de la funció és fàcil d'escriure ara que en coneixem l'algorisme:

```python
def factorial(n: int) -> int:
    """Retorna el factorial d'un natural n."""

    f = 1
    for i in range(1, n + 1):
        f = f * i
    return f
```

Aquesta funció calcula el factorial de `n` tot multiplicant una variable `f` per `i`, per a tots els `i` entre 1 i `n` (recordeu que el `range` no arriba al darrer valor indicat, d'aquí el `n + 1`). Fixeu-vos que `factorial(0)` retorna `1`, tal com cal.


## Provant la funció factorial

Per tal de provar aquesta funció podem escriure un programa principal que llegeixi un nombre i escrigui el seu factorial. N'hi hauria prou amb això:

```python
print(factorial(read(int)))
```

Per provar una sola funció, això ja pot ser útil, però sovint cal provar un conjunt de funcions i fer proves més específiques. En aquests casos, és millor obrir l'intèrpret de Python, importar-hi el programa i cridar les funcions interactivament des de l'intèrpret. Segurament la manera més pràctica és fer un `from programa import *` on `programa.py` és el nom del fitxer on s'ha guardat la funció.


## Jocs de proves

Quins valors triar per provar que `factorial` calculi correctament els factorials? De ben segur que podríem comprovar si el factorial d'un nombre com ara 5 és 120, però això és insuficient. Cal acostumar-se a provar també **casos extrems** (*edge cases* en anglès). En efecte, si bé ,molts programes funcionen correctament en valors "normals", els errors es solen donar en valors especials. Aquests valors especials es poden intentar identificar considerant el domini del problema i els càlculs de l'algorisme utilitzat. En el cas del factorial, els valors extrems serien `n` = 0 (perquè tothom considera que el factorial de zero és una mica estrany), i `n` = 1 i  `n` = 2, perquè son els valors més petits on les inicialitzacions del bucle poden haver estat mal triades.

Cal anar desenvolupant "un nas" per identificar aquests casos extrems. A més, és convenient preparar-se uns **jocs de proves** amb una col·lecció d'entrades i de sortides correctes associades i desar-lo a prop del codi que hem desenvolupat.

Pel què hem explicat, el joc de proves per la funció factorial seria el següent:

```python
>>> factorial(0)
1
>>> factorial(1)
1
>>> factorial(2)
2
>>> factorial(5)
120
```




## Funció per determinar si un nombre és primer o no

Considerem ara un exemple de funció que retorna un booleà.

Recordeu que un nombre natural és **primer**, si és més gran que 1 i només es pot dividir per dos nombres: 1 i ell mateix. Així, els primers nombres primers són 2, 3, 5, 7, 11, 13, 17, 19, ... En una lliçó anterior ENLLAÇ!!! ja vam desenvolupar l'algorisme per determinar si un nombre és primer o no. Per tal de fer aquesta peça més independent i reusable, volem encapsular aquell càcul en una funció que, donat un nombre natural, indiqui si aquest és o no és un nombre primer.

El primer pas és escriure'n la capçalera:

```python
def es_primer(n: int) -> bool:
    """Indica si el natural n és primer o no."""
```

És a dir, el nom de la funció és `es_primer`, aquesta funció té un sol paràmetre enter anomenat `n`, i aquesta funció retorna un valor booleà, que indica si `n` és o no primer. A més, hem pres cura d'indicar que és necessari que el valor de `n` sigui un natural a l'especificació, ja que no té sentit determinar la primalitat d'enters negatius.

Recordeu que l'algorisme busca un divisor de `n` entre 2 i `√n`. Si el troba, és que el nombre no és primer. Si no el troba, és que el nombre és primer. Hi havia uns casos especials pel 0 i l'1 que calia tenir en compte explícitament. Fent ara un bon ús dels booleans i del `return`, la funció associada queda escrita així:

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

Recordeu que un cop es troba el `return` d'una funció, aquesta retorna immediatament el resultat indicat i no continua executant més codi (fins i tot si en té darrera o si es troba en mig d'un bucle).

Quins jocs de proves fer per comprovar el bon comportament d'aquesta funció? Per començar, es podria comprovar que funcioni correctament per un nombre primer qualsevol, per exemple el 19. Igualment, es podria comprovar que funcioni bé per un nombre compost per un producte de dos primers, per exemple per 323 (ja que 323 = 19·17). Aquestes dues comprovacions donarien certa confiança de que el programa funciona correctament per valors "normals". Els casos extrems del domini, els hauríem de buscar per valors petits, com 0, 1 i 2. No costaria gens afegir el 3 i 4, oi? Però durant l'explicació de l'algorisme també vam veure que hi havia uns casos un xic delictats que eren els quadrats perfectes. Per tant, seria bo de provar casos com els nombres 25 i 49. Finalment, és fàcil buscar per Internet la llista dels nombres primers fins al 20, per tant podríem escriure un bucle que els escrigui i comprovar que coïncideixen amb aquesta font externa.

Aquests podrien ser doncs els jocs de proves que hem creat:

```python
>>> es_primer(19)
True
>>> es_primer(323)
False
>>> es_primer(0)
False
>>> es_primer(1)
False
>>> es_primer(2)
True
>>> es_primer(3)
True
>>> es_primer(4)
True
>>> for i in range(20): if es_primer(i): print(i)
2
3
5
7
11
13
17
19
```

Evidentment cap joc de proves finit ens assegurarà que la implementació és exempta d'errors però, com a mínim, disposar d'un bon joc de proves com l'anterior dóna una certa confiança.



## Funció per al màxim comú divisor

Recordeu que [l'algorisme d'Euclides](/iteracions/maxim-comu-divisor.html) és una forma molt eficient de trobar el màxim comú divisor (mcd) de dos naturals. Com que, quan es programa, no és infreqüent haver de calcular el mcd, resulta convenient tenir-ne el codi encapsulat dins d'una funció. Aquesta, anomenem-la `mcd`, hauria de rebre com a paràmetres els dos nombres enters en qüestió, i hauria de retornar un enter (el seu mcd). Per tant, podem definir la seva capçalera de la forma següent:

```python
def mcd(x: int, y: int) -> int: 
    ...
```

Recordeu que el mcd de dos nombres no està ben definit si algun dels nombres és negatiu (i que val 0 quan ambdós són zero). Per deixar clar que la funció `mcd` només es pot aplicar sobre enters *positius*, afegirem una *docstring* que així ho especifiqui:

```python
def mcd(x: int, y: int) -> int: 
    """Retorna el màxim comú divisor de dos enters x i y, amb x ≥ 0 i y ≥ 0."""
```

Les condicions que han de satisfer les entrades d'una funció per tal de
poder-de executar correctament s'anomenen **precondicions**.
És responsabilitat del
programador verificar que els valors amb què invoca les funcions
compleixen les seves precondicions. Si una precondició no es compleix,
l'efecte de la funció és indefinit: potser funciona, potser no, potser es
penja, potser peta el programa, ... o, fent broma,
potser explota l'ordinador, potser moren dos gatets
(😿😿️), potser es fon un reactor nuclear (💥), ...

Quan els programsirs volen emfatitzar les precondicions solen usar un format com el següent:

```python
def mcd(x: int, y: int) -> int: 
    """
    Retorna el màxim comú divisor de dos naturals x i y.
    
    Prec: x ≥ 0 i y ≥ 0.
    """
```


La definició del cos de la funció `mcd` implementa l'algorisme d'Euclides, igual que ja havíem vist anteriorment, i en retorna el resultat:

```python
def mcd(x: int, y: int) -> int: ...
    """Retorna el màxim comú divisor de dos enters x i y, amb x ≥ 0 i y ≥ 0."""
    
    while y != 0:
        r = x % y
        x = y
        y = r
    return x
```

Fixeu-vos (una vegada més) que aquesta funció ni llegeix el valor de `x` i de `y` usant `read`, ni escriu el seu resultat `x` amb `print`. Això és perquè els valors de `x` i `y` els reb com a paràmetres, i el resultat el lliura amb un `return`.

Aquest és un possible joc de proves per testejar la funció `mcd`:

```python
>>> mcd(42, 56) 
14
>>> mcd(461952, 116298) 
18
>>> mcd(7966496, 314080416) 
32
>>> mcd(24826148, 45296490) 
526
>>> mcd(12, 0) 
12
>>> mcd(1, 1) 
1
>>> mcd(0, 0) 
0
>>> mcd(0, 9) 
9
```


## Funció per al mínim comú multiple

Considerem ara el problema de calcular el mínim comú multiple (mcm) de dos naturals $x$ i $y$ (suposant que no són ambdós zero). Probablement recordareu que

$$
    \text{mcm}(x,y) = \dfrac{x·y}{\text{mcd}(x,y)}.
$$

Per tant, podem implementar una funció `mcm` ben senzillament utilitzant la funció `mcd` que hem definit anteriorment, de la forma següent:

```python
def mcm(x: int, y: int) -> int:
    """Retorna el mínim comú multiple de dos naturals x i y, amb x + y > 0."""

    return x * y // mcd(x, y);
```

Però aquesta implementació té una feblesa: si `x` i `y` són grans, el seu producte també ho serà. Per evitar operar amb nombres potencialment grans, podem rescriure la fórmula anterior com a

$$
    \text{mcm}(x,y) = \dfrac{x·y}{\text{mcd}(x,y)} = \dfrac{x}{\text{mcd}(x,y)} · y
$$

i, aprofitant que la divisió de `x` i pel mcd segur que serà entera (penseu per què!), podem escriure la funció de la forma següent:

```python
def mcm(x: int, y: int) -> int:
    """Retorna el mínim comú multiple de dos naturals x i y, amb x + y > 0."""
    
    return (x // mcd(x, y)) * y
```

Així els nombres en els càlculs intermitjos no creixen tant.



<Autors autors="jpetit"/> 

