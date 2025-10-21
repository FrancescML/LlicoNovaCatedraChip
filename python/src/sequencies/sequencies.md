# Seqüències

<img src='./sequencies.png' style='height: 8em; float: right; margin: 2em 0 1em 1em;'/>

Fins ara ens hem limitat a escriure programes que tracten unes poques dades. Aquesta lliçó mostra com llegir i tractar un gran nombre de dades que s'obtenen seqüencialment des de l'entrada. L'exemple que ho vehicula és el càlcul de la mitjana d'una seqüència de reals. Es veuen tres formes de fer-ho:

- anunciant el nombre d'elements al principi de l'entrada,
- indicant el final de l'entrada amb un valor especial, i
- deixant que el sistema detecti automàticament el final de l'entrada.

Per tractar el darrer cas, s'introdueixen dues funcions noves del mòdul `yogi`: `scan` i `tokens`.


## Mitjana d'una seqüència de reals amb comptador inicial

Suposem que volem fer un programa que, donats molts elements reals, ens calculi quina és la seva mitjana. El nombre d'elements a considerar es dóna a través d'un primer enter a l'entrada. Per exemple, per calcular la mitjana de 9.5, 2.5, 7 i 2, l'entrada seria

```text
4
9.5 2.5 7 2
```

i la sortida hauria de ser ~~5.25~~. El primer ~~4~~ indica que segueixen quatre elements. I per a l'entrada

```text
3 4.6
19      7
```

la sortida hauria de ser ~~10.2~~.

Fixeu-vos que els elements es dónen un rera l'altre, i poden estar separats tant per espais en blanc o salts de línies. En qualsevol cas, el seu nombre és anunciat al principi. Donem per fet que aquest nombre no és zero, perquè sinó la mitjana no estaria ben definida.

Ja sabem com llegir un enter tot important la funció `read` de `yogi`. L'efecte de

```python
n = read(int)
```

consisteix a llegir el següent valor enter de l'entrada i desar-lo en la variable entera `n`. Igualment, l'efecte de

```python
x = read(float)
```

consisteix a llegir el següent valor real de l'entrada i desar-lo en la variable real `x`.

Fer la lectura de les dades amb `read` és molt convenient, perquè aquesta funció ja s'encarrega d'ignorar els espais i salts de línia abans i després de l'element llegit.

Però en aquest aplicació, no en tenim prou amb llegir un real, sinó que n'hem de llegir molts. Concretament, com que n'hem de llegir `n`, ho podem fer amb un bucle `for`. Per tant, l'estructura del programa que llegeix tots els valors de l'entrada podria ser aquesta:

```python
n = read(int)
for i in range(n):
    x = read(float)
```

Primer, es llegeix el nombre d'elements que caldrà llegir i es desa a la variable entera `n`. A continuació, es fa un bucle que, al llarg de les seves `n` iteracions va llegint successivament els `n` elements reals de l'entrada, desant-los a cada iteració a la variable real `x`.

Evidentment el programa encara no calcula res de bo, però com a mínim llegeix tota l'entrada correctament. Com fer per calcular la mitjana dels elements llegits? Doncs és clar que caldrà sumar-los tots i dividir la suma entre el seu nombre. El nombre d'elements és conegut des del principi: és `n`. Per trobar la seva suma usarem una variable real `s` que començarà a zero i que, a cada iteració, augmentarà el seu valor d'`x`. D'aquesta forma, al sortir del bucle, `s` serà la suma de totes les `x` llegides. Aquest és el programa complet:

```python
from yogi import read

n = read(int)
s = 0.0
for i in range(n):
    x = read(float)
    s = s + x
print(s / n)
```

Fixeu-vos que `s` ha de ser una variable real, perquè és la suma de molts reals. Ho deixem clar inicialitzant-la a `0.0`.

El cos del bucle també es podria escriure més curt com a

```python
    s = s + read(float)
```

