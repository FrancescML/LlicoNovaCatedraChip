# Ordenació: `sort`

## Introducció

Ordenar un vector consisteix a permutar els seus elements de forma que quedin
ordenats segons un cert criteri de comparació entre els elements.
Sovint, els elements s'ordenen creixentment (o decreixentment)
segons el seu ordre donat per l'operador `<`,
però hi ha altres criteris possibles.
Aquí expliquem com aconseguir ordenar vectors fàcilment
tot usant la funció `sort()` de la biblioteca estàndard de C++.

## Aplicacions

<img src='./sort.png' style='height: 10em; float: right; margin: 0 0 1em 1em;'/>

Ordenar és una operació molt útil i, per tant, freqüent.
Per exemple, en un full de càlcul podem desitjar que les files d'una taula quedin ordenades
perquè així és més còmode trobar-hi informació.
O, en un joc en 3D,
per calcular de quin color ha de ser cada píxel de la pantalla,
els diferents objectes s'han s'ordenar per proximitat a la càmera.

D'altra banda, molts problemes es poden resoldre més eficientment
si les seves dades es troben ordenades.
Per exemple, buscar si un cert element apareix en un vector requereix,
en el pitjor dels casos, visitar totes les posicions del vector.
En canvi, si el vector està ordenat,
es pot aplicar una cerca binària i visitar com a màxim un nombre logarítmic de posicions.

## La funció `sort()`

La llibreria estàndard de C++ proporciona una funció `sort()` que ordena vectors eficientment.
Per usar-la, cal fer un `#include <algorithm>`.

Habitualment, s'utilitza `sort()` per ordenar tot un vector,
diguem-ne `v`:

```c++
vector<int> v = {4, 2, 2, 3, 5, 1, 9, 8, 7, 2};
sort(v.begin(), v.end());
// v == {1, 2, 2, 2, 3, 4, 5, 7, 8, 9}
```

La crida `v.begin()` retorna un iterador al primer element de `v`.
La crida `v.end()` retorna un iterador a un element fictici just al final de `v`,
però fora de `v` (concretament, a la dreta del darrer element de `v`).
La instrucció `sort(v.begin(), v.end());`
diu doncs que cal ordenar `v` des del principi fins al final,
és a dir, totalment.

Si només es volgués ordenar un tros de `v`, caldria passar a `sort()`
un iterador al primer element a ordenar,
i un iterador al primer element just a la dreta de l'últim element a ordenar.
Per exemple, per ordenar `v` entre les posicions 2 i 5 (ambdues incloses), caldria escriure

```c++
vector<int> v = {4, 2, 2, 3, 5, 1, 9, 8, 7, 2};
sort(&v[2], &v[6]);
// v == {4, 2, 1, 2, 3, 5, 9, 8, 7, 2}
//             -----------
```

De fet, l'operador `&` retorna l'adreça de memòria d'allò a què s'aplica,
però en aquest context podem suposar que retorna un iterador a un element.
Així, `&v[0]` correspon a `v.begin()`,
i `&v[v.size()]` correspon a `v.end()`.

## Funcions de comparació

Per defecte, `sort()` utilitza l'operador `<` per decidir l'ordre
dels elements. Si el tipus dels elements no té definit aquest operador,
o si es vol utilitzar un criteri d'ordenació alternatiu,
cal passar un tercer paràmetre: la funció de comparació.

Per exemple, considerem el tipus `Punt` per representar punts en el pla:

```c++
struct Punt {
    int x, y;
};
```

Suposem que tenim un vector `v` de punts en el pla:

```c++
vector<Punt> v = {{3, 2}, {1, 1}, {5, 3}, {3, 3}};
```

Ara, si volem ordenar `v`, _no_ podem fer

```c++
sort(v.begin(), v.end());
```

El compilador ens dirà que no sap comparar dos `Punts` entre si,
i que per tant no pot ordenar el vector.

Com arreglar-ho?
Primer, definint un criteri d'ordenació.
Per exemple, suposem que triem que sigui la distància a l'origen
(primer els punts més propers).
Després, cal implementar una funció, per exemple `abans()`,
tal que, donats dos punts en el pla `p1` i `p2`,
retorni `true` si i només `p1` ha d'anar abans que `p2` en el vector:

```c++
bool abans(Punt p1, Punt p2) {
    return p1.x*p1.x + p1.y*p1.y < p2.x*p2.x + p2.y*p2.y;
}
```

Fixem-nos que no cal calcular l'arrel quadrada de les distàncies,
que és una operació costosa,
perquè la comparació directa amb els quadrats ja compara correctament.

Ara ja podem ordenar el vector de punts:

```c++
vector<Punt> v = {{3, 2}, {1, 1}, {5, 3}, {3, 3}};
sort(v.begin(), v.end(), abans);
// v = {{1, 1}, {3, 2}, {3, 3}, {5, 3}};
```

Compte: La funció de comparació ha de retornar `false` en cas d'empat.
A l'exemple, dos o més punts que es trobin a la mateixa distància de l'origen
es poden posar en qualsevol ordre relatiu.
Si els comparem entre ells, la funció retornarà `false`, tal com cal.
En altre paraules, aquesta funció és **incorrecta**:

```c++
bool abans(Punt p1, Punt p2) {
    return p1.x*p1.x + p1.y*p1.y <= p2.x*p2.x + p2.y*p2.y;       ❌ incorrecte
}
```

Encara que pugui semblar que el codi funciona,
fins i tot fent algunes proves pràctiques,
un programa que tingui una funció de comparació com aquesta pot avortar en execució
(perquè l'algorisme d'ordenació del `sort()` es penjarà).

