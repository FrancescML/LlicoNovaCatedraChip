# Funcions

<img src='./funcions.png' style='height: 8em; float: right; margin: 0 0 1em 1em;'/>

Aquesta lliçó presenta com definir funcions pròpies. Una **funció** és un subprograma
que, a partir de diverses entrades, en calcula un resultat. Ens podem
imaginar una funció com una màquina que transforma entrades en
sortides. Al contrari dels programes, les funcions habitualment no
interaccionen directament amb l'usuari llegint les dades del canal
d'entrada i/o escrivint els resultats corresponents pel canal de
sortida.

Les funcions són un mecanisme fonamental per descompondre un programa
en diferents subprogrames i, per tant, per solucionar un problema
complex utilitzant solucions a problemes més senzills. Les funcions
permeten escriure programes més llegibles i estructurats, i més fàcils
de corregir i millorar. I, encara que en aquest curs bàsic no ho
veurem, les funcions proporcionen també una manera de compartir codi
entre diferents projectes.




## Funció per al màxim de dos enters

Considerem que volem escriure una funció pròpia per calcular el màxim de dos enters. Sí... aquesta funció ja existeix com la funció predefinida `max`, però ens anirà veure com està feta.

Primer comencem amb **la capçalera** de la funció, que també s'anomena **declaració** o **interfície**:

```python
def maxim2(a: int, b: int) -> int:
    ...
```

Aquesta capçalera informa de les característiques següents:

- El nom de la funció és `maxim2`.
- Aquesta funció té dos paràmetres, el primer s'anomena `a` i és de tipus enter, el primer s'anomena `b` i també és de tipus enter.
- El resultat de la funció és de tipus enter.

És un bon costum escriure quin és el propòsit de cada funció en una nota anomenada **especificació**. En Python, això es fa amb una *docstring*, que és un text situat darrera la capçalera. Com que sovint aquestes especificacions són llargues i ocupen més d'una línia, s'escriu entre tres cometes dobles:

```python
def maxim2(a: int, b: int) -> int:
    """Calcula el màxim de dos enters."""
    ...
```

A continuació, es dóna **el cos** de la funció:

```python
def maxim2(a: int, b: int) -> int:
    """Calcula el màxim de dos enters."""

    if a > b:
        m = a
    else:
        m = b
    return m
```


Fixeu-vos com el cos d'aquesta funció és molt semblant
al d'un programa que calcula el màxim de dos enters
i deixa el resultat en `m` però,
en lloc d'escriure després el valor de `m` amb un `print`,
la funció retorna aquest valor amb un `return`.

El `return` indica que la funció ha acabat la seva feina
i que lliura com a resultat l'expressió que té a la seva dreta.
En aquest cas, la funció `maxim2` senzillament retorna el valor de `m`.

De fet, podem simplificar el cos una mica estalviant-nos la variable `m`
amb dos `return`, un per a cada branca del condicional:

```python
def maxim2(a: int, b: int) -> int:
    """Calcula el màxim de dos enters."""

    if a > b:
        return a
    else:
        return b
```

Fins i tot podem eliminar l'`else` perquè,
en trobar un `return`, la funció acaba la seva feina i lliura el resultat immediatament,
sense continuar executant la resta de codi que tingui a continuació:

```python
def maxim2(a: int, b: int) -> int:
    """Calcula el màxim de dos enters."""

    if a > b:
        return a
    return b
```

Per utilitzar una funció des d'una part del programa cal **invocar-la** de la mteixa manera que hem fet amb les funcions predefinides.
Aquest programa complet pot servir per provar la funció `maxim2`:

```python
def maxim2(a: int, b: int) -> int:
    """Calcula el màxim de dos enters."""

    if a > b:
        return a
    else:
        return b

print(maxim2(34, 67))
```


## Funció per al màxim de tres enters

Ara volem fer una funció que, donats tres enters, diguem-ne `a`, `b` i `c`, en retorni el més gran. La seva capçalera i especificació podria ser

```python
def maxim3(a: int, b: int, c: int) -> int:
    """Calcula el màxim de tres enters."""
```

Per implementar el cos d'aquesta funció hi ha, bàsicament, dues solucions:

1. La primera consisteix a fer una anàlisi per casos fent servir condicionals, i té moltes variacions possibles. Aquesta n'és una de prou clara:

    ```python
    def maxim3(a: int, b: int, c: int) -> int:
        """Calcula el màxim de tres enters."""

        if a >= b and a >= c:
            return a
        elif b >= a and b >= c:
            return b
        else:
            return c
    ```

