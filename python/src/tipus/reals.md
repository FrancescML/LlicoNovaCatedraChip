
# El tipus real

<img src='./float.png' style='height: 8em; float: right; margin: 0 0 1em 1em;'/>


El tipus dels reals en Python s'escriu `float`. En aquesta llicó es mostra com s'escriuen els literals reals, quins valors poden tenir els valors reals i quines operacions se'ls pot aplicar. A més, també s'esmenten alguns problemes de precisió que poden patir les dades reals. Per acabar, es presenta un petit programa que manipula nombres reals.


# Nombres de coma flotant

El tipus dels reals en Python s'escriu `float`. Aquest paraula prové del terme *coma flotant*, que és una codificació utilitzada pels computadors per emmagatzemar nombres reals.

!!! Algún dia els explicaré amb més detall.


## Literals

La manera d'escriure els reals en Python és usant la notació habitual amb punt decimal. Per exemple, `3.14`, `-12434.9` o `0.0`. El zero a l'esquerra o dreta del punt decimal es pot obviar: `0.` o `.0` també representen el nombre real zero. També es pot utilitzar la notació científica per expressar nombres molt grans o molt petits. Per exemple, el nombre d'Avogadro es pot escriure com a `6.02252e23` que val $6,02252 · 10^{23}$.


## Valors

Els possibles valors del tipus real serien, idealment, tots els nombres reals (el conjunt $\mathbb{R}$ en matemàtiques). Malauradament, els computadors digitals no poden representar tots aquests nombres. Per això, només treballen amb *aproximacions* d'aquests nombres mitjantçant la tècnica de la coma flotant. La raó és clara: alguns nombres reals com ara 2/3 o π tenen una infinitat de dígits decimals que no poden ser emmagatzemats. Si bé en molts casos això no és greu, a vegades cal ser una mica curós ja que es poden donar problemes de precisió.


## Operacions

Les principals operacions internes del tipus real són les de tota la vida:

|símbol|operació|
|---|---|
|`+`|suma|
|`-`|resta (binari)|
|`-`|canvi de signe (unari)|
|`*`|producte|
|`/`|divisió entera|
|`**`|exponenciació|

Recordeu que dividir per zero és un error de programació.

Igual per pels enters, els reals disposen d'operadors relacionals que retornen un booleà:

|símbol|operació|
|---|---|
|`==`|igualtat|
|`!=`|diferència|
|`<`|menor estricte|
|`>`|major estricte|
|`<=`|menor o igual|
|`>=`|major o igual|


## Problemes de precisió

Com que els computadors emmagatzemen els nombres reals en coma flotant, aquests no sempre són exactes, sempre són una aproximació prou propera. Per exemple, el resultat de `0.1 + 0.2` dóna `0.30000000000000004` i no `0.3` com hom esperaria. I, a sobre, aquests petits errors es propaguen a través dels càlculs successius! 

Conseqüentment, les regles bàsiques de l'àlgebra no sempre es compleixen: Quan `a` i `b` són dos `float`s, pot ser que `a * b != b * a` 😩. Contempleu la tragèdia:

```python
>>> 0.1 + 0.2 == 0.3
False
```

Per això, moltes vegades cal que les operacions de comparació entre reals donin un petit marge de seguretat. Així, per saber si `x` i `y` són dos reals iguals, enlloc de preguntar si `x == y`, és més prudent preguntar si `abs(x - y) < ε`, on `ε` és un valor prou petit (en relació a `x` i `y`), com ara `1e-9` (una milionèsima).


## Aplicació: conversió de graus Celcius a graus Farenheit

El petit programa següent mostra com convertir graus Celcius a graus Farenheit (cal multiplicar per 9/5 i sumar 32):

```python
import yogi

celcius = yogi.read(float)
farenheit = celcius * 9 / 5 + 32
print(farenheit)
```

Aquest cop, la operació de lectura amb `read` especifica que cal llegir un real. Per tant, el tipus de la variable `celcius` és `float`. L'expressió `celcius * 9 / 5 + 32` també retorna un real, recordeu que els valors enters es converteixen automàticament a reals quan s'han d'operar amb altres reals. Per tant, el tipus de la variable `farenheit` també és `float`. Finalment, s'escriu el resultat.

De fet, perquè el resultat quedi escrit d'una forma més elegant, es poden utilitzar textos amb format com es veu a continuació:

```python
import yogi

celcius = yogi.read(float)
farenheit = (C * 9 / 5) + 32
print(f'{celcius:.2f} graus Celcius són {farenheit:.2f} graus Farenheit')
```

En un text en format, l'ús de l'etiqueta `f` darrera els `:` indica `float` (`d` era per enters). A més, el `.2` indica que cal escriure el nombre amb 2 dígits decimals darrera el punt decimal.



<Autors autors="jpetit"/> 

