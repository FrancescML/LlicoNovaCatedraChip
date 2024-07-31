# Booleans

<img src='././booleans.png' style='height: 9em; float: right; margin: 0 0 1em 1em;'/>

Aquest lliçó introdueix el tipus `bool`,
el qual permet representar valors booleans i aplicar-los operacions lògiques.

## Valors booleans

Segurament, les preguntes més senzilles de contestar són les que només
admeten dues respostes: _sí_ o _no_ (és clar que les preguntes que
només en tenen una encara són més senzilles, però no són gens
interessants). Per exemple, la resposta de _"La Terra és un planeta?"_
és _sí_, i la resposta de _"Les balenes són peixos?"_ és "_no_" (són
mamífers!). Per a la pregunta _"L'Anna està embarassada?"_, no sabem
quina és la resposta, però en un moment donat serà _sí_ o serà _no_, no
pot ser _"una mica"_. En canvi, una pregunta com _"Quina hora és?"_ no
té com a resposta _sí_ o _no_.

Igualment, les afirmacions poden ser certes o falses. Per exemple, l'afirmació
_"Les pomes són fruites."_ és certa, però l'afirmació _"París és la capital
d'Andorra."_ és falsa. A més, les afirmacions es poden combinar
en afirmacions compostes com ara _"Les pomes són fruites o París
és la capital d'Andorra."_.

En programació, és útil disposar de valors que indiquin
si la resposta a una pregunta és _sí_ o _no_,
i poder combinar aquests valors amb operadors lògics.
Per això, s'utilitza l'**Àlgebra de Boole**
[$\small[\mathbb{W}]$](https://ca.wikipedia.org/wiki/%C3%80lgebra_de_Boole).
En l'Algebra de Boole només hi ha dos valors, **fals** i **cert**,
que es poden combinar amb operadors de negació (**no**),
de disjunció (**o**) i de conjunció (**i**).

## El tipus `bool`

En C++, els valors lògics es representen amb el tipus `bool` (de booleans).
Els valors fals i cert es representen amb els literals `false` i `true`.

Hi ha una operació unària (sobre un sol booleà):

-   la negació, amb l'operador `not`.

També hi ha dues operacions binàries (és a dir, amb dos operands) fonamentals:

-   la disjunció, amb l'operador `or` i
-   la conjunció, amb l'operador `and`.

Les taules de veritat següents mostren, per a cada operació,
el resultat de cada possible combinació dels seus operands.

**Taula de veritat de la negació:**

| `a`     | `not a` |
| ------- | ------- |
| `false` | `true`  |
| `true`  | `false` |

**Taula de veritat de la disjunció:**

| `a`     | `b`     | `a or b` |
| ------- | ------- | -------- |
| `false` | `false` | `false`  |
| `false` | `true`  | `true`   |
| `true`  | `false` | `true`   |
| `true`  | `true`  | `true`   |

**Taula de veritat de la conjunció:**

| `a`     | `b`     | `a and b` |
| ------- | ------- | --------- |
| `false` | `false` | `false`   |
| `false` | `true`  | `false`   |
| `true`  | `false` | `false`   |
| `true`  | `true`  | `true`    |

Així, la disjunció de dos booleans només és falsa si ambdós són falsos,
i la conjunció de dos booleans només és certa si ambdós són certs.
I, és clar, negar un booleà vol dir canviar-lo.

També es pot comprovar si dos booleans són iguals
o si són diferents amb els operadors `==` i `!=`.

## Representació

Com que els booleans només tenen dos possibles valors,
es podrien emmagatzemar en un sol bit.
Tanmateix, tenint en compte l'arquitectura de les màquines actuals,
normament es guarden en un byte (8 bits), com els caràcters.
Això gasta més memòria, però n'accelera l'accés.

## Ús

Les condicions de les instruccions condicionals i iteratives
sempre són booleanes (però vegeu la conversió automàtica més avall).
Per exemple, quan s'escriu

```c++
if (temperatura <= 0) // gela

```

l'expressió `temperatura <= 0` és de tipus booleà.
En efecte, els operadors relacionals (`==`, `!=`, `<=`, `>=`, `<` i `>`)
retornen un valor booleà.
Això s'aprecia més clarament quan s'uneixen diverses condicions:

```c++
if (temperatura <= 0 and llum == 0)   // gela i és fosc
```

A més, si cal podem emmagatzemar condicions
en variables de tipus booleà.
Per exemple, amb

```c++
bool gela = temperatura <= 0;
```

es crea una nova variable booleana anomenada `gela`,
amb valor `true` o `false` segons el valor de `temperatura`.
Igualment, es pot crear una variable booleana
per guardar si és fosc o no,
i es poden combinar entre elles:

```c++
bool gela = temperatura <= 0;
bool es_fosc = llum == 0;
if (gela and es_fosc) ...
```

## Lleis de De Morgan

Les lleis de De Morgan son un parell de transformacions lògiques
que són essencials en informàtica.
Escrita en C++, la primera llei estableix que `not (a or b)`
és equivalent a `(not a) and (not b)`.
La segona llei diu que `not (a and b)` és
equivalent a `(not a) or (not b)`. La demostració d'ambdues lleis és
ben senzilla utilitzant taules de veritat.

Així, podem veure que el contrari de _"gela i és fosc"_
és _"no gela o no és fosc"_.
Compte: no és pas _"no gela i no és fosc"_,
el qual és un error molt freqüent.

Per tant, quan tenim un bucle com ara

```c++
while (gela and es_fosc) {
    ...
}
```

sabem que sortirem del bucle quan almenys una de les variables
`gela` i `es_fosc` sigui falsa.

## Conversió automàtica a `bool`

Per bé o per mal, C++ converteix automàticament els tipus bàsics
a booleans quan el context ho requereix. Sempre es fa servir
la regla de que zero és fals i no zero és cert.

Per exemple, si un enter `elements` emmagatzema el nombre d'elements d'un
determinat conjunt, es pot preguntar si el conjunt és buit fent

```c++
if (not elements) ...
```

enlloc d'utilitzar

```c++
if (elements == 0) ...
```

També, es pot preguntar si el conjunt té algun element fent

```c++
if (elements) ...
```

enlloc d'utilitzar

```c++
if (elements > 0) ...
```

En el cas dels punters, només els que són nuls es converteixen a fals.
Per tant, podem escriure la condició `if (p)` en lloc
de `if (p != nullptr)` per mirar si un punter apunta a algun lloc.

## Estil

Habitualment, comparar un booleà directament amb `true` o amb `false` es
considera mal estil. Per exemple, si `trobat` és un booleà, el fragment

```c++
if (trobat == true) ...
```

es millor rescriure'l aixi:

```c++
if (trobat) ...
```

Similarment,

```c++
if (trobat == false)
```

és pitjor estil que

```c++
if (not trobat)
```

També, és confús usar identificadors negats
per a les variables booleanes.
Per exemple, és molt més senzill entendre la condició `gela` que `not no_gela`.

Finalment, si voleu evitar la còlera dels déus de la programació,
no escriviu mai bestieses com ara `bool fals = true`;

## Operadors alternatius obsolets

Per compatibilitat amb el llenguatge C, del qual C++ n'és una evolució,
els operador `not`, `or` i `and`
també es poden escriure `!`, `||` i `&&`, respectivament.
Però com que aquests operadors obsolets són molt menys intuïtius i llegibles,
no us recomanem fer-los servir.

<Autors autors="jpetit roura"/>
