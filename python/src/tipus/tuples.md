# Tuples

Aquesta lliçó presenta un primer tipus complex: les tuples. Gràcies a les tuples es poden agrupar dades diferents però relacionades en una de sola. Es mostra com empaquetar les dades en tuples i com desempaquetar-les.

## Tuples per a punts

Considereu un sistema de coordenades cartesianes on un punt en el plà requereix de dues coordenades: la seva abscissa i la seva ordenada. El punt `p1` podria estar situat a x = 4.5 i y = 3.25 i el punt `p2` podria estar situat a x = -9.5 i y = 0.1. Amb el que sabem ara, podríem representar aquestes dades a través de quatre variables reals:

```python
p1_x = 4.5
p1_y = 3.25
p2_x = -9.5
p2_y = 0.1
```

Però ja es veu que aquesta solució és bastant maldestra: Només l'estructura dels noms de les variables ens dóna informació sobre les dades, i aquestes no tenen cap mena de relació entre elles. La noció de punt és inexistent!

Les tuples són una solució en aquest problema (n'hi ha més). Un valor de tipus tupla emmagatzema, en un sol paquet (la tupla) diversos valors (possiblement de diferents tipus). La manera d'escriure les tuples en Python és escrivint entre parèntesis els diferents valors que la componen separats per comes. Així:

```python
>>> p1 = (4.5, 3.25)
>>> p2 = (-9.5, 0.1)
>>> p1
(4.5, 3.25)
>>> p2
(-9.5, 0.1)
>>> type(p1)
<class 'tuple'>
>>> type(p2)
<class 'tuple'>
```

Ara, la variable `p1` és una tupla que agrupa dos reals. Cada membre d'una tupla s'anomena un **camp** i, per tant, el primer camp de `p1` val `4.5` i el segon camp de `p1` val `3.25`. Si demanem el valor de `p1`, podem comprovar que val `(4.5, 3.25)`, i si demanem el seu tipus podem comprovar que és `tuple`. Concretament, el tipus de `p1` és `tuple[float, float]`, és a dir una tupla amb dos camps, tots dos de tipus real. El mateix passa per `p2`.

Així doncs, el conjunt de valors d'una tupla és el producte cartesià dels conjunts de valors dels seus camps.

## Tuples per a cartes del Magic

Imagineu que heu de mantenir informació sobre cartes d'algun joc tipus Magic. Cada carta té un nom de personatge (de tipus text), un preu (de tipus real), un valor de força d'atac i un valor de defensa (enters entre 1 i 5). Podríem definir tres cartes amb tuples:

```
>>> carta1 = ('Gandalf', 12.50, 3, 5)
>>> carta2 = ('Orc', 0.99, 2, 2)
>>> carta3 = ('Frodo', 50.00, 1, 1)
```

El tipus d'aquestes cartes seria `tuple[str, float, int, int]`.

## Accés als camps d'una tupla

Una tupla es pot manipular com un tot o es pot consultar la informació de cadascun dels seus camps individualment. Pel segon cas, s'utilitza l'operació d'indexació (`[]`) tot triant el camp desitjat:

```python
>>> carta1                      # tota la informació de la tupla
('Gandalf', 12.50, 3, 5)
>>> carta1[0]                   # el valor del primer camp
'Gandalf'
>>> carta1[3]                   # el valor del darrer camp
5
```

Es pot obtenir el nombre de camps en una tupla amb la funció `len()`:

```python
>>> len(carta1)
4
>>> len(p1)
2
```

Evidentment, demanar el valor d'un camp que no existeix produeix un error:

```python
>>> p1[4]
IndexError: tuple index out of range
```

Compte: les tuples són **immutables**: no es pot modificar els seus camps un cop creades. Per tant, si volem sumar una unitat a la coordenada x del punt `p1` no podem fer

```python
>>> p1[0] = p1[0] + 1
TypeError: 'tuple' object does not support item assignment
```

El que cal fer és crear una nova tupla i assignar-la (tota) de nou a `p1` (esborrant el seu valor antic):

```python
>>> p1 = (p1[0] + 1, p1[1])
>>> p1
(5.5, 3.25)
```

## Desempaquetament de tuples

Quan creem una tupla, diem que **empaquetem** diferents valors. Per exemple, aquest codi crea una tupla `p` empaquetant dos valors reals.

```python
>>> p = (12.4, 65.1)
```

A més, en Python també podem extreure els valors dels camps directament en variables individuals. Aquest procés invers s'anomena doncs **desempaquetament**:

```python
>>> p = (12.4, 65.1)       # empaquetament
>>> (x, y) = p             # desempaquetament
>>> x
12.4
>>> y
65.1
>>> type(y)
<class 'int'>
```

Evidentment, per desempaquetar cal que la tupla de l'esquerra tingui el mateix nombre de camps que la de la dreta de l'assignació.

## Estalvi de parèntesis

Com hem dit, els valors de les tuples s'escriuen entre parèntesis, separats per comes. Però en molts contextos, els parèntesis es poden obviar del codi, fent-lo més lleuger. Fixeu-vos-hi:

```python
>>> p = 12.4, 65.1    # els podem escriure sense parèntesis!
>>> p
(12.4, 65.1)          # però el sistema sempre els mostra
```

Això també s'aplica quan es desempaqueta:

```python
>>> p = 12.4, 65.1
>>> x, y = p
>>> x
12.4
>>> y
65.1
```

Per això, els Pitonistes no escriuen mai l'intercanvi de dues variables amb una variable auxiliar, sinó que fan

```python
a, b = b, a
```

Els vells informàtics en dirien una assignació múltiple, però en realitat és una única assignació entre tuples.

<Autors autors="jpetit"/>
