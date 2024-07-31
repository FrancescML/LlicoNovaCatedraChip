# Funcions

<img src='././funcio1.png' style='height: 8em; float: right; margin: 0 0 1em 1em;'/>

Aquesta lliçó presenta les funcions. Una **funció** és un subprograma
que, a partir de diverses entrades, en calcula un resultat. Ens podem
imaginar una funció com una màquina que transforma entrades en
sortides. Al contrari dels programes, les funcions habitualment no
interaccionen directament amb l'usuari llegint les dades del canal
d'entrada i/o escrivint els resultats corresponents pel canal de
sortida.

Les funcions són un mecanisme fonamental per descompondre un programa
en diferents subprogrames i, per tant, per solucionar un problema
complex utilitzant solucions a problemes més senzills. Les funcions
permeten escriure programes més llegibles i estructurats, i més fàcils
de corregir i millorar. I, encara que en aquest curs bàsic no ho
veurem, les funcions proporcionen també una manera de compartir codi
entre diferents projectes.

## Ús de funcions en llibreries

Suposem que volem calcular la distància entre dos punts del pla
$p = (x_p, y_p)$ i $q = (x_q, y_q)$.
Recordem que la seva distància euclídea és
$\sqrt{(x_p-x_q)^2 + (y_p-y_q)^2}$.
Considereu el programa següent:

```c++
#include <iostream>
#include <cmath> // 👁
using namespace std;

int main() {
double xp, yp, xq, yq;
cin >> xp >> yp >> xq >> yq;
cout << sqrt(pow(xp - xq, 2) + pow(yp - yq, 2)) << endl; // 👁
}

```

Aquest programa presenta dues novetats:

1.  La directiva `#include <cmath>` permet utilitzar funcions
    de la llibreria matemàtica: potències, exponencials, logaritmes,
    funcions trigonomètriques...
    En teniu una referència a [cmath](/stl/cmath.html).

2.  L'expressió que calcula la distància entre els dos punts
    fa servir dues funcions matemàtiques:

    -   Primer, invoca `pow()` amb paràmetres `x1 - x2` i `2`.
    -   Després, invoca `pow()` amb paràmetres `y1 - y2` i `2`.
    -   Finalment, invoca `sqrt()` amb la suma dels dos resultats calculats anteriorment.

    La documentació de `<cmath>` estableix que,
    donats dos reals `a` i `b`, la funció `pow(a, b)` calcula `a` elevat a `b`.
    També, que donat un real positiu `x`,
    la funció `sqrt(x)` en calcula l'arrel quadrada.

Com veieu, les funcions s'usen de forma anàloga a les matemàtiques:
amb el nom de la funció seguit dels seus paràmetres,
entre parèntesis, i separats per comes.
Els resultats de les funcions, en aquest cas nombres reals,
poden ser usats després com qualsevol altre nombre real:
per a nous càlculs, desant-los en variables,
escrivint-los pel canal de sortida, ...

## Funció per calcular quadrats

A l'exemple anterior hem fet servir unes funcions predefinides del
mòdul matemàtic. Però, moltes vegades, volem ser nosaltres mateixos qui
definim les nostres funcions.

Per exemple, considerem l'expressió

```c++
sqrt(pow(xp - xq, 2) + pow(yp - yq, 2))
```

del programa anterior.
La funció `pow()` és de caràcter general,
i s'usa principalment quan el segon paràmetre és un nombre amb decimals;
altrament, hi ha mètodes més eficients.
En aquest cas, podríem fer senzillament

```c++
sqrt((xp - xq)*(xp - xq) + (yp - yq)*(yp - yq))
```

El resultat seria el mateix, i el programa seria (lleugerament) més ràpid.
Però encara es pot fer millor.
Podem definir i usar una funció per elevar un nombre al quadrat,
de nom per exemple `quadrat()`:

```c++
double quadrat(double a) {
    return a*a;
}
```

