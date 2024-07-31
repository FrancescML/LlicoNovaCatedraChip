# Llistes: `list`

## Introducció

Una **llista** és un tipus abstracte de dades que permet emmagatzemar i
recórrer una col·lecció d'elements de forma seqüencial. Les operacions
principals són les següents:

-   recórrer seqüencialments els elements de la llista (cap endavant
    o cap enrera) des d'un principi fins a un final,
-   inserir nous elements en qualsevol punt de la llista, i
-   i esborrar elements en qualsevol punt de la llista.

També existeixen operacions per moure subllistes entre llistes (_splice_), però
aquesta lliçó no les contempla.

## Il·lustració

<img src='./list.png' style='height: 10em; float: right; margin: 0 0 1em 1em;'/>

De forma semblant als vectors, les llistes emmagatzemen una seqüència
d'elements, els uns rera els altres. Ara bé, les llistes no ofereixen un accés
directe sinó un **accés seqüencial**: Per trobar l'$i$-èsim un element d'una
llista cal passar pels $i-1$ elements anteriors.

Per tant, el temps d'accés no
és constant com als vectors, sinó lineal. A canvi, les llistes permeten
inserir i esborrar elements de la seqüència en temps constant, mentre que els
vectors requereixen temps lineal.

## Tutorial

### Iteradors

Les llistes proporcionen un mecanisme anomenat **iterador** per tal de poder
accedir als seus elements. Cada llista ofereix un iterador al seu primer
element i a un iterador passat el seu darrer element (final de la llista). Els
iteradors no són els elements propiament dits, sinó que assenyalen (apunten a)
la posició dels elements.

Per veure-ho, suposem que tenim una llista d'enters amb
amb cinc elements:

```c++
list<int> L = {10, 22, 12, 10, 87};
```

Llavors, aquest és l'aspecte que, conceptualment, té `L`:

```c++
begin()                         end()
↓                               ↓
10 ⟷ 22 ⟷ 12 ⟷ 10 ⟷ 87 ⟷ 👻
```

Fixeu-vos que l'iterador `end()` al final de la llista apunta a
un element fictici passat el darrer element real de la llista.

Per accedir a l'element apuntat per un iterador, cal aplicar l'operació
de desreferenciació (`*`) sobre l'iterador. Per exemple, en el cas anterior,

-   `*L.begin()` val `10`, perquè el primer element de la llista, referit
    per `L.begin()` és el primer `10`.

-   `*L.end()` és un error de programació, ja que l'element 👻 apuntat per `L.end()`
    és fictici (no pertany a la llista).

Es poden declarar iteradors i navegar per la llista gràcies a ells. Per exemple,
si fem

```c++
list<int>::iterator it = L.begin();
```

llavors l'iterador `it` assenyala a `begin()`

```c++
begin()                         end()
↓                               ↓
10 ⟷ 22 ⟷ 12 ⟷ 10 ⟷ 87 ⟷ 👻
↑
it
```

i, en aquest punt, `*it` val `10`.

Quan avancem l'iterador `it` utilitzant l'operació d'increment (`++`)

```c++
++it;
```

llavors `it` passa a apuntar al segon element de la llista

```c++
begin()                         end()
↓                               ↓
10 ⟷ 22 ⟷ 12 ⟷ 10 ⟷ 87 ⟷ 👻
      ↑
      it
```

i, en aquest punt, `*it` ara val `22`.

Un iterador que es troba al final de la llista ja no es pot avançar més. Igualment,
un iterador que es troba al principi de la llista ja no es pot recular més (l'operació
per recular un iterador és `--`, ho heu endevinat, oi?). Penseu què vol dir això en una llista buida.

### Insercions

En una llista, es pot inserir un nou element davant de qualsevol iterador. Per exemple,
podem inserir un nou element `33` entre el `10` i el `22` fent

```c++
L.insert(it, 33);
```

de forma que la llista és ara

```c++
begin()                               end()
↓                                     ↓
10 ⟷ 33 ⟷ 22 ⟷ 12 ⟷ 10 ⟷ 87 ⟷ 👻
             ↑
             it
```

### Esborrats

En una llista, també es pot esborrar un element qualsevol donat el seu iterador.
Per exemple, podem esborrar l'element `22` referit per `it` fent

```c++
L.erase(it);
```

