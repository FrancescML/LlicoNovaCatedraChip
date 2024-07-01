

# El tipus enter 

<img src='./int.png' style='height: 8em; float: right; margin: 2em 0 1em 1em;'/>


El tipus dels enters en Python s'escriu `int`. En aquesta llicó es mostra com s'escriuen els literals enters, quins valors poden tenir els valors enters i quines operacions se'ls pot aplicar.


## Literals

La manera d'escriure els enters en Python és posant els seus dígits en base 10, potser amb un guió davant per indicar els negatius. Per exemple: `0`, `8437628`, `-15`, ... També es poden escriure en binari, octal o en hexadecimal (per exemple, `0b11111111` `0xFF` és el mateix que `255`) i d'altres maneres exòtiques, però segurament no les necessitarem mai en aquest curs.


## Valors

Els possibles valors del tipus enter són tots els nombres enters: 0, 1, -1, 2, -2, 3, -3,... Python no imposa cap límit en el valor (enter) d'aquests nombres més enllà del límit de la memòria requerida per emmagatzemar-los. En comparació a molts altres llenguatges de programació, on els possibles valors dels enters estan fitats, això és un gran avantatge.


## Operacions

Les principals operacions internes del tipus enter ja han estat presentades a través d'aquests operadors aritmètics:

|símbol|operació|
|---|---|
|`+`|suma|
|`-`|resta (binari)|
|`-`|canvi de signe (unari)|
|`*`|producte|
|`//`|divisió entera|
|`%`|residu de la divisió entera|
|`**`|exponenciació|

Recordeu que dividir per zero (amb `//` o `%`) és un error de programació.

També hem vist que podem comparar enters a través dels operadors relacionals:

|símbol|operació|
|---|---|
|`==`|igualtat|
|`!=`|diferència|
|`<`|menor estricte|
|`>`|major estricte|
|`<=`|menor o igual|
|`>=`|major o igual|

El resultat de la comparació de dos enters no és, però, un enter: es tracta d'un valor lògic `True` o `False` de tipus booleà del qual parlarem a la llicó sobre els [booleans](booleans.html).


<Autors autors="jpetit"/> 