Aquesta definició té dues parts: la capçalera i el cos.

-   Primer, es dóna la **capçalera** de la funció: `double quadrat(double a)`

    Aquesta capçalera informa, d'esquerra a dreta, de les característiques
    següents:

    -   El resultat de la funció és de tipus real (`double`).
    -   El nom de la funció és `quadrat`.
    -   Aquesta funció té un sol paràmetre, és de tipus `double` i s'anomena `a`.

-   Després ve, entre claus, el **cos** de la funció: `return a*a;`

    Aquí, el cos només té una instrucció `return`,
    la qual indica que la funció ha acabat la seva feina
    i que lliura com a resultat l'expressió que té a la seva dreta.
    En aquest cas, la funció quadrat senzillament retorna `a*a`.

    En general, les funcions solen tenir tenir moltes més instruccions,
    però és imprescindible
    que sempre lliurin el seu resultat amb alguna instrucció `return`.

Val a dir que el nom `a` escollit per al paràmetre no és important.
De la mateixa manera que $f(x) = x^2$ i $f(y) = y^2$
representen exactament les mateixes funcions matemàtiques,
podríem haver definit la funció `quadrat()` amb un altre nom per al paràmetre:

```c++
double quadrat(double x) {
    return x*x;
}
```

Les dues definicions són idèntiques a tots els efectes.

En qualsevol cas, ara podem escriure l'expressió anterior
que representa la distància entre dos punts així:

```c++
sqrt(quadrat(xp - xq) + quadrat(yp - yq))
```

Aquest codi és millor que els anteriors,
encara que només sigui perquè és una mica més fàcil de llegir.

Si voleu, considerem un exemple més exagerat.
Què preferiu, aquesta expressió

```c++
(3*x*y - 7*a*z + 23*y*y*z - 42*a*b*c*d - 108*x*z)*(3*x*y - 7*a*z + 23*y*y*z - 42*a*b*c*d - 108*x*z)
```

o aquesta?

```c++
quadrat(3*x*y - 7*a*z + 23*y*y*z - 42*a*b*c*d - 108*x*z)
```

A simple vista, podeu estar segurs que el contingut dels dos parèntesis de la
primera expressió són idèntics? Fixeu-vos com de fàcil seria cometre un error
tipogràfic i no adonar-vos-en. A més, quan us calgui modificar el codi (potser
per corregir-ne algun error), segur que recordareu corregir les dues
expressions? En informàtica en general, i en els programes en particular,
les redundàncies són dolentes.

Finalment, vegem com s'organitzen les funcions dins del programa complet:

```c++
#include <iostream>
#include <cmath>
using namespace std;

double quadrat(double a) {
    return a*a;
}

int main() {
    double xp, yp, xq, yq;
    cin >> xp >> yp >> xq >> yq;
    cout << sqrt(quadrat(xp - xq) + quadrat(yp - yq)) << endl;
}
```

En C++, cal definir la funció `quadrat()` abans del `main()`,
perquè des de la segona s'invoca la primera.

## Funció per al màxim de dos enters

Considerem ara que volem escriure una funció per calcular el màxim de dos enters.

Primer comencem amb la capçalera,
que també s'anomena **declaració** o **interfície**:

```c++
int max2(int a, int b)
```

Com ja sabem, aquesta capçalera indica
que el resultat és de tipus enter,
que la funció es diu `max2`,
i que té dos paràmetres enters que anomenem `a` i `b`.

A continuació, en programem el cos:

```c++
int max2(int a, int b) {
    int m;
    if (a > b) m = a;
    else m = b;
    return m;
}
```

Fixeu-vos com el cos d'aquesta funció és molt semblant
al d'un programa que calcula el màxim de dos enters
i deixa el resultat en `m` però,
en lloc d'escriure després aquesta `m` pel canal de sortida `cout`,
la funció la retorna amb un `return`.

De fet, podem simplificar el cos una mica estalviant-nos la variable `m`
amb dos `return`, un per a cada branca del condicional:

