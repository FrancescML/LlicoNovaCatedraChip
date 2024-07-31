# Vectors: `vector`

## Introducció

Un **vector** (també anomenat **array** o, en alguns llenguatges de
programació, **taula** o **lista**) és un contenidor d'$n$ elements del mateix
tipus, on cada element s'identifica amb un **índex** de $0$ a $n - 1$. El
valor $n$ és la **mida** del vector. Es pot utililitzar un vector com a un
contenidor de moltes dades que es manipulen com un tot, o bé accedint
individualment als seus elements. L'accés als elements individuals es fa a
través d'un índex que especifica la posició desitjada i és molt eficient.

## Il·lustració

🚧 Falta fer 🚧

## Aplicacions

Els vectors són l'estructura de dades més bàsica que existeix i el seu ús és
ubicu. Gràcies als vectors, els programes poden emmagatzemar un gran nombre de
dades sense tenir una variable individual per a cada dada. Gràcies als bucles,
aquestes dades emmagatzemades en vectors es poden tractar sistemàticament per
solucionar molts tipus de problemes eficientment.

## El tipus `vector`: operacions bàsiques

La llibreria estàndard de C++ proporciona vectors d’elements de tipus `T` amb
el tipus `vector<T>`. Per usar-los, cal fer un `#include <vector>` i un
`using namespace std;` al principi del programa.

Les operacions principals dels vectors són:

-   Crear un vector (podent-ne indicar la seva mida i un valor inicial per a tots
    els seus elements).

-   Recórrer els elements d'un vector.

-   Obtenir la mida d'un vector, és a dir, saber quants elements conté.

-   Accedir a un element particular del vector.

-   Afegir o treure elements pel final del vector.

A continuació, detallem la sintàxi i semàntica d'aquestes operacions bàsiques.
En altres seccions donem operacions menys freqüents.

### Crear de vectors

La manera més precisa de crear un vector `v` és precisant el tipus dels seus
elements entre claus angulars (`<>`) i indicant el nombre de posicions
requerides i un valor inicial per a totes les posicions. Aquesta és la sintàxi:

```c++
vector<double> v(n, x);   // crea un vector de n elements reals, tots amb valor x
```

És necessari que `n` sigui un valor positiu o zero i que `x` sigui del mateix
tipus que els elements del vector.

Aquest segon paràmetre `x` es pot ometre i llavors
val el valor equivalent al "zero" del tipus dels elements del vector:

```c++
vector<double> v(n);   // crea un vector de n elements reals, tots amb valor 0.0
```

L'exemple següent mostra com declarar vectors amb 10 posicions de diferents
tipus i quin és el seu "zero":

```c++
vector<bool>   v1(10);        // vector de 10 booleans, tots amb valor false
vector<int>    v2(10);        // vector de 10 enters,   tots amb valor 0
vector<double> v3(10);        // vector de 10 reals,    tots amb valor 0.0
vector<string> v4(10);        // vector de 10 textos,   tots amb valor ""
```

La mida d'en vector també es pot ometre, i llavors val zero. Per tant,

```c++
vector<double> v;
```

crea un vector de reals buit.

Addicionalment, és molt útil inicialitzar les posicions individuals d'un vector
enumerant entre claus els seus valors:

```c++
vector<double> v = {2.3, 5.5, 1.2, 5.5, 7.6, 2.3, -12.25, 99.9};
```

### Recórrer un vector

Recórrer els elements d'un vector d'un en un des de la primera posició fins a
la darrera és una operació molt habitual. Aquest recorregut es pot escriure
senzillament utilitzant un bucle `for` especial. Per exemple, el següent
fragment recórre tots els elements d'un vector per escriure'ls un
rera l'altre:

```c++
vector<double> v = {2.3, 5.5, 1.2, 5.5, 7.6, 2.3, -12.25, 99.9};
for (double x : v) cout << x << endl;
```

La construcció `for (double x : v) cout << x;` es pot llegir com a "per a cada real
`x` en `v`, escriu `x`".

