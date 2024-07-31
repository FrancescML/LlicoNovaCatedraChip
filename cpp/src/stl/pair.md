# Parells: `pair`

## Introducció

<img src='./pair.png' style='height: 10em; float: right; margin: 0 0 1em 1em;'/>

Una **parella** és un tipus de dades molt senzill que permet emmagatzemar juntes
dues dades de qualsevol tipus.

L'aventatge d'utilitzar una parella enlloc d'una `struct` amb dos camps és
purament de brevetat i conveniència, ja que les parelles ofereixen operacions
de comparació mentre que les `struct`s no.

Dit això, algunes estructures de dades més complicades de la llibreria estàndard
de C++ utilitzen parelles, per tant és bo de saber com funcionen.

## El tipus `pair`

La llibreria estàndard de C++ proporciona
parells d'elements de tipus `T1` i `T2` amb el tipus `pair<T1, T2>`.
Per usar-les, cal fer un `#include <utility>`.
De forma simplificada, aquesta és la seva interfície:

```c++
template <typename T1, typename T2>
struct pair {
    T1 first;                               // Primer element
    T2 second;                              // Segon element
    pair(const& T1 fst, const T2& snd);     // Crea un parell ⟨fst, snd⟩
};

template <typename T1, typename T2>
bool operator== (const pair<T1, T2>& a, const pair<T1, T2>& b);
⋮       // i igualment tota la resta de comparadors (!=, <, >, <=, >=)
```

Una `pair` no és doncs altra cosa que una petita `struct` d'accés obert
amb dos camps `first` i `second` i operacions de comparació sobre elles.
Les comparacions funcionen lexicogràficament: primer es mira `first` i,
només en cas d'empat, es mira `second`. El fet de disposar d'aquests comparadors
és segurament el gran avantatge de les parelles respecte les `structs`, que no
disposen per defecte d'aquestes operacions.

L'especificació completa de les parelles de C++ es pot trobar a
[cppreference](http://en.cppreference.com/w/cpp/utility/pair).

## Exemple: Coordenades

Suposem que volem definir un tipus `Punt` per emmagatzemar un punt a través
de coordenades reals en dues dimensions. Una possible opció seria crear-se una
estructura:

```c++
struct Punt {
    double x, y;
};
```

En aquest cas, donat un `Punt p`, podem accedir a `p.x` i `p.y`. Però
donats dos punts `p1` i `p2` no podem saber si són iguals o no sense escriure
codi addicional.

En canvi, definint un `Punt` com un parell de reals

```c++
using Punt = pair<double, double>;
```

ara haurem d'accedir a `p.first` i `p.second` però ja tindrem disponibles les
operacions `==` i `!=` per saber si són iguals o diferents. A més, també
tindrem disponibles les operacions `<`, `>`, `>=`, `>=` per poder-los
comparar.

En ambdós casos, es pot inicialitzar un punt amb aquesta notació:

```c++
Punt p = {2.5, 3.33};
```

però només amb `pair`s es pot fer

```c++
Punt p(2.5, 3.33);
```

<Autors autors="jpetit roura"/>
