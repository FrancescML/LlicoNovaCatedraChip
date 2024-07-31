# Cues de prioritats: `priority_queue`

## Introducció

Una **cua de prioritats** és un tipus abstracte de dades que emmagatzema una
col·lecció d'elements amb les operacions principals següents:

-   afegir un nou element,
-   consultar si hi ha algun element,
-   consultar l'element màxim de la col·lecció que encara no s'hagi eliminat, i
-   eliminar aquest element.

També es podrien considerar cues de prioritats on l'element que es consulta o
elimina és el mínim de la col·lecció (enlloc del màxim).

Una cua de prioritats pot emmagatzemar elements repetits, cadascun d'ells
sortirà de la cua quan li arribi el torn.

## Il·lustració

<img src='./priority_queue.png' style='height: 10em; float: right; margin: 0 0 1em 1em;'/>

Podem veure una cua de prioritats com un contenidor on es col·loquen elements. En
tot moment, l'únic element accessible és el més gran del contenidor. Aquest es
pot consultar i/o eliminar de la cua de prioritats. Accedir a l'element màxim
de la cua de prioritats quan aquesta és buida és un error.

A l'animació interactiva següent, feu clic damunt dels elements per ficar-los
a la cua de prioritats. Feu clic a la cua de prioritats per treure'n l'element
més gran (el soldat romà de mes rang: tribú, legat, centurió, legionari).

TODO:

```c++
<svg id='svg-priority_queue' class='figura' style='width: 100%; height: 400px; margin-bottom: 2em;'>
</svg>

<script type="text/coffeescript" src="priority_queue.coffee"></script>

```

## Aplicacions

Les cues de prioritat s'utilitzen quan es vol extendre les
[cues](/stl/queue.html) amb una noció de prioritat: Per exemple, a la vida
real, les dones embarrassades o amb nens, els discapacitats o la gent gran
tenen prioritat a l'hora de seure al transport públic. També, una impressora
pot tenir una cua de treballs pendents d'imprimir, però pot caler tractar-los
segons el càrrec de l'empleat que ha enviat el treball. En aplicacions de
simulació d'esdeveniments discrets és molt freqüent tenir esdeveniments
associats a instants de temps que desencadenen nous esdeveniments; el
simulador pot guardar els esdeveniments pendents en una cua de prioritats i, a
cada iteració, treure el següent esdeveniment (el de temps mínim) de la cua i
posar-n'hi de nous per ser tractats més endavant. Molts algorismes utilitzen
cues de prioritats com una estructura de dades que permet desar informació
pendent de tractar en un ordre concret.

## El tipus `priority_queue`

La llibreria estàndard de C++ proporciona el tipus `priority_queue<T>` que implementa
cues de prioritats d'elements de tipus `T`. Per utilitzar el tipus `priority_queue<T>` cal
fer un `#include <queue>` (i no un
`#include <priority_queue>`, curiosament).

Les cues de prioritats de C++ tenen (de forma simplificada) aquesta interfície:

```c++
template <typename T>
class priority_queue {
public:
    priority_queue();           // Crea una cua de prioritats buida
    void push(const T& x);      // Afegeix x a la cua de prioritats
    void pop();                 // Treu l'element més gran de la cua de prioritats
    T top() const;              // Retorna l'element més gran de la cua de prioritats
    bool empty() const;         // Indica si la cua de prioritats és buida
    int size() const;           // Retorna el nombre d'elements a la cua de prioritats
};
```

⚡ Recordeu que els mètodes `top()` i `pop()`
tenen com a precondició que la cua de prioritats no sigui buida.
Intentar usar-los quan la cua de prioritats està buida
és un error de programació amb efectes indefinits en execució.

El constructor i les operacions consultores (`top()`,
`empty()` i `size()`) prenen cost constant ($O(1)$). Les operacions
modificadors (`push()` i `pop()`) prenen cost $O(\log n)$ on $n$ és la talla
de la cua de prioritats.
A més, les cues de prioritats de C++, com els altres contenidors estàndard,
es poden copiar i comparar, amb cost $O(n)$.

L'ordre de les cues de prioritats ve donat per un comparador que
es correspon al operador `<` sobre aquell tipus `T`. Per canviar el comparador,
cal donar més informació; vegeu els exemples següents.