de forma que la llista és ara

```c++
begin()                         end()
↓                               ↓
10 ⟷ 33 ⟷ 12 ⟷ 10 ⟷ 87 ⟷ 👻
```

Fixeu-vos que al esborrar un element, el seu iterador queda invalidat.

### Recorreguts

Una operació habitual és recórrer tots els elements d'una llista amb un iterador
des del seu principi fins al seu final. Per exemple, la funció següent
dobla els valors senars d'una llista `L`:

```c++
void dobla_senars(list<int>& L) {
    for (list<int>::iterator it = L.begin(); it != L.end(); ++it) {
        if (*it % 2 != 0) *it *= 2;
    }
}
```

El mateix efecte es pot obtenir un bucle `for (:)` igual que es feia amb els vectors:

```c++
void dobla_senars(list<int>& L) {
    for (int& x : L) {
        if (x % 2 != 0) x *= 2;
    }
}
```

El compilador expandeix aquest tipus de bucles al codi anterior.

## El tipus `list`

La llibreria estàndard de C++ proporciona
llistes d'elements de tipus `T` amb el tipus `list<T>`.
Per usar-les, cal fer un `#include <list>`.
De forma simplificada, aquesta és la seva interfície:

```c++
template <typename T>
class list {
public:

    list();                                 // Crea una llista buida

    void push_front(const T& x);            // Hi afegeix x al principi
    T front() const;                        // En retorna el primer element
    void pop_front();                       // N'esborra el primer element

    void push_back(const T& x);             // Hi afegeix x al final
    T back() const;                         // En retorna el darrer element
    void pop_back();                        // N'esborra el darrer element

    iterator begin() const;                 // N'obté un iterador al principi
    iterator end() const;                   // N'obté un iterador al final

    void erase(iterator it);                // N'esborra l'element apuntat per it
    void insert(iterator it, const T& x);   // Hi insereix x davant de it

    int size() const;                       // En retorna el nombre d'elements
    bool empty() const;                     // Indica si és buida

    class iterator {
    public:
        T& operator*();                     // Retorna una referència a l'element apuntat
        void operator++();                  // Avança l'iterador
        void operator--();                  // Recula l'iterador
    };
};
```

Fixeu-vos que les llistes ofereixen un tipus intern anomenat `iterator`. Els
**iteradors** són una mena de punters d'alt nivell als elements de les llistes, és
a dir, unes dades que ens permeten adreçar els elements de les llistes.
Donat un iterador `it`, `*it` representa l'element adreçat per `it`.
Els iteradors es poden avançar al següent element de la llista
utilitzant `++it` i es poden recular a l'element anterior de la llista
utilitzant `--it`.

Tots els mètodes presentats prenen cost constant.
A més, les llistes de C++, com els altres contenidors estàndard,
es poden copiar i comparar, amb cost proporcional al nombre d'elements.