En el cas que es vulguin recórrer els elements d'un vector per modificar-lo,
cal utilitzar una referència als elements enlloc d'una còpia.
Observeu aquest fragment:

```c++
vector<int> v = {1, 3, 2};
for (int x : v) x * = 2;
for (int x : v) cout << x << endl;
```

La seva execució escriurà ~~1 3 2~~, perquè aquests són els valors originals
del vector, que no han estat doblats, perquè el que s'ha doblat és la seva
còpia. En canvi, amb

```c++
vector<int> v = {1, 3, 2};
for (int& x : v) x * = 2;               // 👁
for (int x : v) cout << x << endl;
```

s'escriurà ~~2 6 4~~, perquè ara sí que s'hauràn doblat els propis
elements del vector ja que es recorren a través d'una referència, fixeu-vos
en el simbol d'et (`&`).

### Obtenir la mida d'un vector

Donat un vector `v`, es pot obtenir la seva vida escrivint `v.size()`, que
retorna un nombre enter positiu o zero.

⚡ Malauradament, el tipus de `v.size()` és un enter sense signe (`unsigned int`)
i molts cops el compilador dóna un avís quan se'l compara amb un enter amb
signe (`int`). Per estalviar-nos l'avís, molts cops convertim el tipus
explícitament a enter amb `int(v.size())` o n'assignem la mida a un enter
`int n = v.size();` que s'utilitzem més endavant.

### Accedir als elements d'un vector

Per accedir a elements individuals d'un vector `v` s'utilitza
l'**operador d'indexació** (amb els claudàtors, `[]`) tot donant un enter que indiqui la
posició volguda. El primer element del vector `v` és `v[0]`; el segon
element, `v[1]`; l'element `i`-èsim és `v[i]`. El darrer element
és `v[v.size() - 1]`.

⚡ És un error de programació
accedir a posicions negatives del vector, o a posicions més grans o iguals que
la mida del vector. Cal anar amb compte amb això perquè, per defecte, C++
no ho controla.

El següent fragment de codi mostra com recórrer totes les
posicions d'un vector de reals:

```c++
vector<double> v = {2.3, 5.5, 1.2, 5.5, 7.6, 2.3, -12.25, 99.9};
for (int i = 0; i < int(v.size()); ++i) cout << v[i] << endl;
```

Segurament, en aquests cas hauria estat millor fer un
`for (int x : v) cout << x << endl;`. Però si es volguéssin
escriure del revés, llavors ja sí que seria un necessari un
bucle `for` habitual que iteri sobre els valors de gran a petit:

```c++
for (int i = v.size() - 1; i >= 0; --i) cout << v[i] << endl;
```

Per cert, aquest fragment mostra que es pot accedir directament a qualsevol
element d'un vector (donada la seva posició). Aquesta propietat rep el nom
d'**accés directe** i els ordinadors la realitzen molt eficientment.

### Afegir o treure elements pel final del vector

Una operació habitual és afegir un element `x` al final d'un vector `v`,
incrementant doncs d'una unitat la seva mida. Això es pot
fer escrivint `v.push_back(x)`.

Per exemple, el codi següent llegeix una seqüència d'enters
i els escriu del revés. Per a fer-ho, comença creant un vector buit
al qual va afegint al seu final cada element llegit amb un `push_back()`.
Després s'escriuen els seus elements en ordre invers.

```c++
vector<int> v;

// llegeix les dades i les va deixant al final de v
int x;
while (cin >> x) v.push_back(x);

// escriu els elements de v en ordre invers
for (int i = v.size() - 1; i >= 0; --i) cout << v[i] << endl;
```

De forma anàloga, és corrent eliminar la darrera posició d'un vector.
Això es fa amb l'operació `v.pop_back();`. Evidentment, és un error de programació
eliminar la darrera posició d'un vector buit.

Les operacions `push_back()` i `pop_back()` són eficients la majoria de les
vegades però, infreqüentment, poden ser lentes. Si se'n fan moltes, el seu
cost total acaba sent eficient. Es diu que el seu cost amortitzat és
constant. Ho expliquem més endavant, en una secció avançada.

