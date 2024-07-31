# Conjunts i Diccionaris no ordenats: `unordered_set` i `unordered_map`

## Introducció

<img src='./unordered.png' style='height: 10em; float: right; margin: 0 0 1em 1em;'/>

Els [conjunts](set.html) i els [diccionaris](maps.html) tenen una possible
variació: Els conjunts i diccionaris **no ordenats**. La diferència principal
és que en les versions no ordenades, els elements no es mantenen ordenats.
Aquesta diferència té tres repercussions:

-   Quan es recorren els elements, l'ordre és indefinit.

-   Els elements no s'organitzen interiorment a través de l'operador `<` sinó a
    través de l'operador `==` i d'una **funció de dispersió** (_hash function_).

-   Els costos d'algunes operacions són diferents.

A banda d'aquests tres punts, els conjunts i els diccionaris funcionen
pràcticament igual siguin ordenats o no.

## El tipus `unordered_set`

La llibreria estàndard de C++ proporciona conjunts no ordenats d'elements de tipus `T` amb
el tipus `unordered_set<T>`. Per usar-los, cal fer un `#include <unordered_set>`. De forma
simplificada —ometem intencionadament molts detalls— aquesta és la seva
interfície:

```c++
template <typename T>
class unordered_set {
public:
    unordered_set();            // Crea un conjunt no ordenat buit
    void insert(const T& x);    // Hi afegeix x (no passa res si ja hi era)
    void erase(const T& x);     // Hi elimina x (no passa res si no hi era)
    int count(const T& x);      // Diu si hi ha x
    bool empty() const;         // Indica si és buit
    int size() const;           // Retorna el nombre d'elements (cardinalitat)

    iterator begin();           // Retorna un iterador al primer element del conjunt
    iterator end();             // Retorna un iterador passat el darrer element del conjunt
    iterator find(const T& x);  // Retorna un iterador a l'element x del conjunt, o end() si no hi és
};
```

Les operacions `insert()`, `erase()`, `find()` i `count()` prenen temps
$\O(1)$ en mitjana i $\O(n)$ en el cas pitjor, on $n$ és el nombre d'elements
(`size()`) del conjunt no ordenat. Les demés operacions prenen temps constant.
Els conjunts no ordenats, com els altres contenidors estàndard, es poden copiar i
comparar, amb cost $\O(n) $.

Els elements en un conjunt `s` es poden recórrer.
Per a fer-ho s'utilitza un bucle `for`:

```c++
for (T x : s) {
    ... fer quelcom amb x ...
}
```

Ara bé, mentre que per a un
`set` el recorregut es fa de l'element més petit a l'element més gran,
per a un `unordered_set` l'ordre del recorregut no es troba definit.
El recorregut dels $n$ elements d'un conjunt triga temps $\O(n)$.

Com que els conjunts no ordenats no tenen ordre (!), no tenen les
operacions `lower_bound()` ni `upper_bound()`.

