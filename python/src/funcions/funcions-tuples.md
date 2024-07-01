
# Funcions que retornen més d'un valor

Aquesta lliçó mostra com les funcions poden retornar més d'un valor i com es poden utilitzar aquests valors retornat. De fet, les funcions de Python només poden retornar un sol valor, però quan es retorna una tupla, llavors es pot pretendre que se'n retornen diversos.


## Funció pel mínim i el màxim de dos enters

En algunes situacions és desitjable que una funció retorni més d'un valor com a resultat. Per exemple, hom podria voler una funció que, donats dos enters, retorni el mínim *i* el màxim.  Malauradament, les funcions només poden retornar un sol resultat. Per tant, sembla que no es pugui fer aquesta funció que hauria de retornar dos enters.

Ara bé, malgrat que les funcions només poden retornar un valor, aquest valor pot ser de qualsevol tipus i ja hem vist que alguns tipus, com les tuples, ens permeten emmagatzemar dos valors en un de sols. Per tant, el truc per retornar més d'un valor és retornar-ne un de sol, i fer que aquest sigui una tupla.

Llavors, la manera d'escriure la funció que retorna el mínim i el màxim de dos enters és la següent:

```python
def minim_i_maxim(a: int, b: int) -> tuple[int, int]:
    """Funció que retorna el mínim i el màxim de dos enters."""
    if a <= b:
        return (a, b)
    else:
        return (b, a)
```

La capçalera de `minim_i_maxim` reflecteix doncs que el resultat és una tupla de dos enters i els `return`s retornen el parell d'enters necessari després de la comparació dels dos paràmetres.

De fet, en molts contextos, Python permet prescindir dels parèntesis per crear tuples, i això alleugereix una miqueta el codi:

```python
def minim_i_maxim(a: int, b: int) -> tuple[int, int]:
    """Funció que retorna el mínim i el màxim de dos enters."""
    if a <= b:
        return a, b     # no calen parèntesis aquí
    else:
        return b, a     # no calen parèntesis aquí
```

A l'intèrpret podem comprovar que el resultat de la funció és una tupla:

```python
>>> minim_i_maxim(4, 5)
(4, 5)
>>> type(minim_i_maxim(4, 5))
<class 'tuple'>
```

Però la millor manera de recollir el resultat d'una funció que retorna una tupla és desempaquetar-lo directament en variables que tenen la mateixa estructura. Per exemple, es pot fer així:

```python
>>> (min, max) = minim_i_maxim(4, 5)
>>> print(min)
4
>>> print(max)
5
```

Aquí també es poden ometres els parèntesis de creació de la tupla:

```python
>>> min, max = minim_i_maxim(4, 5)
```

En definitiva, per fer que una funció retorni múltiples valors, cal que retorni una tupla. Per recollir els resultats d'una funció que retorna una tupla, n'hi ha prou de posar els noms de les variables on s'assignaran cadascun d'aquests valors separats per coma. 


## Descomposició horària

Recordeu que una dels primers programes que vam fer va ser el de la [descomposició horària](/inici/descomposicio-horaria.html)? El problema consistia en convertir una quantitat (positiva) de segons `n`, en hores, minuts i segons.

Ara podem encapsular aquest càlcul en una funció que, donat el nombre de segons, retorna el nombre d'hores, minuts i segons equivalents:

```python
def descomposio_horaria(n: int) -> tuple[int, int, int]:
    """Funció que converteix un determinat nombre de segons en hores, minuts i segons."""

    h = n // 3600
    m = (n // 60) % 60
    s = n % 60
    return h, m, s
```

Desempaquetar el resultat és fàcil:

```python
hores, minuts, segons = descomposio_horaria(4376)
>>> print(hores, minuts, segons)
1 12 56
```


## Sumar un segon a una hora

Recordeu també que una dels primers programes que vam fer va ser el de [sumar un segon en una hora](/condicionals/sumar-un-segon.html)? Aquesta tasca ara també la podem convertir en una peça de codi independent i reusable a través d'una funció:

```python
def sumar_un_segon(h: int, m: int, s: int) -> tuple[int, int, int]:
    s = s + 1
    if s == 60:
        s = 0
        m = m + 1
        if m == 60:
            m = 0
            h = h + 1
            if h == 24:
                h = 0
    return h, m, s
```

Aquesta és una possible forma d'utilitzar-la:

```
h, m, s = 23, 59, 59                    # tampoc calen parèntesis de tuples
h, m, s = sumar_un_segon(h, m, s)
print(h, m, s)
```



<Autors autors="jpetit"/> 