## Important: Accessos fora del vector

El següent programa no és correcte.

```c++
int n;
cin >> n;
vector<int> v(n);
for (int i = 0; i <= n; ++i) {
    cin >> v[i];
}
```

Si no es va amb compte és molt fàcil cometre errors com l'anterior. Els errors
més comuns són accedir a la posició `n` d'un vector de mida `n` (els únics
accesos vàlids són `v[0]`, ..., `v[n - 1]`) o accedir a la posició `0` d'un
vector buit.

A diferència d'altres llenguatges de programació, accedir a una posició errònea
del vector no té per què provocar un error durant l'execució. Això fa que en C++
cometre aquests errors siguin més perillosos: poden ser molt difícils de trobar,
i el programa pot continuar executant-se amb valors erronis.

## Important: Còpies de vectors i pas de paràmetres

Fer una assignació entre vectors crea una còpia del vector i,
per tant, de tots els elements que conté.

```c++
vector<int> v1(n);
vector<int> v2 = v1;        // copia tots els elements de v1 en v2
                            // v1 i v2 son iguals, però són entitats diferents
```

Aquesta operació de còpia es lenta (temps lineal amb la mida del vector),
perquè és necessari reservar memòria i copiar tots els elements. Si ens
importa la velocitat dels programes, és important evitar fer còpies
innecessàries de vectors.

L'exemple més comú de còpia innecessària és passar un vector a una acció per
valor. Per exemple, al següent fragment, quan el programa principal crida a
l'acció `escriu`, com que el pas de paràmetres és per còpia, cal copiar tots
els elements de `v` en `vec`:

```c++
void escriu(vector<int> v) {
    for (int x : v) cout << x << v;
}

int main() {
    ...
    vector<int> vec(n);
    ...
    escriu(vec);
}
```

El remei en aquesta inneficiència és triar passar el vector per referència,
enlloc de triar passar-lo per valor. Quan es passa una variable per valor,
aqeusta no es copia, sinó que només es passa un punter de la seva posició
a la memòria, cosa que es pot fer molt eficientment.

Per tant, aquesta nova capçalera (fixeu-vos en el et `&`) fa que el programa s'estalvii tota la còpia
del vector:

```c++
void escriu(vector<int>& v) { ... }             // 👁
```

Però aquesta solució encara no és perfecta... En efecte, sabem que si
passem una variable per referència en una acció, aquesta acció ens pot
canviar el seu valor. Però no volem pas canviar el valor d'un vector
pel fet d'escriure'l! Per això, a la capçalera indicarem que la referència
al vector és constant (amb la paraula clau `const`):

```c++
void escriu(const vector<int>& v) { ... }             // 👁
```

Això evita que l'acció `escriu` modifiqui `v` (provar-ho implicaria
un error de compilació). No només és més segura, ara el seu propòsit
també és més clar.

El **pas per referència constant** és doncs una alternativa
al pas per valor que evita la còpia del paràmetre real al
paràmetre formal. Sempre que volem passar dades potencialment
llargues (com ara vectors) a un procediment que no les ha de modificar,
és important passar-les per referència constant i no per còpia.
[Per a dades "petites", com ara enters, reals, booleans i caràcters,
el pas per valor és adequat.]

## Avançat: gestió de memòria

Els elements d'un vector es troben en un espai contigu de memòria. Si el
vector creix de mida és necessari ampliar l'espai reservat, i si això no és
possible el tipus `vector` s'encarrega de reservar un nou tros de memòria i
copiar-hi totes les dades. Això és podria ser ineficient i, a més, invalida
tots els iteradors. Per a evitar haver de fer això sovint, els vectors no
reserven un espai de memòria exactament igual al seu `size()`, sinó una mida
més gran anomenada **capacitat** o `capacity()`. La crida `v.reserve(n)` fa
que la capacitat del vector `v` sigui `n` o més.