Si teniu curiositat, les cues de prioritats s'implementen internament amb una
estructura de dades anomenada _heap_. L'especificació completa es pot trobar
a [cppreference](http://en.cppreference.com/w/cpp/container/priority_queue).

## Exemple: Ordenar decreixenment una seqüència d'enters

Considerem que volem llegir una seqüència d'enters i escriure-la en ordre decreixent.

És clar que aquest problema es podria resoldre utilitzant [la funció
d'ordenació](/stl/sort.html) `sort()`. Una altra manera possible de resoldre
és mitjantçant una cua de prioritats:

1. Primer, es crea una cua de prioritats d'enters.
2. Després, es llegeix cada element de l'entrada i es guarda dins la cua de prioritats.
3. Finalment, mentre la cua de prioritats no és buida, s'escriu i es descarta l'element màxim de la cua de prioritats.

Donat que els elements de la cua de prioritats es treuen del més gran al més petit perquè cada cop s'extreu el màxim, és evident que els valors que s'han llegit apareixeran en ordre decreixent.

Implementem ara els passos anteriors:

1. Declaració de la cua de prioritats:

    Per declarar que `pq` és una variable que emmagatzema una cua de prioritats d'enters
    cal fer

    ```
    priority_queue<int> pq;
    ```

    Recordeu, però, que per poder utilitzar cues de prioritats, cal abans haver inclòs
    la biblioteca `<queue>`.

2. Ompliment de la cua de prioritats:

    Per poder llegir l'entrada, utilitzarem un bucle `while (cin >> x)`, on `x`
    és una variable entera que anirà prenent seqüèncialment tots els enters de
    l'entrada fins que s'acabin. Per a cada element `x` llegit, caldrà
    afegir-lo a la cua de prioritats `pq` mitjantçant la instrucció `pq.push(x)`. Així:

    ```
    int x;
    while (cin >> x) {
        pq.push(x);
    }
    ```

3. Buidat de la cua de prioritats:

    Un cop llegits tots els elements, aquests es trobaran a la cua de prioritats `pq`.
    Per escriure'ls tots en ordre decreixent, cal anar escrivint l'element
    al cim de la cua de prioritats (amb `s.top()`)
    i treure'l (amb `pq.pop()`), fins que la cua de prioritats
    quedi buida (amb `pq.empty()`):

    ```
    while (not pq.empty()) {
        cout << pq.top() << endl;
        pq.pop();
    }
    ```

<a name='sample1'></a>
Aquest és el programa complet:

```c++
#include <iostream>
#include <queue>
using namespace std;

int main () {
    priority_queue<int> pq;
    int x;
    while (cin >> x) {
        pq.push(x);
    }
    while (not pq.empty()) {
        cout << pq.top() << endl;
        pq.pop();
    }
}
```

⚡ Fixeu-vos que per accedir al màxim d'una cua de prioritats o per eliminar-
lo, és necessari que la cua de prioritats no estigui buida. Justament aquest
és el cas en el programa anterior: la condició del bucle ho assegura.

Per a una entrada amb $n$ elements, aquest algorisme aplicaca $n$ operacions
`push()`, $n$ operacions `pop()` i $n$ operacions `top()` en una cua de
prioritats que no té mai més de $n$ elements. En conseqüència, el seu cost és
$O(n\log n)$. Aquest seria el mateix cost que desant les dades en un vector i
ordenant-lo amb la funció `sort()` de la biblioteca `<algorithm>`. A la
pràctica, però, el darrer és més eficient.

## Exemple: Ordenar creixenment una seqüència d'enters

Considerem que volem llegir una seqüència d'enters i escriure-la en ordre creixent
(enlloc d'ordre decreixent, com abans).

La solució és idèntica a l'anterior, utilitzant una cua de prioritats per a mínims enlloc
de màxims. L'únic canvi necessari és a la declaració de la cua de prioritats:

```c++
#include <iostream>
#include <queue>
using namespace std;

int main () {
    priority_queue<int, vector<int>, greater<int>> pq;      // 👁 cua de prioritats *per a mínims*
    int x;
    while (cin >> x) {
        pq.push(x);
    }
    while (not pq.empty()) {
        cout << pq.top() << endl;
        pq.pop();
    }
}
```

## Exemple: Ordenar una seqüència de punts segons la seva distància a l'orígen

Considerem ara que volem llegir una seqüència de punts en el plà i donar-la ordenada
segons llur distància a l'orígen.

La solució és semblant a l'anterior, utilitzant ara elements de tipus `Punt`
que es comparan amb una funció específica. El tipus `Punt` el declararem com
una estructura amb dos camps reals que guardaràn les
seves dues coordenades X i Y:

```c++
struct Punt {
    double x, y;
};
```

Per definir l'operació de comparació entre punts escrivim una funció
anomenada `operator<` que, donats dos punts, indica si el primer punt és més
llunyà a l'orígen que el segon. La funció `operator<()` no fa altra cosa que definir
l'operador `<` per a punts. La notació infixa `p < q` habitual és equivalent a
la notació funcional `operator<(p, q)`.

```c++
bool operator< (const Punt& p, const Punt& q) {
    double dp = p.x*p.x + p.y*p.y;
    double dq = q.x*q.x + q.y*q.y;
    return dp > dq;
}
```

Noteu que s'ha calculat la distància al quadrat dels punts respecte l'orígen i no
la seva distància euclidea (es faria amb `sqrt(p.x*p.x + p.y*p.y)`)
perquè d'aquesta forma s'estalvien dues arrels quadrades.

Amb tot això, el programa sencer quedaria així:

```c++
#include <iostream>
#include <queue>
using namespace std;

struct Punt {
    double x, y;
};

bool operator< (const Punt& p, const Punt& q) {
    double dp = p.x*p.x + p.y*p.y;
    double dq = q.x*q.x + q.y*q.y;
    return dp > dq;
}

int main () {
    priority_queue<Punt> pq;
    Punt p;
    while (cin >> p.x >> p.y) {
        pq.push(p);
    }
    while (not pq.empty()) {
        cout << pq.top().x << " " << pq.top().y << endl;
        pq.pop();
    }
}
```

<Autors autors="jpetit roura"/>