D'altra banda, cal dir que els paràmetres de la funció `abans`
també es poden passar per referència constant:

```c++
bool abans(const Punt& p1, const Punt& p2) {
    return p1.x*p1.x + p1.y*p1.y < p2.x*p2.x + p2.y*p2.y;
}
```

Si els tipus que es comparen ocupen poca memòria, com és el cas,
les dues maneres són igual de bones.
Altrament, cal usar la segona per evitar còpies costoses.

## La funció `sort()` amb taules de C

Les taules de C també es poden ordenar amb `sort()`.
El seu ús és molt semblant al que hem vist,
tret que no es poden usar els mètodes `begin()` i `end()`,
que no estan definits sobre les taules (_arrays_, en anglès):

```c++
int a[10] = {4, 2, 2, 3, 5, 1, 9, 8, 7, 2};
sort(&a[0], &a[10]);
// a == {1, 2, 2, 2, 3, 4, 5, 7, 8, 9}
```

## Eficiència i especificació de la funció `sort()`

La funció `sort()` ordena $n$ elements en temps $\Theta(n\log n)$,
utilitzant només espai addicional constant.
Internament, i només ho comentem per si algú té curiositat,
sol ser un algorisme híbrid de _quick-sort_ i _heap-sort_
que resulta molt eficient en la majoria de casos.
L'especificació completa es pot trobar a
[cppreference](http://en.cppreference.com/w/cpp/algorithm/sort).

## Exemple: Ordenació creixent d'una seqüència d'enters

Considerem que es vol ordrenar creixentment una seqüència d'enters.
A hores d'ara, la solució d'aquest problema hauria de resultar òbvia:

```c++
#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

int main () {
    // llegir la seqüència en un vector
    vector<int> v;
    int x;
    while (cin >> x) v.push_back(x);
    // ordenar el vector
    sort(v.begin(), v.end());
    // escriure el vector ordenat
    for (int y : v) cout << y << endl;
}
```

## Exemple: Ordenació decreixent d'una seqüència d'enters

Si ara volem escriure els enters llegits en ordre decreixent,
n'hi ha prou d'escriure els elements del vector,
un cop ordenat, de dreta a esquerra.
Però, si també es volgués deixar els elements ordenats decreixentment al vector,
caldria donar al `sort()` un criteri d'ordenació alternatiu.

La manera més senzilla és utilitzant el comparador predefinit `greater<T>`,
el qual canvia el sentit de `<` per a valors de la majoria de tipus estàndard `T`:

```c++
⋮
sort(v.begin(), v.end(), greater<int>()); // ordena decreixentment
⋮
```

Com ja hem vist, una manera més general de fer-ho
consisteix a usar una funció `abans()`:

```c++
bool abans(int a, int b) {
    return a > b;
}

⋮
sort(v.begin(), v.end(), abans); // ordena decreixentment
⋮
```

## Exemple: Ordenació creixent d'una seqüència de dates

Considerem ara que volem llegir una seqüència de dates i escriure-la en ordre cronològic.

Per exemple, donada la seqüència

```c++text
17 11 2006
30 11 1971
14 4 2015
6 4 1971
```

caldria escriure la seqüència

```c++text
6 4 1971
30 11 1971
17 11 2006
14 4 2015
```

Resoldrem el problema com abans, és a dir,
llegint les dates en un vector, ordenant-lo, i escrivint-lo.
Ara, però, els nostres elements són dates,
així que cal definir una estructura `Data` per emmagatzemar-les:

```c++
struct Data {
    int dia, mes, any;
};
```

A més, ens cal implementar la funció `abans()`:

```c++
bool abans(const Data& x, const Data& y) {
    if (x.any != y.any) return x.any < y.any;
    if (x.mes != y.mes) return x.mes < y.mes;
    return x.dia < y.dia;
}
```

Fixem-nos com, per a cada camp de l'`struct`,
del més significatiu al menys significatiu,
es mira si ja ens determina el resultat.
Altrament, en cas d'igualtat, es continua mirant els altres camps.
I, quan arribem al darrer camp, retornem el resultat directe de la comparació,
recordant sempre de retornar `false` en cas d'empat.

Notem com, en aquest problema particular,
es podrien també comparar dues dates de forma aritmètica,
aprofitant que tant els dies com els mesos estan sempre entre 0 i 99:

```c++
bool abans(const Data& x, const Data& y) {
    return 10000*x.any + 100*x.mes + x.dia < 10000*y.any + 100*y.mes + y.dia;
}
```

Encara que aquí aquesta solució funciona bé,
cal vigilar a l'hora d'usar aquests "trucs" matemàtics.
Per exemple, en el (no gaire probable) cas
que haguéssim d'ordenar les dates
que apareixen en un llibre de ciència-ficció
que parli d'un planeta on els mesos tinguin 200 dies, la funció fallaria.

Aquest és el programa complet:

```c++
#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

struct Data {
    int dia, mes, any;
};

bool abans(const Data& x, const Data& y) {
    if (x.any != y.any) return x.any < y.any;
    if (x.mes != y.mes) return x.mes < y.mes;
    return x.dia < y.dia;
}

int main () {
    vector<Data> v;
    Data x;
    while (cin >> x.dia >> x.mes >> x.any) v.push_back(x);
    sort(v.begin(), v.end(), abans);
    for (Data y : v) cout << y.dia << " " << y.mes << " " << y.any << endl;
}
```

<Autors autors="jpetit roura"/>