```c++
int max2(int a, int b) {
    if (a > b) return a;
    else return b;
}
```

Fins i tot podem eliminar l'`else` perquè,
en trobar un `return`, la funció acaba la seva feina i lliura el resultat immediatament,
sense continuar executant la resta de codi que tingui a continuació:

```c++
int max2(int a, int b) {
    if (a > b) return a;
    return b;
}
```

Aquest programa complet pot servir per provar la funció `max2`:

```c++
#include <iostream>
using namespace std;

int max2(int a, int b) {
    if (a > b) return a;
    return b;
}

int main() {
    int x, y;
    cin >> x >> y;
    cout << max2(x, y) << endl;
}
```

## Funció per al màxim de tres enters

Ara volem fer una funció que, donats tres enters,
diguem-ne `a`, `b` i `c`,
en retorni el més gran.
La seva capçalera pot ser

```c++
int max3(int a, int b, int c)
```

Per implementar el cos d'aquesta funció hi ha, bàsicament, dues solucions:

1.  La primera consisteix a fer una anàlisi per casos fent servir condicionals,
    i té moltes variacions possibles. Aquesta n'és una de prou senzilla:

        ```
        int max3(int a, int b, int c) {
            if (b > a) a = b;
            if (c > a) a = c;
            return a;
        }
        ```

2.  La segona, més astuta,
    consisteix a aprofitar que ja tenim escrita una funció `max2()` i que,
    per tant, la podem usar! Aquesta seria una manera possible:

        ```
        int max3(int a, int b, int c) {
            return max2(a, max2(b, c));
        }
        ```

        Com aquest codi demostra, una funció pot invocar una altra funció.
        No només això, la pot invocar dues o més vegades, i amb paràmetres diferents.
        Altrament dit, els subprogrames poden usar lliurement altres subprogrames.

        De fet, això ja ho havíem vist,
        perquè en un exemple anterior, el `main()`,
        que no deixa de ser una funció (una mica especial),
        usava la funció `max2()`.

Malgrat que la primera solució no és excessivament complicada,
la segona és encara més senzilla i, per tant, preferible.
Dissenyar funcions que resolen tasques cada cop més complexes
aprofitant funcions més simples
és una excel·lent pràctica de disseny.

Insistim en un petit detall tècnic del llenguatge C++,
que ja hem mencionat anteriorment:
per tal que una funció `f()` pugui invocar una funció `g()`,
cal que `g()` es defineixi abans que `f()`.
Per això, la funció `main()` apareix sempre al final.

Per referència, aquest és el programa complet
que llegeix tres enters i n'escriu el màxim utilitzant la funció `max3()` que,
alhora, utilitza la funció `max2()`:

```c++
#include <iostream>
using namespace std;

int max2(int a, int b) {
    if (a > b) return a;
    return b;
}

int max3(int a, int b, int c) {
    return max2(a, max2(b, c));
}

int main() {
    int a, b, c;
    cin >> a >> b >> c;
    cout << max3(a, b, c) << endl;
}
```

## Sobrecàrrega

En C++, un mateix identificador de funció es pot referir a diferentes funcions.
Per tal de saber a quina d'elles s'invoca, cal que el nombre i/o
els tipus dels paràmetres siguin diferents. Aquesta característica s'anomena
**sobrecàrrega**.

Així, no cal que la funció que calcula el màxim de dos enters es
digui `max2` i que la funció que calcula el màxim de tres enters es
digui `max3`: Ambdues es poden dir, per exemple, `max`. Quan s'invoqui a `max`
amb dos paràmetres s'utilitzarà la primera, i quan s'invoqui a `max`
amb tres paràmetres s'utilitzarà la segona. Aquí ho teniu:

