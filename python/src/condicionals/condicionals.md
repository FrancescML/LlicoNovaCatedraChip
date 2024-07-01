# Condicionals


<img src='./if-then-else.png' style='height: 10em; float: right; margin: 2em 0 1em 1em;'/>

Aquest lliçó presenta la instrucció condicional, que permet
que l'ordinador executi certes instruccions o unes altres
depenent de si es dóna o no una determinada condició.
Gràcies a les instruccions condicionals, podem escriure programes
que prenguin decisions.
En Python aquesta instrucció s'escriu amb les paraules clau `if then else`.


## Màxim de dos enters

Considerem que volem fer un programa que llegeixi dos enters, diguem-ne `a` i `b`, i
que escrigui un enter, diguem-ne `m`, que sigui el més gran entre `a`
i `b` (és a dir, el màxim d'`a` i de `b`).

Utilitzant com a patró un programa anterior, podem escriure un programa
quasi complet com aquest:

```python
from yogi import read

# lectura de les dades d'entrada
a = read(int)
b = read(int)

# càlcul de m com el màxim d'a i de b
...

# escriptura del resultat
print(m)
```

El programa no està acabat, perquè encara no hem precisat com es calcula el resultat,
és a dir, quin ha de ser el valor d'`m` en funció dels valors d'`a` i de `b`. Com fer-ho?

Com que no hi ha cap operador que calculi directament el màxim entre dos nombres,
utilitzarem una **instrucció condicional**, la qual permet
executar una instrucció o una altra depenent d'una determinada condició.
En Python la instrucció condicional s'escriu usant les paraules clau `if`
i `else`, de la forma següent:

```python
if ⟨Condició⟩:
    ⟨Instruccions_SÍ⟩
else:
    ⟨Instruccions_NO⟩
```

El funcionament és senzill: Si es compleix la ⟨Condició⟩, s'executa
el bloc d'⟨Instruccions_SÍ⟩;
altrament, s'executa el bloc d'⟨Instruccions_NO⟩.
El diagrama de flux següent mostra el funcionament de la instrució
condicional:

<MyFlowChart src="flow-if-then-else.ts"/>

La part de l'`else`
és opcional: si no es proporciona, no es farà res quan no es compleixi la condició.
En aquest cas s'escriu així:

```python
if ⟨Condició⟩:
    ⟨Instruccions_SÍ⟩
```

El diagrama de flux següent mostra el funcionament de la instrució
condicional sense `else`:

<MyFlowChart src="flow-if-then.ts"/>

Fixeu que les instruccions ⟨Instruccions_SÍ⟩ i ⟨Instruccions_NO⟩ s'escriuen **indentades**, és a dir,
més a la dreta (típicament amb quatre espais). D'aquest forma l'ordinador pot saber quan comencen i quan acaben
i els humans poden fer-s'en càrrec visualment.

Així, per calcular el màxim entre `a` i `b`, podem utilitzar la instrucció condicional
de la forma següent:

```python
if a > b:
    m = a
else:
    m = b
```

Aquest fragment diu que quan el valor d'`a` sigui més gran que el de `b`,
cal copiar el valor d'`a` a la variable `m`. Altrament (és a dir, quan
el valor d'`a` sigui menor o igual que el de `b`), cal copiar el valor
de `b` a la variable `m`. En qualsevol dels dos casos, el valor final de `m`
serà el màxim entre els valors d'`a` i de `b`, tal com cal.

El programa complet queda doncs així:

```python
from yogi import read

# lectura de les dades d'entrada
a = read(int)
b = read(int)

# calcul de m com el màxim d'a i de b
if a > b:
    m = a
else:
    m = b

# escriptura del resultat
print(m)
```

En aquest programa hem escrit la condició de la instrucció condicional utilitzant l'operador
`>`, que indica si el primer valor és més gran que el segon. També existeixen els operadors
`<` (més petit que), `>=` (més gran o igual que), `<=` (més petit o igual que),
`==` (igual que) i `!=` (diferent de). Aquests operadors s'anomenen **operadors relacionals** i es dónen a la taula següent:

operador | significat
---------|------------
`==`      | igual
`!=`      | diferent
`<`      | menor estricte
`>`      | major estricte
`<=`      | menor o igual
`>=`      | major o igual

👁️
Fixeu-vos que `x == y` (amb dos iguals)
compara si els valors de `x` i de `y` són iguals,
mentre que `x = y` (amb un sol igual) assigna a `x` el valor de `y`. No els confongueu.

👁️
Alguns editors mostren símbols com ara `<=` com a `≤`, perquè estèticament és més plaent. Igualment cal picar <kbd>&lt;</kbd><kbd>=</kbd>.


## Exercici

A continuació presentem algunes alternatives pel programa
anterior. Podrieu diferenciar les correctes de les incorrectes?


```python
# Fragment 1: Correcte o incorrecte?
if a >= b:
    m = a
else:
    m = b
```


```python
# Fragment 2: Correcte o incorrecte?
if a < b:
    m = b
else:
    m = a
```


```python
# Fragment 3: Correcte o incorrecte?
if a <= b:
    m = b
else:
    m = a
```


```python
# Fragment 4: Correcte o incorrecte?
if a > b:
    m = a
if b >= a:
    m = b
```

```python
# Fragment 5: Correcte o incorrecte?
if a > b:
    m = a
if a < b:
    m = b
```

::: details Piqueu per veure la solució
Tots són correctes, excepte el fragment 5. Aquest fragment no és correcte perquè quan `a` és igual que `b` no s'executa cap de les dues instruccions i, per tant, `m` no queda definit.
:::


## Mínim i màxim de dos enters

Suposem que ara volem fer un programa que llegeixi dos nombres,
i que n'escrigui el mínim i el màxim en una línia,
separats per un espai.
Aquesta n'és una possible solució (noteu que sovint ometem
l'`import` per estalviar espai):

```python
a = read(int)
b = read(int)
if a < b:
    minim = a
    maxim = b
else:
    minim = b
    maxim = a
print(minim, maxim)
```

Una altra possible implementació seria prescindir de les variables
`maxim` i `minim` i escriure els valor d'`a` i `b`
en l'ordre correcte:

```python
a = read(int)
b = read(int)
if a < b:
    print(a, b)
else:
    print(b, a)
```

Per a un programa tan curt com aquest, qualsevol de les solucions és
igualment acceptable, però en programes un xic més llargs sovint és convenient
no barrejar els càlculs amb l'escriptura dels resultats.


## Màxim de quatre enters

Ara suposem que volem fer un programa que llegeixi quatre nombres,
i que n'escrigui el màxim. Aquesta és una solució possible:

```python
a = read(int)
b = read(int)
c = read(int)
d = read(int)
if b > a:
    a = b
if c > a:
    a = c
if d > a:
    a = d
print(a)
```

Fixem-nos en el primer `if`:

```python
if b > a:
    a = b
```

El que fa aquesta línia és actualitzar el valor d'`a` si `b` és més gran.
Altrament, no fa res (perquè no hi ha la branca de l'`else`;
recordeu que és opcional).
El resultat és que després d'executar aquesta línia,
`a` conté el màxim entre els valors inicials d'`a` i de `b`.
Similarment, després del segon `if`,
`a` conté el màxim entre els valors inicials d'`a`, `b` i `c`.
I, després de l'últim `if`,
`a` conté el màxim dels quatre nombres llegits,
és a dir, el resultat demanat,
que ja es pot escriure.

En aquesta solució no hem usat explícitament cap variable per guardar la
sortida, sinó que hem aprofitat una de les variables d'entrada per fer-ho
(`a`, concretament). Això és lícit en aquest cas, perquè el valor original de les
variables d'entrada no ens cal guardar-lo. En programes un xic més llargs això pot ser detrimental.


## Condicionals aniuats

Suposem que volem un programa que llegeixi un nombre i digui si és positiu, negatiu o zero.
Tenint en compte el que hem explicat, podríem escriure'l així:

```python
x = read(int)
if x > 0:
    print('positiu')
else:
    if x < 0:
        print('negatiu')
    else:
        print('zero')
```

Fixeu-vos que, en aquest cas, la instrucció corresponent al primer `else` (quan `x >= 0`) és un nou condicional.
En diuem **condicionals aniuats**. Observeu com la relació d'aniuament es pot veure a través de la indentació.

El programa es podria escriure de moltes altre formes. Per exemple, la solució següent aniua el segon condicional en cos del primer `if`:

```python
x = read(int)
if x >= 0:
    if x == 0:
        print('zero')
    else:
        print('positiu')
else:
    print('negatiu')
```

Per tal de disminuir l'aniuament dels programes (l'aniuament és útil però complica la lectura del programa),
en Python existeix la instrucció `elif` que és una contracció de `else if`s i no necessita un nou nivell d'indentació:

```python
x = read(int)
if x > 0:
    print('positiu')
elif x < 0:
    print('negatiu')
else:
    print('zero')
```

Així, primer s'avalua la condició `x > 0`. Si és certa s'escriu `positiu` i el bloc condional acaba.
Sinó, s'avalua la condició `x < 0`. Si aquesta és certa s'escriu `negatiu` i el bloc condional acaba.
Sinó (quan no es té `x > 0` ni `x < 0`), s'escriu `zero` i el bloc condional acaba.

Aquesta és l'estructura general i el flux de l'instrucció condicional, els nombre de `elif`s és arbitrari i el `else` opcional:

```python
if ⟨Condició_1⟩:
    ⟨Instruccions_1⟩
elif ⟨Condició_2⟩:
    ⟨Instruccions_2⟩
elif ⟨Condició_3⟩:
    ⟨Instruccions_3⟩
else:
    ⟨Instruccions_SINÓ⟩
```

<MyFlowChart src="flow-if-elif.ts"/>




<Autors autors="jpetit roura"/>