2. La segona, més astuta, consisteix a aprofitar que ja tenim escrita una funció `maxim2` i que, per tant, la podem usar! Aquesta seria una manera de fer-ho:

    ```python
    def maxim3(a: int, b: int, c: int) -> int:
        """Calcula el màxim de tres enters."""

        return maxim2(maxim2(a, b), c)
    ```

    Com aquest codi demostra, una funció pot invocar una altra funció. No només això, la pot invocar dues o més vegades, i amb paràmetres diferents. Altrament dit, els subprogrames poden usar lliurement altres subprogrames.

Malgrat que la primera solució no és excessivament complicada,
la segona és encara més senzilla i, per tant, preferible.
Dissenyar funcions que resolen tasques cada cop més complexes
aprofitant funcions més simples
és una excel·lent pràctica de disseny.

Per referència, aquest és el programa complet
que llegeix tres enters i n'escriu el màxim utilitzant la funció `maxim3()` que,
alhora, utilitza la funció `maxim2()`:


```python
from yogi import read

def maxim2(a: int, b: int) -> int:
"""Calcula el màxim de dos enters."""

    if a > b:
        return a
    else:
        return b


def maxim3(a: int, b: int, c: int) -> int:
    """Calcula el màxim de tres enters."""

    return maxim2(maxim2(a, b), c)

# programa principal
x = read(int)
y = read(int)
z = read(int)
print(maxim3(x, y, z))
```

En Python, l'ordre de definició de les funcions no és rellevant, però el programa principal ha d'anar al final.



## Paràmetres formals i paràmetres reals

Ja heu vist que quan s'escriu la capçalera d'una funció, s'enumeren els seus
paràmetres, tot donant el seu nom i el seu tipus. Aquests paràmetres es diuen
**paràmetres formals** i serveixen per anomanar les dades d'entrada a la funció.
També m'agrada pensar que "donen forma" a la funció. Per exemple,
a la funció següent,

```python
def maxim2(a: int, b: int) -> int: ...
```

`a` i `b` són  els seus paràmetres formals. El cos de la funció utilitzarà `a` i `b` per
referir-se als valors sobre els quals ha de treballar quan se la invoqui.

Justament, quan s'invoca a una funció, cal passar els valors necessaris que rebran els paràmetres formals. Aquests paràmetres que s'utilitzen al invocar una funció es diuen **paràmetres reals** (o **arguments**). M'és útil pensar que els paràmetres reals són els valors sobre els quals la funció "realment" ha de treballar.

Per exemple,
en l'expressió `(maxim2(10, x) + maxim2(x, x + y)) / 2`
hi ha dues invocacions a `maxim2`. A la primera,
els paràmetres reals són `10` i `x`; a la segona
els paràmetres reals són `x` i `x + y`. De fet, els paràmetres reals són el resultat d'aquestes expresions, ja que els paràmetres reals són valors.

Al invocar una funció, el valor dels paràmetres reals es transmeten
als paràmetres formals:

- A la primera invocació, el paràmetre formal `a` rebrà el valor `10`
i el paràmetre formal `b` rebrà el valor que tingui la variable `x` en aquell moment.

- A la segona invocació, el paràmetre formal `a` rebrà el valor de `x`
i el paràmetre formal `b` rebrà la suma dels valors de `x` i de `y`.

Fixeu-vos que els paràmetres formals són expressions que produeixen un valor
(`10` o `x` o `x + y`). En canvi, els paràmetres formals són noms de variables
amb llur tipus.

Les variables dels paràmetres formals reben els valors dels paràmetres reals corresponents quan la funció comença, igual que si se'ls fés una assignació. De fet, Python fa una assignació per cada paràmetre.


## Els paràmetres formals i les variables són locals a les funcions

Considereu el programa següent, que és una variació d'algun dels anteriors:


```python
from yogi import read

def maxim2(a: int, b: int) -> int:
"""Calcula el màxim de dos enters."""

    if a > b:
        m = a
    else:
        m = b
    return m


def maxim3(a: int, b: int, c: int) -> int:
    """Calcula el màxim de tres enters."""

    m = maxim2(maxim2(a, b), c)
    return m

# programa principal
a = read(int)
b = read(int)
c = read(int)
print(maxim3(a, b, c))
```

En aquest programa hi ha dues variables `m`, una dins de la funció
`maxim2()` i una altra dins de la funció `maxim3()`. Malgrat que aquestes
dues variables tenen el mateix nom, són dues variables distintes. És a
dir, cada variable pertany a la funció dins la qual està definida. Diem
que aquestes variables són **variables locals**.

