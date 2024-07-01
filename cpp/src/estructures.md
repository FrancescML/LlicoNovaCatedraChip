# Estructures

<img src='./estructures.png' style='height: 8em; float: right; margin: 0 0 1em 2em;'/>

Aquesta lliçó introdueix com crear uns altres tipus dades molt habituals: les
estructures (també anomenades _registres_, _fitxes_, o _tuples_). Les
estructures permeten emmagatzemar en una sola variable un nombre fixe de dades
de diferents tipus i accedir a qualsevol d'elles directament a través del seu
nom.

## Introducció

Una **estructura** és una col·lecció de dades dades relacionades que
s'emmagatzamen en un sol lloc, com un tot. Cada dada d'una estructura
s'anomena **camp** i té un nom i un tipus.
Per exemple, un punt es podria descriure amb una estructura amb dos camps que
representen les seves coordenades X i Y. I un cercle es podria descriure amb una
estructura amb dos camps: un punt pel seu centre i un real pel seu radi.

És fàcil imaginar-se les estructures com a plantilles de formularis: En una
plantilla de formulari hi ha diferents camps, cada camp té un nom i un tipus.
Cada usuari omplirà la plantilla del formulari amb les seves pròpies dades.
Per exemple, aquest és un formulari per la reversa d'una habitació en un hotel:

<center>
<img src='./formulari.png' style='height: 30em;'/>
</center>

Podeu veure que hi ha camps pel nom del client, la seva adreça de correu
electrònic, el tipus de l'habitació, el nombre d'hostes, les dates d'arribada i
sortida... Cadascun dels valors d'aquests camps poden ser de tipus diferents:
textos per nom i email, enter per nombre d'hostes, dates per les dates
d'arribada i sortida, booleà per si cal recollir-lo o no...

Els registres es diferencien dels vectors pel fet que el seu nombre de valors és
fixe, que cada camp té un nom enlloc d'una posició, i que cada camp pot ser d'un
tipus diferent. Es diu que les estructures són estructures de dades
**heterogènies**.

## Declaració i ús d'estructures

Per declarar una estructura s'utilitza la paraula clau `struct`, es dóna el seu
nom i els camps que la componen. Cada camp té un nom de camp i un tipus. Per
exemple, aquesta seria una estructura que correspon a la informació d'una
pel·lícula de cinema:

```c++
struct Pellicula {
    int identificador;
    string titol;
    string director;
    int any;
    bool blanc_i_negre;
};     // no oblideu aquest punt-i-coma
```

Aquest fragment de codi declara un nou tipus `Pellicula` com a una estructura que
conté camps pel seu identificador (un enter), el seu títol i el seu director
(dos textos), l'any de producció (un alter enter) i un booleà que indica si és
en blanc i negre o no. El títol d'una pel·lícula es desa en el seu camp
`titol`.

**Compte:** Cal posar un punt-i-coma a darrera la clau que tanca l'estructura.

Un cop es té definida una estructura, es poden crear variables d'aquell tipus.
Mireu aquest exemple:

```c++
Pellicula p1 = {
    1001,
    "Star Wars IV",
    "George Lucas",
    1977,
    false,                  // aquesta darrera coma és opcional
};

Pellicula p2 = {
    1234,
    "The Kid",
    "Buster Keaton",        // incorrecte: hauria de ser "Charlie Chaplin"
    1921,
    true,
};

Pellicula p3 = p1;
```

Fixeu-vos que les variables `p1` i `p2` tenen el tipus `Pellicula` i que
s'inicialitzen (entre claus, de forma semblant als vectors) donant la llista
dels valors dels seus camps, en el mateix ordre en què s'han declarat.
Evidentment, aquests valors han de ser compatibles amb els dels camps que s'han
declarat.

La variable `p3` també és de tipus `Pellicula`, i el seu valor és una
còpia del de `p1`. Per tant `p1` i `p3` representen la mateixa pel·lícula.
Aquesta assignació s'ha pogut fer perquè `p1` i `p3` eren del mateix tipus.

L'única operació que es pot fer sobre una variable de tipus estructura és
seleccionar un dels seus camps. Això es fa escrivint el nom de la variable,
un punt i el nom del camp. Per exemple, aquest tros de codi corregeix
el director de _The Kid_:

```c++
p2.director = "Charlie Chaplin";
```

I aquest fragment diu si `p1` és anterior o posterior a `p2`:

```c++
if (p1.any < p2.any) {
    cout << "Anterior";
} else {
    cout << "Posterior";
}
```

En el primer cas, s'ha seleccionat el camp `director` de `p2` per modificar-lo.
En el segon cas, s'han seleccionat els camps `any` per consultar-los.

I ja està! No hi ha res més: Les estructures són ben senzilles de declarar i
d'utilitzar. A continuació en donem algunes aplicacions i en veiem més detalls.

<Autors autors="jpetit"/>