Si el vector creix, però no excedeix la seva `capacity()`, aleshores no fa falta
moure elements. Si s'excedeix la `capacity()` aleshores si és necessari
moure'ls, però per a evitar que això torni a passar aviat, el vector reserva
generalment el doble de la memòria necessària. Degut a això, fer `n` operacions
`push_back()` sobre un vector buit, que en el pitjor dels casos causa $1 + 2 + 3 +
... + n$ moviments de dades (ordre quadràtic) només causa $1 + 2 + 4 + 8 + ... + n
≈ 2n$ moviments de dades (ordre linial).

Esborrar elements d'un vector no redueix la capacitat. Si de debó volem reduir
la capacitat hem de crear un nou vector i moure els elements o cridar a
`v.shink_to_fit()`.

## Avançat: swap i move

El procediment `swap(a, b)`intercanvia les dades de dues variables
eficientment. Per exemple, si `a` i `b` són vectors, `swap(a, b)` no copia els
elements del vector d'un lloc a un altre, sinó que intercanvia les poques dades
del vector en si (posició de memòria on estan les dades, mida i capacitat). Això
és molt més ràpid i eficient que fer un intercanvi fent còpies (`c = a; a = b;
b = c;`).

Si volem moure el contingut de `b` a `a` però sabem que a continuació esborrarem
`b`, fer `swap(a, b)` és molt més eficient que `a = b`: després del `swap`
la variable `b` té el contingut de `a`, que havia d'esborrar-se igualment. En
C++11, on es distingeix entre copiar i moure una variable, també es pot escriure
`a = move(b);` per a moure el contingut de `b` a `a` eficientment. En alguns
casos, com ara quan un procediment retorna valors o quan es creen valors
temporals, els valors es mouen automàticament, sense fer falta dir-ho.

## Avançat: Canviar la mida del vector

Ja hem vist que podem canviar la mida d'un vector d'una unitat més o menys
pel seu final amb `push_back()` i `pop_back()`.
Per completesa, esmentem que per a canviar totalment la mida d'un
vector `v` podem escriure `v.resize(n)`, on `n` és la nova mida:

-   Si `n` és més petit
    que la mida actual, aquesta crida esborra els elements del final del vector
    `v[n]`, `v[n + 1]`, `...`, `v[v.size() - 1]`.

-   Si `n` és més gran que la mida
    actua, s'afegeixen nous elements `v[v.size()]`, `v[v.size() + 1]`, `...`, `v[n - 1]`
    amb valor 0 o equivalent.

A més, si fem `v.resize(n, x)` els nous elements
afegits seran `x` en lloc de 0.

Aquests exemples ho deixen clar:

```c++
vector<int> v;              // vector buit
v.resize(10);               // afegeix 10 enters amb valor 0
v.resize(5);                // esborra els darrers 5 elements
v.resize(10, 1);            // afegeix 5 enters amb valor 1
for (int x : v) cout << x;  // escriu 0000011111
```

## Vectors de vectors

El tipus `vector` és sempre 1-dimensionals. Per a tenir vectors 2-dimensionals
(també anomenats **matrius** o **taules**) hem de crear vectors de vectors.

```c++
vector<vector<int>> a(3);      // vector de 3 vectors buits (mida 3x0).
vector<int> b(5);              // vector de 5 zeros.
vector<vector<int>> c(10, b);  // vector de 10 vectors amb 5 zeros (mida 10x5).
vector<vector<int>> d(10, vector<int>(5));  // el mateix que c.
```

## Tipus relacionats

Hi ha altres estructures de dades semblants als
vectors en C++, amb subtils diferències entre elles:

```c++
int v1[10];               // array estàtic de C
int* v2 = new int[10];    // array dinàmic
vector<int> v3(10);       // vector de C++
array<int,10> v4;         // vector estàtic de C++
```

De totes elles, la més flexible i popular és el `vector`. Uns dels principals
avantatges del `vector` és que manté la semàntica de la còpia i que pot
canviar fàcilment de mida després d'haver-se creat. Si no teniu cap raó molt
important per no fer-ho, us recomanem que senzillament utilitzeu `vector`s.

<Autors autors="omer jpetit roura"/>