tot prescindint de la variable `x`, però prefereixo deixar l'operació de lectura més explícita.



## Mitjana d'una seqüència de reals amb finalitzador especial

De cara a l'usuari, el requiriment d'haver d'anunciat el nombre d'elements al principi de les dades és una mica desagradable. Molts usuaris no voldràn comptar primer el nombre d'elements a tractar abans de començar a donar-los. De fet, de bon principi, potser ni saben quants són. Una alternativa seria que la seqüència de dades acabés amb un valor especial que senyala el final de les dades. Per concretar-ho, anem a suposar ara que la seqüència acaba amb una paraula especial: `fi`. També suposarem que, com a mínim hi ha un valor, perquè sinó la mitjana no estaria ben definida.

Per exemple, per calcular de nou la mitjana dels números 9.5, 2.5, 7 i 2, l'entrada seria ara

```text
9.5
2.5
7
2
fi
```

Aquest cop, l'algorisme ha d'anar llegint paraules seqüencialment (una darrera l'altra) fins que trobi la paraula `fi`. Igualment, haurà de mantenir la suma dels valors llegits fins al moment i el seu nombre. Ho podem fer així:

```python
from yogi import read

s = 0.0
n = 0
x = read(str)
while x != 'fi':
    s = s + float(x)
    n = n + 1
    x = read(str)
print(s / n)
```

En aquest programa,
la variable real `s` conté la suma dels valors llegits fins al moment.
La variable entera `n` conté el nombre dels valors llegits fins al moment.
La variable de text `x` conté la darrera paraula llegida.

Fixeu-vos en les inicialitzacions: Els valors de `n` i de `s` s'inicialitzen a zero ja que, abans d'haver llegit res, el nombre d'elements llegits és zero i la seva suma també. El primer `read` abans del bucle `while` llegeix la primera paraula i la desa en `x`.

Quan aquesta paraula sigui `'fi'` senyalarà el final de l'entrada, per tant el bucle ha de continuar iterant mentre `x != 'fi'`. I cada cop que s'entra al bucle, cal augmentar la suma dels valors llegits fins al moment amb el valor que conté `x`. Per això, es converteix el text en `x` a un real amb la conversió `float(x)` i s'acumula a `s`. Igualment, cal augmentar el nombre de valors llegits d'una unitat. I, abans de repetir el bucle, cal llegir una nova paraula i desar-la en `x` per deixar-ho tot preparat per la iteració següent.

A la sortida del bucle (quan `x == 'fi'`), `s` és doncs la suma de tots els valors llegits i `n` el seu nombre, per tant la seva mitjana és `s / n`, la qual s'escriu.

Us pot sorprendre l'estructura d'aquest bucle, especialment el fet que la lectura es trobi abans del `while` i al final del seu cos, però aquesta és la bona manera de fer-ho.



## Mitjana d'una seqüència de reals sense finalitzador amb `scan`

El format de l'entrada anterior és encara massa pesat. En moltes aplicacions reals el que cal és llegir les dades fins que no n'hi hagin més. Per exemple,per calcular ara la mitjana dels números 9.5, 2.5, 7 i 2, l'entrada hauria de ser

```text
9.5
2.5
7
2
```

I prou.

Per poder-ho fer així, la nostre vella amiga, la funció `read` és insuficient. En efecte, si `read` intenta llegir dades quan ja no n'hi ha, provoca un error. I, al contrari de les dues situacions anteriors, en aquest cas no tenim manera de saber que ja no hi ha més dades!

Per això, ara cal utilitzar una altra funció de `yogi`: la funció `scan`. La funció `scan` és semblant a `read` però quan no pot llegir més, retorna un valor especial anomenat `None`. `None` és un valor d'un tipus bàsic de Python que també es diu `None` i que no té cap altre valor i serveix per indicar un valor nul o un valor indefinit.

La solució del problema és ara molt semblant a l'anterior, però usant `scan` enlloc de `read`,  llegint els nombres directament com a reals enlloc de textos, i detectant el final de la lectura comparant amb `None` enlloc de `'fi'`:

```python
from yogi import scan

s = 0.0
n = 0
x = scan(float)
while x is not None:
    s = s + x
    n = n + 1
    x = scan(float)
print(s / n)
```

Una petita observació: El tipus de dades retornat per `scan(float)` és `None|float`, és a dir la unió dels valors de tipus `None` (que només és `None`) amb la unió dels valors de tipus `float`. Per tant, després dels `scan`s, el tipus de `x` és `None|float`. Però la comprovació de tipus estàtica és molt astuta i pot deduir que, quan `x is not None`, el tipus de `x` és `float`. Per això, ens el permet sumar a `s` (els `None` els `None|float` no es poden sumar). Igualment, pot deduir que, quan `x is None`, és a dir, al sortir del bucle, el tipus de `x` és `None`. Ho podeu comprovar amb Visual Studio Code posant el cursor damunt de les diferències ocurrències de la variable `x` i deixant que Pylance us mostri el seu tipus.

El tipus `None|float` també el podeu veure escrit com `Union[None, float]` o `Optional[float]`; en totes tres versions vol dir el mateix.


## Final de l'entrada

Si executem interactivament el programa anterior, necessitem assenyalar el final de l'entrada d'alguna manera. Altrament, com que el programa no pot saber que no li volem donar cap nombre més, s'espera a rebre un nou nombre inexistent, el bucle no acaba, i el programa no escriu res.

Al terminal, la forma d'indicar la fi de l'entrada depèn del sistema operatiu:

- En Linux i Mac OS (i en Unix en general), cal picar alhora les tecles <kbd>control</kbd><kbd>d</kbd>.

- En Windows, cal picar alhora les tecles <kbd>control</kbd><kbd>z</kbd>.

Aquestes combinacions de tecles indiquen al programa que l'entrada s'ha acabat, cosa que fa que `scan` retorni `None` (cosa que fa el bucle acabi i que s'escrigui la mitjana).

TODO: enllaç Si no executem el programa interactivament, sinó que li passem l'entrada des d'un fitxer o des d'una *pipe* (vegeu la lliçó sobre [el terminal] (/terminal/index.html)), no cal fer res. Simplement, quan el fitxer s'acaba, el programa també acaba perquè no hi ha res més a llegir.

Aprofitem per fer un comentari més: La combinació de tecles <kbd>control</kbd><kbd>c</kbd> atura qualsevol programa. D'això, els informàtics en diem '*matar*' el programa. Aquesta combinació se sol usar quan un programa triga massa a acabar, o bé quan '*s'ha penjat*', és a dir, quan sembla que ha entrat en un bucle infinit i no podria acabar mai per ell mateix. Fixeu-vos que si matéssim el programa anterior en lloc d'indicar-li que l'entrada s'ha acabat, el programa s'aturaria immediatament sense escriure res.


## Mitjana d'una seqüència de reals sense finalitzador amb `tokens`

Una manera alternativa d'escriure el programa anterior per calcular la mitjana d'una seqüència de reals fins que acabi l'entrada és usar la funció `tokens` de `yogi` enlloc de `scan`. La funció `tokens` sempre s'utilitza en un bucle `for` i podeu imaginar que retorna la llista de tots els elements de l'entrada (del tipus prescrit), un per a cada iteració. Es pot usar així:


```python
from yogi import tokens

s = 0.0
n = 0
for x in tokens(float):
    s = s + x
    n = n + 1
print(s / n)
```

El bucle `for x in tokens(float): ...` el podeu llegir com "*per a cada real `x` de l'entrada: ...*". El tipus de `x` és `float` perquè així ho hem prescrit al `tokens`.

Al final ha acabat quedant ben senzill, oi? En molts casos `tokens` serà més convenient que `scan`, en d'altres, `scan` serà preferible. N'anirem veient més exemples.




<Autors autors="jpetit"/>
