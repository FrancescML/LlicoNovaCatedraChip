# Tipus de dades: Introducció

Aquesta lliçó introduiex el concepte de tipus de dades i de sistema de tipus.

## Concepte de tipus de dades

En Python, cada valor és d'un tipus. Per exemple, el valor `38` és de tipus enter (`int`), el valor `3.14` és de tipus real (`float`) i el valor `'Coldplay'` és de tipus text (`str`). Podem veure el tipus d'un valor usant `type()` a l'intèrpret:

```python
>>> type(38)
<class 'int'>
>>> type(3.14)
<class 'float'>
>>> type('Coldplay')
<class 'str'>
```

En Python, el tipus d'una variable és el tipus del valor que tingui la variable en aquell moment. Per exemple:

```python
>>> x = 12
>>> type(x)
<class 'int'>
>>> y = 'Star Wars'
>>> type(y)
<class 'str'>
>>> y = x
>>> type(y)
<class 'int'>
```

Com es veu amb la variable `y`, el tipus d'una variable en Python pot canviar al llarg del temps. Això sol introduir problemes i, per això, és millor evitar-ho.

En informàtica un **tipus de dades** (o, senzillament, un **tipus**) defineix un conjunt de possibles valors i un conjunt de possibles operacions. Per exemple, el tipus dels enters té com a possibles valors tots els nombres enters i com a possibles operacions la suma, la resta, el producte, ètc.

## Literals

Els **literals** són els valors constants d'un determinat tipus que s'ecriuen en els programes. Per exemple, `38` és un un literal enter i `3.14` és un literal real.

## Sistema de tipus

Els llenguatges de programació (com ara Python) tenen un **sistema de tipus** que vigila que les operacions que s'apliquin a les dades siguin del tipus adient. Si ho són, les operacions es duran a terme. Si no ho són, potser s'introduirà una conversió automàtica abans de dur-les a terme o, simplement, no s'executaran i donaràn lloc a un **error de tipus**.

Vegem-ne alguns exemples:

-   El sistema de tipus regula que la suma de dos enters és un enter. Per tant la suma de l'enter 3 i l'enter 4 corresponent a `3 + 4` dóna lloc a l'enter 7.

-   De forma semblant, el sistema de tipus de Python indica que la suma de dos textos és el text resultant de la concatenació del primer amb el segon. Per tant, `'Cold' + 'play'` dóna el text `'Coldplay'`.

-   Ara bé, Python prohibeix sumar un text i un enter: Si provem d'executar `'Marta' + 1`, hi haurà un error de tipus, reflectit pel missatge ~~TypeError: can only concatenate str (not "int") to str~~.

-   En canvi, el producte entre un text i un enter és possible: `'ma' * 2` és `'mama'`.

-   Finalment, el sistema de tipus indica que la suma d'un enter i un real és un real, tot convertint automàticament l'enter a real. Llavors `2 + 1.5` és el mateix que `2.0 + 1.5` que és el real `3.5`.

L'objectiu de les regles del sistema de tipus és disminuir la possibilitat d'errors en els programes. Ara bé, les regles de tipus canvien d'un llenguatge de programació a un altre.

## Els tipus bàsics de Python

A continuació presentarem quatre tipus bàsics de Python:

-   [El tipus enter](/tipus/enters) (`int`)
-   [El tipus real](/tipus/reals) (`float`)
-   [El tipus text](/tipus/texts) (`str`)
-   [El tipus booleà](/tipus/booleans) (`bool`)

Hi ha altres tipus bàsics i també tipus complexos, que veurem més endavant. De moment, en aquest curs hem estat treballant principalment amb els enters, hem fet ús dels reals i dels textos passant-hi de puntetes, i hem usat sense adonar-nos-en els booleans.

Continuem!

<Autors autors="jpetit"/>