La localitat de les variables és molt útil perquè, quan s'escriu una
funció, no es vol haver de consultar els noms de variables que puguin
haver-hi en altres funcions (que potser ni tan sols ha escrit el mateix
programador!).

Els paràmetres formals també són locals: Els paràmetres `a` i `b` de `maxim2()` no
tenen res a veure amb els paràmetres `a` i `b` de `maxim3()`. De fet, a la
primera invocació de `maxim2()` a  `maxim3()`, el valor de `b` de `maxim3()` es
copia al paràmetre `a` de `maxim2()`, i el valor de `c` de `maxim3()` es copia
al paràmetre `b` de `maxim2()`. I, a la segona invocació de `maxim2()` a
`maxim3()`, el valor d'`a` de `maxim3()` es copia al paràmetre `a` de `maxim2()`
(és una pura coïncidència que es diguin iguals) i el valor d'`m` de
`maxim3()` es copia al paràmetre `b` de `maxim2()`.

Igualment, el fet que les tres variables del programa principal es diguin `a`,
`b` i `c` és només una coïncidència amb que els tres paràmetres de
`maxim3()` també es diguin `a`, `b` i `c`. Ara bé, aquestes tres variables, com que no pertanyen a cap funció, s'anomenen **variables globals** i en parlarem d'elles més endavant.

De fet, no hi ha una sola variable `m` per a la funció `maxim2()`, sinó
que n'hi haurà una diferent cada vegada que s'invoqui la funció. El
sistema d'execució s'encarrega de mantenir totes aquestes variables
mentre calen, i de reciclar-ne la memòria quan esdevenen innecessàries.

Si us costa una mica entendre aquesta secció, contineu i ja hi tornareu
més endavant. Al cap i a la fi,  el que cal saber és que tot està
pensat perquè els noms de les variables i els paràmetres de les
funcions no interfereixin entre si.


## Errors freqüents

En aquesta secció comentarem dos errors freqüents que
se solen cometre en començar a utilitzar funcions.


- **Llegir les dades amb un `read` en lloc de rebre-les com a paràmetres,
  o escriure el resultat amb `print` en lloc de retornar-lo.**

    Per exemple, aquest programa violaria aquests preceptes:

    ```python
    def valor_absolut(x: float) -> float
        """Retorna el valor absolut d'un real."""
        x = read(float)       # 😬 el valor d'x no s'ha de llegir, és un paràmetre!
        if x >= 0:
            y = x
        else:
            y = -x
        print(y)              # 😬 el valor de y no s'ha d'escriure, s'ha de retornar!
    ```

    La versió correcta seria

    ```python
    def valor_absolut(x: float) -> float
        """Retorna el valor absolut d'un real."""
        if x >= 0:
            y = x
        else:
            y = -x
        return y
    ```

    O, més breument:

    ```python
    def valor_absolut(x: float) -> float
        """Retorna el valor absolut d'un real."""
        if x >= 0:
            return x
        else:
            return -x
    ```

    Nota: Més endavant, quan en sapiguem més, trencarem aquesta regla i farem
    funcions que sí que llegeixin o escriguin per l'entrada/sortida. Per ara, però,
    fer això seria símptoma d'haver-nos equivocat.


- **Donar els tipus dels paràmetres reals.**

    Recordeu que hi ha dos tipus de paràmetres: els *paràmetres formals* que
    ajuden a definir el cos d'una funció i els *paràmetres reals* que són els
    valors sobre els quals es vol invocar una funció. Convé no barrejar els dos
    i adonar-se que només es dónen els tipus als paràmetres formals.

    Per exemple, si disposem de la funció

    ```python
    def maxim2(a: int, b: int) -> int:
    ```

    no l'hem d'invocar amb invents com aquest:

    ```python
    m = maxim2(x: int, 4: int)
    ```

    Els tipus es posen a les declaracions de funcions, no a les invocacions.


## Funcions sense anotacions de tipus

Una darrera observació: En Python no és obligatori anotar els tipus de les funcions i dels seus paràmetres. Hom podria, per exemple, definir la funció `maxim2` així:

```python
def maxim2(a, b):
    """Calcula el màxim de dos enters."""

    if a > b:
        return a
    else:
        return b
```

Malgrat que aquesta pràctica és legal, no anotar els tipus implica haver de documentar més extansament el codi i impossibilita fer comprovacions estàtiques de tipus amb eines com mypy o Pylance. Per això, en aquest curs, sempre anotarem els tipus de totes les funcions.


<Autors autors="jpetit"/> 