```c++
int max(int a, int b) {             // max2
    if (a > b) return a;
    return b;
}

int max(int a, int b, int c) {      // max3
    return max(a, max(b, c));       // usa max2 dos cops
}

int main() {
    int a, b, c;
    cin >> a >> b >> c;
    cout << max(a, b) << endl;      // usa max2
    cout << max(a, b, c) << endl;   // usa max3
}
```

L'exemple següent mostra que la sobrecàrrega també permet invocar
a la funció adeqüada segons els tipus dels paràmetres tot creant
dues funcions `abs` per calcular el valor absolut d'enters i de reals:

```c++
int abs(int x) {                    // valor absolut per als enters
    if (x < 0) return -x;
    return x;
}

double abs(double x) {              // valor absolut per als reals
    if (x > 0) return x;            // (codi diferent perquè quedi clar que no importa)
    return -x;
}

int main() {
    cout << abs(-666) << endl;      // invoca al valor absolut per als enters
    cout << abs(-2.4) << endl;      // invoca al valor absolut per als reals
}
```

## La funció `int main()`

Segurament recordeu que a la [primera lliçó de C++](comencem.html)
havíem dit que el conjur 🧙 per escriure programes en C++
requeria posar les instruccions entre les claus de `int main() {}`.
Doncs bé, `main()` no és altra cosa que una funció!

La funció `main()` (_principal_, en anglès) és la que el sistema
operatiu invoca per posar en marxa el nostre programa. Des d'ella, és clar, es poden
posar en marxa altres funcions.

La funció `main()` no té paràmetres (això no és del tot cert... però de
moment deixem-ho així) perquè tota la comunicació amb l'entorn es fa
mitjançant l'entrada/sortida.

La funció `main()` retorna un enter que el sistema operatiu interpreta
com un codi de l'estat amb el qual ha acabat el programa: 0 sol indicar
correcte, i qualsevol valor diferent de 0 un error. Per fortuna, la
funció `main` és especial i no cal fer aquest `return` explícitament
(per defecte, retorna 0).

## Paràmetres formals i paràmetres reals

Ja heu vist que quan s'escriu la capçalera d'una funció, s'enumeren els seus
paràmetres, tot donant el seu tipus i el seu nom. Aquests paràmetres es diuen
**paràmetres formals** i serveixen per donar forma a la funció. Per exemple,
a la funció següent,

```c++
int max(int a, int b) {...}
```

`a` i `b` són paràmetres formals. El cos de la funció utilitzarà `a` i `b` per
referir-se als valors sobre els quals ha de treballar quan se la invoqui.

Justament, quan s'invoca a una funció, cal passar els valors necessaris que rebran
els paràmetres formals. Aquests paràmetres que s'utilitzen al invocar una funció
es diuen **paràmetres reals** (o **arguments**).

Per exemple,
en l'expressió `(max(10, x) + max(x, x + y)) / 2`
hi ha dues invocacions a `max`. A la primera,
els paràmetres formals són `10` i `x`; a la segona
els paràmetres formals són `x` i `x + y`.

Al invocar una funció, el valor dels paràmetres reals es transmeten
als paràmetres formals:

-   A la primera invocació, el paràmetre formal `a` rebrà el valor `10`
    i el paràmetre formal `b` rebrà el valor que tingui la variable `x` en aquell moment.

-   A la segona invocació, el paràmetre formal `a` rebrà el valor de `x`
    i el paràmetre formal `b` rebrà la suma dels valors de `x` i de `y`.

Fixeu-vos que els paràmetres formals són expressions que produeixen un valor
(`10` o `x` o `x + y`). En canvi, els paràmetres formals són noms de variables
amb llur tipus.

## Els paràmetres i les variables són locals

Considereu el programa següent, que és una variació d'algun dels anteriors:

```c++
#include <iostream>
using namespace std;

int max2(int a, int b) {
    int m;
    if (a > b) m = a;
    else m = b;
    return m;
}

int max3(int a, int b, int c) {
    int m = max2(b, c)
    return max2(a, m);
}

int main() {
    int a, b, c;
    cin >> a >> b >> c;
    cout << max3(a, b, c) << endl;
}
```

