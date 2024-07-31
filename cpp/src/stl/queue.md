# Cues: `queue`

## Introducció

Una **cua** és un tipus abstracte de dades que permet emmagatzemar
una col·lecció d'elements amb les operacions principals següents:

-   afegir un nou element,
-   consultar si hi ha algun element,
-   consultar l'element afegit fa més temps que encara no s'hagi eliminat, i
-   eliminar aquest element.

## Il·lustració

<img src='./queue.png' style='height: 10em; float: right; margin: 0 0 1em 1em;'/>

Podem veure una cua com un contenidor on els elements es col·loquen els uns
darrera dels altres, en llur ordre d'arribada. En tot moment, l'únic element
accessible és el que va arribar abans, el qual s'anomena el **primer** de cua.
Aquest es pot consultar i també eliminar. És un error intentar consultar o
eliminar el primer element d'una cua buida.

Sovint es diu que les cues són estructures FIFO (_First In, First Out_),
indicant que el primer element que entri serà el primer a sortir.

A l'animació interactiva següent, feu clic damunt dels elements per ficar-los
a la cua. Feu clic a la cua per treure el seu primer element.
Fixeu-vos que dóna un error si la cua és buida.

TODO:

```c++
<svg id='svg-queue' class='figura' style='width: 100%; height: 450px; margin-bottom: 2em;'>
</svg>

<script type="text/coffeescript" src="queue.coffee"></script>

```

## Aplicacions

Malgrat (o precisament per) la seva simplicitat, les cues són una
estructura de dades fonamental:
A la vida real, els clients d'una fleca s'organitzen en una cua
per ser despatxats segons l'ordre d'arribada.
Un sistema d'atenció telefònica com cal guarda les trucades en una cua
per atendre-les quan un operador les pugui atendre.
Els sistemes operatius
(que són els programes que controlen el maquinari dels ordinadors)
guarden en cues la informació dels processos que s'han d'executar.
I també dels missatges que s'envien entre si.
Les xarxes de computadors utilitzen cues (_buffers_) per gestionar-ne la congestió.
I molts algorismes usen
cues per desar informació pendent de tractar,
respectant l'ordre d'arribada.

## El tipus `queue`

La llibreria estàndard de C++ proporciona
cues d'elements de tipus `T` amb el tipus `queue<T>`.
Per usar-les, cal fer un `#include <queue>`.
De forma simplificada, aquesta és la seva interfície:

```c++
template <typename T>
class queue {
public:
    queue();               // Crea una cua buida
    void push(const T& x); // Hi afegeix x al final
    T front() const;       // En retorna una còpia del primer element
    void pop();            // N'esborra el primer element
    bool empty() const;    // Indica si és buida
    int size() const;      // En retorna el nombre d'elements
};
```

⚡ Recordeu que els mètodes `front()` i `pop()`
tenen com a precondició que la cua no sigui buida.
Intentar usar-los quan la cua està buida
és un error de programació amb efectes indefinits en execució.

Tots els mètodes presentats prenen cost constant.
A més, les cues de C++, com els altres contenidors estàndard,
es poden copiar i comparar, amb cost proporcional al nombre d'elements.

