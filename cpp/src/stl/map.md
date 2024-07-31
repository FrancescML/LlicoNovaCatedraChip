# Diccionaris: `map`

## Introducció

Un **diccionari** (o **mapa**) és un tipus abstracte de dades que permet
emmagatzemar una col·lecció d'elements. Cada element és una parell amb dos camps:

-   una **clau** i
-   un **valor**.

Les operacions estan guiades per les claus, les quals han de ser úniques a
cada diccionari. Les operacions principals són els següents:

-   inserir un element amb clau `k` i un valor `v`
    (quan s'insereix un element amb una clau que ja era al diccionari, el
    valor anterior es perd i és substituït pel nou),
-   esborrar un element amb clau `k`
    (no passa res si `k` no era al diccionari),
-   trobar un element amb clau `k` (o saber que no hi és), i
-   consultar el nombre d'elements al diccionari.

Hi ha altres operacions, com les que permeten recórrer tots els elements d'un
diccionari o que permeten utilitzar un diccionari com si fos un vector
generalitzat.

## Aplicacions

<img src='./maps.png' style='height: 10em; float: right; margin: 0 0 1em 1em;'/>

Els diccionaris són estructures de dades recurrents en moltes aplicacions.

Per exemple, en una aplicació de traducció de textos del català a l'anglès,
en algun lloc caldrà emmagatzemar que la traducció de `"hola"` és
`"hello"`, que la d'`"adéu"` és `"bye"`, que la de `"gat"` és `"cat"` i així
successivament. En aquest cas les paraules en català són les claus
i les paraules en angles són els seus valors associats. En aquesta aplicació
serà capital que l'operació de consulta (donada una paraula en català,
saber quina és la traducció anglesa) sigui eficient.

Un aplicació de contactes per a mòbils també seria un exemple de diccionari.
En aquest cas, les claus serien noms de persones i els valors les seves dades
com ara telèfons, adreces físiques i electròniques i data de l'aniversari.

## El tipus `map`

La llibreria estàndard de C++ proporciona diccionaris d'elements on les claus
són de tipus `T` i els valors de tipus `V` amb el tipus `map<K, V>`. Per
usar-los, cal fer un `#include <map>`. De forma simplificada —ometem
intencionadament molts detalls— aquesta és la seva interfície:

```c++
template <typename K, typename V>
class map {
public:
    map();                              // Crea un diccionari buit
    void insert(const pair<K, V>& e);   // Afegeix un element e, on e = {k, v}
    void erase(const K& k);             // Elimina l'element amb clau k
    int count(const K& k);              // Diu si hi ha un element amb clau k
    bool empty() const;                 // Indica si el diccionari és buit
    int size() const;                   // Retorna el nombre d'elements (cardinalitat)

    iterator begin();                   // Retorna un iterador al primer element del diccionari
    iterator end();                     // Retorna un iterador passat el darrer element del diccionari
    iterator find(const K& k);          // Retorna un iterador a l'element amb clau k, o end() si no hi és

    V& operator[](const K& k);          // Retorna una referència a l'element amb clau k (afegint-lo, si no hi era)
};
```

Les operacions `insert()`, `erase()`, `find()`, `[]` i `count()` prenen temps
$\O(\log n)$ on $n$ és el nombre d'elements (`size()`) del diccionari. Les demés
operacions prenen temps constant. Els diccionaris, com els altres contenidors
estàndard, es poden copiar i comparar, amb cost $\O(n) $.

Els elements d'un diccionari són de tipus `pair<K, V>`. El tipus `pair` fa
part de la llibreria estàndard de C++ i és senzillament un `struct` amb dos
camps: `first` (de tipus `K`) i `second`(de tipus `V`).

Es poden recórrer tots els element d'un diccionari `d` (del que té clau més
petita al que té clau més gran) utilitzant un bucle `for`:

```c++
for (auto e : d) {
    ... fer quelcom amb e.first (clau) i e.second (valor) ...
}
```

El recorregut dels $n$ elements d'un diccionari triga temps $\O(n)$.

