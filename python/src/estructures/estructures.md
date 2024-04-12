
# Estructures

<img src='./estructures.png' style='height: 8em; float: right; margin: 0 0 1em 2em;'/>

Aquesta lliçó introdueix com crear uns altres tipus dades molt habituals: les estructures (també anomenades *registres* o *fitxes*). Les estructures permeten emmagatzemar en una sola variable un nombre fixe de dades de diferents tipus i accedir a qualsevol d'elles directament a través del seu nom. Malgrat que les tuples també comparteixen aquesta finalitat, les estructures són més flexibles perquè són mutables i els accessos són a través d'un identificador i no un número.


## Introducció

Una **estructura** és una col·lecció de dades dades relacionades que s'emmagatzemen en un sol lloc, com un tot. Cada dada d'una estructura s'anomena **camp** i té un nom i un tipus. Per exemple, un punt es podria descriure amb una estructura amb dos camps que representen les seves coordenades X i Y. I un cercle es podria descriure amb una estructura amb dos camps: un punt pel seu centre i un real pel seu radi. Igualment, una estructura per guardar la informació un treballador podria guardar el seu nom, la seva adreça i la seva data de naixement, que seria un valor d'una altra estructura per guardar dates.

És fàcil imaginar-se les estructures com a plantilles de formularis: En una plantilla de formulari hi ha diferents camps, cada camp té un nom i un tipus. Cada usuari omplirà la plantilla del formulari amb les seves pròpies dades. Per exemple, aquest és un formulari per la reserva d'una habitació en un hotel:

<center>
<img src='./formulari.png' style='height: 30em;'/>
</center>

Podeu veure que hi ha camps pel nom del client, la seva adreça de correu electrònic, el tipus de l'habitació, el nombre d'hostes, les dates d'arribada i sortida... Cadascun dels valors d'aquests camps poden ser de tipus diferents: textos per nom i email, enter per nombre d'hostes, dates per les dates d'arribada i sortida, booleà per si cal recollir-lo o no...

Els registres es diferencien de les llistes i les tuples pel fet que el seu nombre de valors és fixe, que cada camp té un nom enlloc d'una posició, i que cada camp pot ser d'un tipus diferent. 


## Declaració i ús d'estructures

Per declarar una estructura en Python utilitzarem les *dataclasses*; hi altres maneres de fer-ho però aquesta em sembla la més versàtil per començar. Aquesta seria una estructura que correspon a la informació d'una pel·lícula de cinema:

```python
from dataclasses import dataclass

@dataclass
class Pellicula:
    identificador: int 
    titol: str
    director: str
    any: int 
    blanc_i_negre: bool 
```

Aquest fragment de codi declara un nou tipus `Pellicula` com a una estructura que conté camps pel seu identificador (un enter), el seu títol i el seu director (dos textos), l'any de producció (un alter enter) i un booleà que indica si és en blanc i negre o no. El títol d'una pel·lícula es desa en el seu camp `titol`.  

Les estructures es defineixen dins de **classes**, una construcció de Python que té moltes més aplicacions que les que veurem per ara. A més, perquè aquestes classes tinguin unes propietats xules cal anotar-les amb `@dataclass`, que cal importar del mòdul estàndard `dataclasses`. Dins de la classe, cada camp té un nom i una anotació de tipus, com si es declarés una variable.

Un cop es té definida una estructura, es poden crear variables d'aquell tipus. Mireu aquest exemple:

```python
p1 = Pellicula(
    1001,
    "Star Wars IV",
    "George Lucas",
    1977,
    False,                  # aquesta darrera coma és opcional
)

p2 = Pellicula(
    1234,
    "The Kid",
    "Buster Keaton",       # incorrecte: hauria de ser "Charlie Chaplin"
    1921,
    True,
)
```

Les variables `p1` i `p2` s'han inicialitzat posant el nom del seu tipus com si fós una funció (de fet, es diu un **constructor**), i donant la llista dels valors dels seus camps, en el mateix ordre en què s'han declarat. Evidentment, aquests valors han de ser compatibles amb els dels camps que s'han
declarat.

Un cop creades, les variables `p1` i `p2` son ara del tipus `Pellicula`:

```python
>>> type(p1)
<class '__main__.Pellicula'>
```

L'única operació que es pot fer sobre una variable de tipus estructura és seleccionar un dels seus camps. Això es fa escrivint el nom de la variable, un punt i el nom del camp. 

Per exemple, aquest fragment diu si `p1` és anterior o posterior a `p2`:

```python
if p1.any < p2.any:
    print("Anterior")
else:
    print("Posterior")
```

I aquest tros de codi corregeix el director de *The Kid*:

```python
p2.director = "Charlie Chaplin"
```

En el primer cas, s'han seleccionat els camps `any` per consultar-los. En el segon cas, s'ha seleccionat el camp `director` de `p2` per modificar-lo. 

En Python, les estructures també són objectes, com les llistes. Per tant, les estructures es manipulen a través de referències, amb els avantatges i riscos que això comporta.

Hi ha dues diferències fonamentals entre les tuples i les estructures: 

1. Mentre que les tuples tenien camps identificats per nombres començant per zero, les estructures tenen els seus camps identificats per noms. Quan hi ha molts camps, això facilita la seva manipulació (no cal recordar que 3 representa el títol).

2. Mentre que les tuples eren immutables, canviar els valors dels camps de les estructures és possible (i freqüent).

I ja està! No hi ha res més: Les estructures són ben senzilles de declarar i d'utilitzar. A continuació en donem algunes aplicacions i en veiem més detalls.



<Autors autors="jpetit"/> 

