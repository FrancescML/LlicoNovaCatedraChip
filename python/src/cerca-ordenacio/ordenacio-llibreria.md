# Ordenació amb funcions predefinides

<img src='./sort.png' style='height: 8em; float: right; margin: 0 0 1em 2em;'/>

A les lliçons anteriors hem presentat i analitzat diversos algorismes d'ordenació. A banda dels que s'han explicat existeixen molts més altres algorismes, cadascun amb els seus avantatges i inconvenients. Ara bé, a l'hora d'ordenar llistes en Python, moltes vegades el millor és utilitzar les seves funcions predefinides. Això és perquè aquestes funcions ja implementen algorismes molt eficients i tenen el seu codi molt optimitzat (possiblement, escrit en un llenguatge més eficient que el propi Python).

Aquesta lliçó mostra com utilitzar aquestes funcions predefinides d'ordenació i com modificar-ne el seu comportament per alguns casos d'ús habituals.

## La funció `sorted` i el mètode `sort`

Donada una llista `L`, `sorted(L)` retorna la llista ordenada de petit a gran. `L.sort()` ordena la llista. Fixeu-vos que `sorted` és una funció predefinida que retorna una nova llista ordenada, tot mantenint la llista original mentre que `sort` és un mètode de les llistes que modifica la llista sobre la qual s'aplica:

```python
>>> L = [6, -2, 4, -3, 2, 4, 6, 9, 1]
>>> sorted(L)
[-3, -2, 1, 2, 4, 4, 6, 6, 9]
>>> L
[6, -2, 4, -3, 2, 4, 6, 9, 1]
>>> L.sort()
>>> L
[-3, -2, 1, 2, 4, 4, 6, 6, 9]
```

## Ordenació decreixent

Per defecte, `sorted` i `sort` ordenen creixentment. Per indicar que es vol ordenar de gran a petit, se'ls pot passar el paràmetre `reverse` (que per defecte val `False`):

```python
>>> L = [6, -2, 4, -3, 2, 4, 6, 9, 1]
>>> sorted(L, reverse=True)
[9, 6, 6, 4, 4, 2, 1, -2, -3]
```

Això hauria de ser més eficient que ordenar de petit a gran primer i revessar després (amb `reversed` o `reverse`).

## Ordenació a partir d'una funció

A vegades cal ordenar els element d'una llista a través d'una funció sobre els seus elements i no pas amb els seus elements directament. Amb el paràmetre `key` es pot indicar quina funció aplicar a cada element per obtenir-ne el seu ordre.

Per exemple, aquesta llista d'enters s'ordena en funció dels valors absoluts dels seus elements:

```python
>>> L = [6, -2, 4, -3, 2, 4, 6, 9, 1]
>>> sorted(L, key=abs)
[1, -2, 2, -3, 4, 4, 6, 6, 9]
```

I, en aquest cas, s'ordena una llista de punts en funció de la seva distància a l'origen:

```python
def dist2(p: tuple[float, float]) -> float:
    """Retorna el quadrat de la distància de p a l'origen."""
    return p[0]*p[0] + p[1]*p[1]

>>> L = [(7, 2), (5, 1), (1,1), (0, 0), (10, 2)]
>>> sorted(L, key=dist2)
[(0, 0), (1, 1), (5, 1), (7, 2), (10, 2)]
```

Per estalviar càlculs innecessaris, no es calcula l'arrel quadrada del mòdul del punt, total, la funció arrel és monòtona.

## Ordenació de textos

Quan s'ordenen llistes de textos, per defecte s'utilitzen les comparacions de textos. Per això, les majúscules venen abans que les minúscules:

```python
>>> L = 'La Rosa porta la rosa'.split()
>>> L
['La', 'Rosa', 'porta', 'la', 'rosa']
>>> sorted(L)
['La', 'Rosa', 'la', 'porta', 'rosa']  # 😒
```

Passant el mètode `lower` de `str` a `key`, es pot fer que les paraules s'ordenin segons el seu valor en minúscules, obtenint una ordenació més raonable:

```python
>>> L = 'La Rosa porta la rosa'.split()
>>> L
['La', 'Rosa', 'porta', 'la', 'rosa']
>>> sorted(L, key=str.lower)
['La', 'la', 'porta', 'Rosa', 'rosa']  # 👍
```

Tot i això, els accents encara porten problemes:

```python
>>> sorted('Àgata Abel Èric Enric'.split())
['Abel', 'Enric', 'Àgata', 'Èric']  # 😒
```

Com que l'ordenació amb accents i altres símbols com ces trencades, enyes,... depenen de les regles ortogràfiques de la llengua que es vulgui usar, Python ofereix la funció `locale.strxfrm` que transforma un text a un text equivalent que es pot utilitzar en comparacions segons l'idioma local definit a les preferències de l'ordinador:

```python
import locale

>>> sorted('Àgata Abel Èric Enric'.split(), key=locale.strxfrm)
['Abel', 'Àgata', 'Enric', 'Èric']  # 👍
```

Si no us funciona, potser no teniu el vostre llenguatge local configurat a l'ordinador. En aquest cas, podeu provar a canviar la configuració de la vostra localització amb `locale.setlocale(locale.LC_COLLATE, 'ca_ES.UTF-8')`.

<Autors autors="jpetit"/>