Si teniu curiositat, els diccionaris sovint s'implementen internament
amb arbres equilibrats (arbres AVL o arbres roig-negre).
L'especificació completa dels diccionari de C++ es pot trobar a
[cppreference](http://en.cppreference.com/w/cpp/container/map).

## Exemple: Comptar totes les paraules d'un text

Considerem que, donat un text, volem obtenir la llista de totes les seves
paraules i de les seves aparicions, ordenada alfabèticament i sense
repeticions. Per exemple, donada l'entrada

```c++text
el gegant del pi ara balla ara balla el gegant del pi ara balla pel cami
```

es vol obtenir la sortida

```c++text
ara 3
balla 3
cami 1
del 2
el 2
gegant 2
pel 1
pi 2
```

La forma de fer-ho és utilitzant un diccionari. El diccionari tindrà com a claus
les paraules del text. I cada paraula tindrà associada un enter que és el nombre de
vegades que aquella paraula ha aparegut en el text. Un diccionari `c` com aquest es
declara doncs així:

```c++
    map<string, int> c;
```

Començant per un diccionari buit, anirem llegint seqüencialment cada paraula del
text. Per a cada paraula `w`, si `w` no era encara al diccionari, l'afegirem associant-li
el comptador 1 (perquè al ser nova, només ha aparegut un cop). En canvi,
si `w` ja era al diccionari, li incrementarem d'una unitat el seu comptador d'ocurrències
associat. Per a cercar les paraules el diccionari, utilitzarem l'operació
`c.find(w)` que, donada una paraula `w` ens retorna un iterador
de forma semblant als [conjunts](set.html). Aquesta és la lògica:

```c++
    string w;
    while (cin >> w) {
        auto it = c.find(w);
        if (it == c.end()) {
            c.insert({w, 1});
        } else {
            ++it->second;
        }
    }
```

Un cop llegit tot el text, recorrerem totes els elements del diccionari,
escrivint cada clau i comptador. Com que el recorregut d'un diccionari és en
ordre de les claus, les paraules ens apareixeran ordenades alfabèticament.
Així:

```c++
    for (auto elem : c) {
        cout << elem.first << " " << elem.second << endl;
    }
```

El programa complet és aquest:

```c++
#include <iostream>
#include <map>
#include <string>
using namespace std;

int main() {
    map<string, int> c;
    // llegir l'entrada i omplir el diccionari
    string w;
    while (cin >> w) {
        auto it = c.find(w);
        if (it == c.end()) {
            c.insert(w, 1);
        } else {
            ++it->second;
        }
    }
    // escriure el diccionari
    for (auto e : c) {
        cout << e.first << " " << e.second << endl;
    }
}
```

Fixeu-vos que quan accedim a `first` o `second` a través d'un element
utilitzem `.` però que quan hi accedim a través d'un iterador utilitzem `->`.
És la diferència entre tenir un `struct` o un punter (iterador) a un `struct`.

Podem fer el programa més senzill utilitzant la notació `[]` sobre els diccionaris:
Si `w` és al diccionari `c`, llavors `c[w]` dóna accés al valor de `w`.
Si `w` no és al diccionari `c`, llavors `c[w]` l'insereix, donant-li com a valor
el valor per defecte del tipus dels valors, que en el cas dels enters, és zero.
Conseqüentment, si fem `++c[w];` aconseguim l'efecte volgut tant si `w` és o no
al diccionari:

```c++
int main() {
    map<string, int> c;
    // llegir l'entrada i omplir el diccionari
    string w;
    while (cin >> w) {
        ++c[w];
    }
    // escriure el diccionari
    for (auto e : c) {
        cout << e.first << " " << e.second << endl;
    }
}
```

Com podeu veure al programa anterior, en aquest cas s'ha utilitzat el
diccionari de forma semblant a un vector! En efecte, els diccionaris són una
generalització molt útil dels vectors: el tipus de les seves claus no es
restringeix als naturals i poden tenir un nombre dinàmic d'elements.

## Exemple: Índexació de documents

Suposem que volem indexar diferents documents de text de manera que, donada
una paraula, poguem trobar eficientment tots els documents que continguin aquella
paraula. Per simplificar, suposem que cada document ens ve donat per una seqüència
de paraules en una línia de l'entrada, i l'identificador del document és justament
la primera paraula de cada línia.

Per exemple, si aquests són els nostres documents

```c++text
mati        cada dia al mati canta el gall kiririki
gegant      el gegant del pi ara balla ara balla el gegant del pi ara balla pel cami
nina        dalt del cotxe hi ha un nina que repica els picarols
balco       el gall i la gallina estaven al balco
```

preguntar per `gall` hauria de retornar `mati` i `balco`, no necessariament en aquest ordre.
Preguntar per `cotxe` hauria de retornar `nina` i preguntar
`patata` no hauria de retornar res.

Per tal de no haver de llegir tots els documents cada cop que es demana una
paraula, construirem un **índex dels documents**: Un índex és una estructura
de dades que indica a quin document apareix cada paraula. La idea és semblant
als índexs que al final dels llibres diuen a quines pàgines apareix cada terme
important.

En el nostre cas, podem veure que un índex és un diccionari que, donades
paraules, retorna conjunts d'identificadors de documents, és a dir, conjunts de
paraules. Per tant, el nostre índex tindrà aquest tipus: `map<string,
set<string>>`.

La primera fase consisteix en construir l'índex tot llegint els documents:

```c++
map<string, set<string>> contruir_index() {
    map<string, set<string>> index;
    string linia;
    while (getline(cin, linia)) {
        istringstream iss(linia);
        string id;
        iss >> id;
        string par;
        while (iss >> par) {
            index[par].insert(id);
        }
    }
    return index;
}
```

Aquesta funció llegeix l'entrada línia per línia
(utiitzant un [istringstream](istringstream.html)). Per a cada línia, deixa a la
variable `id` la seva primera paraula i, per a tota la resta de paraules
`par`, insereix `id` a l'entrada `par` de l'índex. Així, a l'índex que
s'acaba retornant, hi ha una entrada per a cada possible paraula de tots els
documents i cada paraula conté el conjunt d'indentificadors de documents que
contenen aquella paraula.

La segona fase consisteix en recuperar tots els identificadors de documents
que contenen una paraula donada:

```c++
void escriure_documents(const map<string, set<string>>& index, const string& par) {
    auto it = index.find(par);
    if (it != index.end()) {
        cout << "La paraula " << par << " apareix en aquests documents:" << endl;
        for (string id : it->second) {
            cout << id << endl;
        }
    } else {
        cout << "La paraula " << par << " no apareix en cap document." << endl;
    }
}
```

Primer, es cerca la paraula a l'índex, amb `find()`, que en retorna un
iterador `it`. Si la paraula hi és (`it != index.end()), només cal recórrer el
seu valor a `it->second`, que és el conjunt d'identificadors que cal escriure.
De propina, com que els `set`s desen les dades ordenades, els identificadors
ens apareixeran en ordre creixent!

Bon exemple, oi? D'aquí a fer un Google només queda un petit pas... 😏

<Autors autors="jpetit roura"/>