En aquest programa hi ha dues variables `m`, una dins de la funció
`max2()` i una altra dins de la funció `max3()`. Malgrat que aquestes
dues variables tenen el mateix nom, són dues variables distintes. És a
dir, cada variable pertany a la funció dins la qual està definida. Diem
que aquestes variables són **variables locals**.

La localitat de les variables és molt útil perquè, quan s'escriu una
funció, no es vol haver de consultar els noms de variables que puguin
haver-hi en altres funcions (que potser ni tan sols ha escrit el mateix
programador!).

Els paràmetres també són locals: Els paràmetres `a` i `b` de `max2()` no
tenen res a veure amb els paràmetres `a` i `b` de `max3()`. De fet, a la
primera invocació de `max2()` a `max3()`, el valor de `b` de `max3()` es
copia al paràmetre `a` de `max2()`, i el valor de `c` de `max3()` es copia
al paràmetre `b` de `max2()`. I, a la segona invocació de `max2()` a
`max3()`, el valor d'`a` de `max3()` es copia al paràmetre `a` de `max2()`
(és una pura coïncidència que es diguin iguals) i el valor d'`m` de
`max3()` es copia al paràmetre `b` de `max2()`.

Igualment, el fet que les tres variables del `main()` es diguin `a`,
`b` i `c` és només una coïncidència amb que els tres paràmetres de
`max3()` també es diguin `a`, `b` i `c`.

De fet, no hi ha una sola variable `m` per a la funció `max2()`, sinó
que n'hi haurà una diferent cada vegada que s'invoqui la funció. El
sistema d'execució s'encarrega de mantenir totes aquestes variables
mentre calen, i de reciclar-ne la memòria quan esdevenen innecessàries.

Si us costa una mica entendre aquesta secció, contineu i ja hi tornareu
més endavant. Al cap i a la fi, el que cal saber és que tot està
pensat perquè els noms de les variables i els paràmetres de les
funcions no interefereixin entre si.

## Errors freqüents

En aquesta secció comentarem dos errors freqüents que
se solen cometre en començar a utilitzar funcions.

-   **Llegir les dades amb un `cin` en lloc de rebre-les com a paràmetres,
    o escriure el resultat amb `cout` en lloc de retornar-lo.**

    Per exemple, aquest programa violaria aquests preceptes:

    ```c++
    int valor_absolut(int x) {
        cin >> x;                       // 😬 el valor d'x no s'ha de llegir, és un paràmetre!
        int y;
        if (x >= 0) y = x;
        else y = -x;
        cout << y << endl;              // 😬 el valor de y no s'ha d'escriure, s'ha de retornar!
    }
    ```

    La versió correcta seria

    ```c++
    int valor_absolut(int x) {
        int y;
        if (x >= 0) y = x;
        else y = -x;
        return y;
    }
    ```

    o, senzillament,

    ```c++
    int valor_absolut(int x) {
        if (x > 0) return x;
        return -x;
    }
    ```

    Nota: Més endavant, quan en sapiguem més, trencarem aquesta regla i farem
    funcions que sí que llegeixin o escriguin per l'entrada/sortida. Per ara, però,
    fer això seria símptome d'haver-nos equivocat.

-   **Donar els tipus dels paràmetres reals.**

    Recordeu que hi ha dos tipus de paràmetres: els _paràmetres formals_ que
    ajuden a definir el cos d'una funció i els _paràmetres reals_ que són els
    valors sobre els quals es vol invocar una funció. Convé no barrejar els dos
    i adonar-se que només es dónen els seus tipus als paràmetres formals.

    Per exemple, si disposem de la funció

    ```c++
    int max(int a, int b) {...}
    ```

    no l'hem d'invocar amb

    ```c++
    ⋮
    int z = max(int x, int y);
    ```

<Autors autors="jpetit roura"/>