Si teniu curiositat, les piles sovint s'implementen internament
amb vectors, amb nodes enllaçats,
o amb una estructura de dades anomenada _dequeue_
que és una generalització dels vectors.
L'especificació completa de les cues de C++ es pot trobar a
[cppreference](http://en.cppreference.com/w/cpp/container/queue).

## Exemple: Aparellar paraules

Suposem que volem llegir una seqüència de paraules
i aparellar cada paraula que començi amb una minúscula
amb una paraula que començi amb una majúscula,
sempre seguint l'ordre d'entrada:
la primera paraula amb minúscula amb la primera amb majúscula,
la segona amb minúscula amb la segona amb majúscula, etc.
Al final, cal dir quantes paraules han quedat sense aparellar.

Per exemple, per a l'entrada

```c++text
bleda patata Gat nap mongeta Gos Lloro col
```

cal produir la sortida

```c++text
bleda Gat
patata Gos
nap Lloro
2
```

La manera més natural de resoldre aquesta tasca és mitjantçant dues cues:

1. Creem una cua `cmin` per guardar les paraules que comencen amb minúscula en el seu ordre d'aparició,
   i una cua `cmaj` per guardar les paraules que comencen amb majúscula també en el seu ordre d'aparició.
2. Primer, es llegeix cada paraula i es guarda a la cua corresponent.
3. Després, mentre cap de les cues sigui buida,
   s'aparellen els seus primers elements tot desencuant-los d'ambdues.
4. Finalment, les paraules que no s'han aparellat són les que queden a les cues.

Donada l'estructura FIFO de les cues,
les paraules s'aparellaran en l'ordre d'arribada.
I, quan una de les cues s'hagi buidat,
el nombre de paraules desaparellades coincideix amb la mida de l'altra cua.
Aquest és el programa complet:

```c++
#include <iostream>
#include <queue>
#include <cctype>
using namespace std;

int main () {
    queue<string> cmin, cmaj;
    string p;
    while (cin >> p) (islower(p[0]) ? cmin : cmaj).push(p);

    while (not cmin.empty() and not cmaj.empty()) {
        cout << cmin.front() << " " << cmaj.front() << endl;
        cmin.pop();
        cmaj.pop();
    }
    cout << cmin.size() + cmaj.size() << endl;
}
```

La condició `islower(p[0])`,
que també s'hauria pogut escriure `p[0] >= 'a' and p[0] <= 'z'`,
mira si el primer caràcter de `p` és una minúscula.
Aquesta funció es troba dins de les [funcions sobre caràcters](/stl/cctype.html)
de la llibreria estàndard.

Així doncs, la línia

```c++
    while (cin >> p) (islower(p[0]) ? cmin : cmaj).push(p);
```

guarda cada paraula `p ` dins de `cmin` o de `cmaj`
en funció del seu primer caràcter.

A més, fixeu-vos que la condició del segon bucle
assegura que no s'intenta accedir o esborrar el primer element d'una cua buida.

En sortir del segon bucle, com a mínim una de les cues està buida,
i per tant té mida zero.
Com a conseqüència,
el nombre de paraules no aparellades és la suma de les mides de les dues cues.

D'altra banda, notem que aquest problema
també es podria resoldre fàcilment amb dos vectors,
amb les seves operacions típiques:
Senzillament, podríem guardar tots els elements al vector,
i després recorre'l de dreta a esquerra
per escriure els elements en ordre.
En casos així, més val usar cues explícitament,
per deixar clar el seu propòsit.

## Exemple: Generació de racionals

L'arbre de Calkin–Wilf és un arbre binari que representa tots els racionals estrictament
positius. L'arbre té com arrel el racional 1/1 i, qualsevol node
$a/b$ té dos fills $a/(a + b)$ i
$(a + b)/b$. Aquests són els primers nivells de l'arbre de Calkin–Wilf:

TODO:

```c++
<svg id='svg-calkin-wilf-tree' class='figura' style='width: 100%; height: 280px; margin-bottom: 2em;'>
</svg>
<script type="text/coffeescript" src="calkin-wilf-tree.coffee"></script>
```

Considerem que volem generar els `n` primers racionals positius de l'arbre de
Calkin–Wilf (de dalt cap a baix i d'esquerra a dreta). Per exemple, els
10 primers racionals serien 1/1, 1/2, 2/1, 1/3, 3/2, 2/3, 3/1, 1/4, 4/3, 3/5.

Per a fer-ho, definim un tipus `Racional` que
emmagatzema un racional positiu a través de dos naturals no nuls que
representen el seu numerador i el seu denominador (degudament simplificats):

```c++
struct Racional {
    int num, den;
};
```

Per tal de construir racionals, utilitzarem aquesta funció que ja els
desa simplificats

```c++
Racional crea_racional(int num, int den) {
    int d = mcd(num, den);
    return {num/d, den/d};
}
```

tot utilitzant l'algorisme d'Euclides (!!!Enllaç) per trobar el màxim divisor de dos naturals:

```c++
int mcd(int a, int b) {
    if (b == 0) return a;
    else return mcd(b, a % b);
}
```

Per escriure els racionals podem ser servir aquesta funció:

```c++
void escriure_racional(Racional r) {
    cout << r.num << "/" << r.den << endl;
}
```

Bé, ja tenim l'arsenal preparat, però... com generem els racionals?

La solució és utilitzar una cua de racionals:

-   Per començar, ficararem
    el racional 1/1 a la cua (1/1 és el racional al node arrel de l'arbre).

-   A continuació,
    anirem treient el primer racional de la cua, l'escriurem i
    encuarem els dos racionals que són fills d'aquell racional a l'arbre.

Caldrà repetir
aquest procés `n` vegades. D'aquesta forma s'aconsegueix realitzar un _recorregut
per nivells_ de l'arbre.

La creació de la cua i la inserció del primer element es poden codificar així:

```c++
queue<Racional> q;                                  // Crea una cua buida de racionals
q.push(crea_racional(1, 1));                        // i hi fica el 1/1.
```

A continuació, el cos de la iteració principal es pot codificar de la forma següent:

```c++
Racional r = q.front();                             // Obté el primer de la cua,
q.pop();                                            // el treu,
escriure_racional(r);                               // i l'escriu.

Racional r1 = crea_racional(r.num, r.num + r.den);  // Crea el fill esquerre
q.push(r1);                                         // i el fica a la cua.

Racional r2 = crea_racional(r.num + r.den, r.den);  // Crea el fill dret
q.push(r2);                                         // i el fica a la cua.
```

Aquest és doncs el programa complet:

```c++
#include <iostream>
#include <queue>
using namespace std;

struct Racional {
    int num, den;
};

int mcd(int a, int b) {
    if (b == 0) return a;
    else return mcd(b, a % b);
}

Racional crea_racional(int num, int den) {
    int d = mcd(num, den);
    return {num/d, den/d};
}

void escriure_racional(Racional r) {
    cout << r.num << "/" << r.den << endl;
}

int main() {
    int n;
    cin >> n;

    queue<Racional> q;
    q.push(crea_racional(1, 1));

    for (int i = 0; i < n; ++i) {
        Racional r = q.front();
        q.pop();
        escriure_racional(r);

        Racional r1 = crea_racional(r.num, r.num + r.den);
        q.push(r1);

        Racional r2 = crea_racional(r.num + r.den, r.den);
        q.push(r2);
    }
}
```

<Autors autors="jpetit roura"/>