Si teniu curiositat, les llistes sovint s'implementen internament
amb nodes doblement encadenats.
L'especificació completa de les llistes de C++ es pot trobar a
[cppreference](http://en.cppreference.com/w/cpp/container/list).

## Exemple: Inserció en una llista ordenada

Considerem que tenim una llista d'enters `L` ordenada de petit a gran
i que volem afegir-hi (ordenadament) un nou element `x`. Ho podríem fer així:

```c++
void insereix(list<int>& L, int x) {
    list<int>::iterator it = L.begin();
    while (it != L.end() and *it < x) ++it;
    L.insert(it, x);
}
```

Aquesta funció comença obtenint un iterador `it` al principi de la llista.
Després, mentre l'iterador no ha arribat al final o a un element més gran o
igual que `x`, avança l'iterador. Aleshores, insereix l'element `x` davant
d'`it`, aconseguint deixar la llista ordenada, tant si s'havia arribat al
final com si no.

Podem usar aquesta funció per implementar un algorisme d'ordenació
per inserció amb llistes: Començant amb una llista buida `L`, es van llegint
els elements de l'entrada i inserint-los ordenadament en `L` amb la funció anterior:

```c++
    list<int> L;
    int x;
    while (cin >> x) insereix(L, x);
```

Ara que `L` conté tots els elements de l'entrada ordenats, només cal
recórrer-la d'inici a final amb un iterador tot escrivint els seus elements:

```c++
    for (list<int>::iterator it = L.begin(); it != L.end(); ++it) {
        cout << *it << endl;
    }
```

Com que la notació dels tipus dels iteradors és farragosa, sovint
deixarem que el compilador infereixi automàticament el seu tipus
amb la declaració `auto`:

```c++
    for (auto it = L.begin(); it != L.end(); ++it) {
        cout << *it << endl;
    }
```

`auto` és una drecera per escriure menys, deixant al compilador
la tasca de trobar quin és el tipus adient de la nova variable tot
consultant el tipus de l'expressió amb la qual aquesta s'inicialitza.
Que pràctic!

De fet, aquest bucle es pot escriure encara més senzillament
amb un bucle `for (:)`:

```c++
    for (int x : L) cout << x << endl;
```

Per referència, aquest és el programa sencer, utilitzant les dreceres descrites:

```c++
#include <iostream>
#include <list>
using namespace std;

void insereix(list<int>& L, int x) {
    auto it = L.begin();
    while (it != L.end() and *it > x) ++it;
    L.insert(it, x);
}

int main() {
    list<int> L;
    int x;
    while (cin >> x) insereix(L, x);
    for (int x : L) cout << x << endl;
}
```

El cost d'aquest algorisme per ordenar $n$ elements és $\O(n^2)$.

## Exemple: Josefus

Diu la llegenda que quan els romans van capturar la ciutat de Jotapata,
Josefus i un grup de quaranta soldats es van refugiar en una cova
[$\small[\mathbb{W}]$](https://ca.wikipedia.org/wiki/Flavi_Josep). Allà van
decidir que era millor suïcidar-se abans que lliurar-se. A Josefus, la idea no
li feia del tot el pes, així que va proposar que es fes, però amb ordre: Es
col·locarien en cercle i s'anirien suïcidant per torns, comptant tres a partir
d'un entusiasta primer suïcida. Com que Josefus va calcular ràpidament el lloc
que ocuparia l'últim supervivent, va ocupar aquest lloc i va escapar a la mort
(per poc temps... perquè just després els romans van entrar i el van
esbudellar, tal com es mereixia, per traïdor!).

A l'animació següent hi ha 11 elements disposats en cercle. Cliqueu la **J** de
Josefus per matar l'element actiu, sentir el seu crit, i avançar el cursor
$k=3$ posicions fins que només en sobrevisqui un.

TODO:

```
<svg id='svg-josefus' class='figura' style='width: 100%; height: 400px; margin-bottom: 2em;'></svg>

<script type="text/coffeescript" src="josefus.coffee"></script>
```

Considerem la simulació del procés de Josefus amb una llista: L'entrada
consisteix en una llista (no buida) `L` de `string`s que representen els noms
de les persones a suïcidar-se i en un valor `k` que indica quantes persones
cal saltar d'un mort al següent. La sortida serà el nom del darrer
supervivent.

Com que la llista d'en Josefus és circular, cada cop que volguem avançar un
iterador (amb `++`), haurem de preguntar immediatament després si s'ha arribat
al final de la llista per, en cas afirmatiu, canviar-lo al principi de la
llista (per "donar la volta"). Serà doncs útil tenir aquesta acció:

```c++
void avanca_circular(list<string>::iterator& it, list<int>& L) {
    ++it;
    if (it == L.end()) it = L.begin();
}
```

L'algorisme realitza tantes iteracions com elements hi ha a la llista menys un.
A cada iteració, algorisme treu (mata!) un element de la llista
i avança el torn a l'element `k` posicions davant seu. Al final,
en retorna l'únic element supervivent.
Aquest n'és el codi:

```c++
string josefus(list<string> L, int k) {
    auto it = L.begin();
    for (int n = L.size(); n > 1; --n) {
        auto mort = it;
        avanca_circular(it, L);
        L.erase(mort);
        for (int i = 1; i < k; ++i) avanca_circular(it, L);
    }
    return *it;
}
```

Fixeu-vos que cal prendre precaucions per eliminar l'element apuntat per `it`:
No es pot eliminar `it` de la llista primer i avançar-lo després, perquè, al
haver-lo eliminat de la llista, `it` esdevé invàlid. Per això el codi
anterior crea primer una còpia de `it` en `mort`, després avança `it` i finalment
elimina `mort`.

<Autors autors="jpetit roura"/>
