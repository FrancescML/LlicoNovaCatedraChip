# Exemples de seqüències

<img src='./sequencies.png' style='height: 8em; float: right; margin: 0 0 1em 1em;'/>

Aquesta lliçó mostra nous exemples de tractament de seqüències de dades. Els exemples exposants són el càlcul de la suma d'una seqüència d'enters, el càlcul del màxim d'una seqüència d'enters, i el comptatge de les aparicions d'una paraula en particular en una seqüència de paraules.


## Suma d'una seqüència d'enters

Suposem que volem fer un programa que, donats molts elements enters, ens calculi quina és la seva suma. 

Aplicant les mateixes idees que per la mitjana dels reals ho podem fer amb `scan`:


```python
from yogi import scan

s = 0
x = scan(int)
while x is not None:
    s = s + x
    x = scan(int)
print(s / n)
```

Aquest cop he escrit la condició com a `x is not None` enlloc de `x != None` perquè els puristes de Python diuen que cal fer-ho així (🧐).

O ho podem fer `tokens`:

```python
from yogi import tokens

s = 0
for x in tokens(int):
    s = s + x
print(s)
```

Fixeu-vos que, donada una seqüència buida, els dos programes indiquen que la suma dels seus elements és zero, tal com cal.


## Màxim d'una seqüència d'enters

Considerem ara que volem fer un programa que, donats molts elements (enters), ens calculi quin és el més gran. Com que el màxim d'una seqüència buida no està ben definit, en aquest cas exigim que la seqüència tingui, com a mínim, un element.

Podem resoldre aquest problema de forma semblant a l'anterior:

- Usarem un bucle `for x in tokens(int)` per poder llegir seqüencialment tots els enters de l'entrada.

- Utilitzarem una variable `m` que representi el màxim de tots els enters llegits fins al moment.

- A cada iteració, si el valor d'`x` supera el d'`m`, actualitzarem el valor d'`m`.

Això dona lloc a aquesta quasi-solució:

```python
m = ???                // 👁
for x in tokens(int):
    if x > m: 
        m = x
print(m)
```

Però... quin és el valor adequat per inicialitzar `m`?

Seria temptador usar un zero com a valor inicial, fent `m = 0`. Lamentablement, el codi seria defectuós: Suposeu que tots els enters de l'entrada fossin negatius, com ara ~~-3 -9 -2 -5~~. En aquest cas, el programa escriuria ~~0~~ en lloc de ~~-2~~!

Una millor alternativa seria adonar-nos-en que el valor matemàticament adequat per inicialitzar `m` és -∞ (menys infinit). Aquesta tria seria correcta des del punt de vista teòric però, malauradament, el tipus `int` dels enters de Python no pot representar ni -∞ ni +∞ (els valors poden ser arbitràriament grans, però no infinits).

La millor solució és usar el primer element de la seqüència (que sabem que existeix segur) per inicialitzar `m` amb un cop de `read`. Així:

```python
m = read(int)
for x in tokens(int):
    if x > m: 
        m = x
print(m)
```

Ara la seqüencia es llegeix en dos punts diferents del programa: amb el `read`, llegim el primer element, i amb `tokens`, la resta. Fixeu-vos doncs que `tokens` no són exactament tots els elements de l'entrada, sinó que a cada iteració lliura el següent element fins que no en queden, i llavors fa finalitzar el `for`.

I si recordem que Python ja ofereix una funció predefinida `max` podem deixar el programa complet així:

```python
from yogi import read, tokens

m = read(int)
for x in tokens(int):
    m = max(m, x)
print(m)
```


## Comptar gats 😸

Posem-nos ara en el context de voler comptar quantes paraules `gat` apareixen en un fitxer de text. Per exemple, a l'entrada

```text
A gat vell rateta jove
Al gat vell no cal mostrar-li rata
De nit tots els gats són negres
```

hi ha dues paraules `gat` (i no tres perquè `gats` és plural).

Podem fer servir la mateixa tècnica de llegir seqüencialment cada paraula `p` de l'entrada i anar comptant aquelles que són iguals al text `'gat'`:

```python
from yogi import tokens

c = 0  # comptador de gats
for p in tokens(str):
    if p == 'gat':
        c = c + 1
print(c)
```




<Autors autors="jpetit"/> 