Si teniu curiositat, els conjunts no ordenats s'implementen internament
amb taules de dispersió (_hash tables_).
L'especificació completa dels conjunts no ordenats de C++ es pot trobar a
[cppreference](http://en.cppreference.com/w/cpp/container/unordered_set).

## El tipus `unordered_map`

La llibreria estàndard de C++ proporciona diccionaris no ordenats d'elements on les claus
són de tipus `T` i els valors de tipus `V` amb el tipus `unordered_map<K, V>`. Per
usar-los, cal fer un `#include <unordered_map>`. De forma simplificada —ometem
intencionadament molts detalls— aquesta és la seva interfície:

```c++
template <typename K, typename V>
class unordered_map {
public:
    unordered_map();                    // Crea un diccionari no ordenat buit
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
$\O(1)$ en mitjana i $\O(n)$ en el cas pitjor, on $n$ és el nombre d'elements
(`size()`) del diccionari no ordenat. Les demés operacions prenen temps constant.
Els diccionari no ordenats, com els altres contenidors estàndard, es poden copiar i
comparar, amb cost $\O(n) $.

Es poden recórrer tots els element d'un diccionari no ordenat `d`
utilitzant un bucle `for`:

```c++
for (auto e : d) {
    ... fer quelcom amb e.first (clau) i e.second (valor) ...
}
```

Ara bé, mentre que per a un
`map` el recorregut es fa de l'element amb clau més petita a l'element
amb clau més gran,
per a un `unordered_map` l'ordre del recorregut no es troba definit.
El recorregut dels $n$ elements d'un conjunt triga temps $\O(n)$.

Si teniu curiositat, els diccionaris no ordenats també s'implementen
internament amb taules de dispersió. L'especificació completa dels
diccionaris no ordenats de C++ es pot trobar a
[cppreference](http://en.cppreference.com/w/cpp/container/unordered_map).

## Exemple: Llistar totes les paraules d'un text

Considerem que, donat un text, volem obtenir la llista de totes les seves
paraules, sense repeticions. Per exemple, donada l'entrada

```c++text
el gegant del pi ara balla ara balla el gegant del pi ara balla pel cami
```

es vol obtenir una sortida com ara

```c++text
gegant
balla
ara
cami
pi
el
pel
del
```

(l'ordre de les línies no importa).

La solució és idèntica a la feta per `set`s, però utilitzant
ara `unordered_set`s:

```c++
#include <iostream>
#include <unordered_set>
#include <string>
using namespace std;

int main() {
    unordered_set<string> s;
    string w;
    while (cin >> w) s.insert(w);
    for (string w : s) cout << w << endl;
}
```

Suposem que hi $n$ paraules en el text. Llavors, mentre que aquest codi amb
`set`s pren temps $O(n\log n)$ en el cas pitjor, el codi amb `unordered_set`s
pren temps $O(n)$ en mitjana i temps $O(n^2)$ en el cas pitjor. Quina solució
és preferible dependrà dels requeriments de l'aplicació.

El programa anterior és fàcilment adaptable a conjunts no ordenats per poder
comptabilitzar el nombre d'ocurrències de cada paraula:

```c++
int main() {
    unordered_map<string, int> c;
    string w;
    while (cin >> w) ++c[w];
    for (auto e : c) cout << e.first << " " << e.second << endl;
}
```

## Funcions de dispersió sobre tipus propis

En alguns casos voldrem definir conjunts no ordenats per a estructures de
dades pròpies al nostre programa. Per a fer-ho, cal definir dues coses:

-   Un **operador d'igualtat** (`==`) per determinar si dues dades són
    o no iguals.

-   Una **funció de dispersió** que, donada una dada, retorni un natural.
    EXPLIXCAR QUÈ ÉS UNA FUNCIó DE HASH.

Per exemple, considerem que volem crear una estructura `Punt` per a
punts en dues dimensions. Llavors un punt es podria definir així:

```c++
struct Punt {
    int x, y;
};
```

Per definir l'operador d'igualtat entre dos punts cal afegir una
funció com la següent a `Punt`:

```c++
    friend bool operator== (const Punt& p1, const Punt& p2) {
        return p1.x == p2.x and p1.y == p2.y;
    }
```

L'operador `==` senzillament indica que dos punts donats són iguals si
les seves coordenades són iguals (cal fer-ho explícitament, perquè
C++ no inclou igualtat per defecte als `struct`s).

Per definir la funció de dispersió, cal seguir una sintàxi farragosa:

```c++
    struct Hash {
        size_t operator() (const Punt& p) const {
            return hash<int>()(p.x) + hash<int>()(p.y);
        }
    };
```

L'important és que es calcula el hash d'un punt combinant les funcions de hash de les seves coordenades. En aquest cal la combinació ha estat via la suma (amb `+`). També es sol utilitzar
la o exclusiva (amb `^`).

El codi següent aplega els fragments anteriors i en dóna un exemple d'ús
per a un conjunt no ordenat de punts.

```c++
struct Punt {
    // un punt té dues coordenades
    int x, y;

    // operador d'igualtat entre punts
    friend bool operator== (const Punt& p1, const Punt& p2) {
        return p1.x == p2.x and p1.y == p2.y;
    }

    // funció de hash sobre punts
    struct Hash {
        size_t operator() (const Punt& p) const {
            return hash<int>()(p.x) + hash<int>()(p.y);
        }
    };
};

int main() {
    unordered_set<Punt, Punt::Hash> nuvol;
    nuvol.insert({5, 2});
}
```

<Autors autors="jpetit roura"/>
