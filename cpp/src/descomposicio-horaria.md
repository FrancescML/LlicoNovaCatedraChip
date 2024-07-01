# Aplicació: Descomposició horària

<img src='./rellotge.png' style='height: 10em; float: right; margin: 0 0 1em 1em;'/>

Aquesta lliçó mostra com solucionar el problema de descompondre un
determinat nombre de segons en hores, minuts i segons. Això permet aprofundir
en l'ús de les instruccions que ja s'han presentat i veure com funciona la
divisió amb valors enters.

## Enunciat del problema

Considereu el problema següent: Donada una quantitat (positiva) de segons `n`,
es vol saber quantes hores, minuts i segons representa. Per exemple, si `n` val 3661,
cal dir que en 3661 segons hi ha una hora, un minut i un segon. També, si `n`
val 76234, cal dir que en 76234 segons hi ha 21 hores, 10 minuts i 34 segons
(no feu el mandra: comproveu-ho!).

## Solució

El primer pas per resoldre qualsevol problema és identificar quines són les
seves entrades, quines són les seves sortides i quina relació tenen entre
elles. En aquest cas:

-   De l'enunciat del problema, queda clar que hi ha una entrada `n` que
    representa un determinat nombre de segons. Com que es tracta d'un nombre natural,
    la podrem desar en una variable entera (`int n;`).

-   Igualment, queda clar que les sortides són tres nombres naturals `h`, `m` i `s`
    que representen, respectivament, el nombre d'hores, minuts i segons continguts a `n`.
    Els podrem desar en tres variables enteres (`int h, m, s;`).

-   La relació entre l'entrada `n` i les sortides `h`, `m` i `s` és `3600*h +
60*m + s == n`, amb `0 <= m < 60` i `0 <= s < 60`.

La solució ha de declarar totes aquestes variables,
llegir el valor d'`n`,
calcular els valors d'`h`, `m` i `s` a partir del d'`n` (encara no hem pensat com),
i escriure el valor de `h`, `m` i `s`. Això es pot començar així:

```c++
/* Descomposició horària. */

#include <iostream>
using namespace std;

int main() {
    int n;                                          // Declaració de la variable d'entrada
    cin >> n;                                       // Lectura de l'entrada
    int h, m, s;                                    // Declaració de les variables de sortida
    /* Càlcul de h, m, s a partir de n. */          // 🚧 Falta fer !!!
    cout << h << " " << m << " " << s << endl;      // Escriptura de les sortides
}
```

Evidentment, encara ens falta fer la part del càlcul, però la resta de parts
ja són al seu lloc.

Fixeu-vos en alguns detalls:

-   És un bon costum no declarar les variables fins que no siguin estrictament
    necessàries. Per això hem separat la declaració d'`n` de les d'`h`, `m` i
    `s`.

-   Es poden escriure textos arbitraris, tot
    tancant-los entre cometes dobles. Com que en aquest cas volem separar les tres dades
    per espais en banc, hem utilitzat el text `"⎵"` (⎵ representa un espai en blanc,
    a l'explicació posem aquest símbol perquè el blanc es vegi 😀). Cal
    separar els nombres amb espais perquè altrament
    quedarien enganxats, no sabent on comença un i acaba l'altre.

-   Es poden escriure diferents dades en una sola instrucció d'escriptura
    (`cout`) tot separant-les amb els símbols de `<<`.

<img src='./caramels.png' style='height: 8em; float: right; margin: 0 0 1em 1em;'/>

Abans de continuar,
cal que introduim (o _repassem_, perquè ja el coneixeu) el concepte de **divisió entera**:
Reculeu alguns anys, quan vau aprendre a dividir:

> — _Si la Carla té set caramels i els ha de dividir entre tres amics, quants caramels donarà a cada amic?_
>
> — _Donarà dos caramels a cada amic, i li'n sobrarà un!_

Això és una divisió entera! Oi que de petita
la Carla mai hauria donat 2.333333 caramels als seus amics? Que dolç... 🍭

Justament, el resultat de dividir un enter per un altre enter en C++ amb l'operador `/` és
la divisió entera. Per tant, el resultat de `7/3` és `2`. A més, l'operador
`%` dóna el residu de la divisió entera! Per exemple,
el resultat de `7%3` és `1`.

Tornem a la descomposició horària:
Com ens ho hem de fer per calcular `h`, `m` i `s` a partir d'`n`?

Tenint en compte que una hora són 3600 segons, és clar que el nombre d'hores `h`
en `n` és el resultat de `n/3600`.
Per tant, el càlcul d'`h` a partir d'`n` es pot fer amb aquesta assignació:

```c++
    h = n/3600;
```

Un cop sabem quantes hores hi ha en `n`, quants segons ens resten? Doncs `n%3600`
(o bé `n - 3600*h`, que seria el mateix però més llarg d'escriure).
I, en aquesta quantitat, quants minuts hi ha?
Doncs el resultat de dividir-la per 60! Per tant,

```c++
    m = (n%3600)/60;
```

I quants segons ens resten encara? Doncs el residu d'aquesta divisió entera! Per tant,

```c++
    s = (n%3600)%60;
```

I, amb això, ja tenim els càlculs de `h`, `m` i `s` complets:

```c++
    h = n/3600;
    m = (n%3600)/60;
    s = (n%3600)%60;
```

En aquest punt, fixeu-vos que, com que 3600 és múltiple de 60,
llavors `(n%3600)%60` és, de fet, igual a `n%60`.
I, com que havíem dit que és un bon costum no declarar les variables
fins que no facin falta,
la solució completa la podem reescriure així:

```c++
/* Descomposició horària. */

#include <iostream>
using namespace std;

int main() {
    int n;                                          // Declaració de la variable d'entrada
    cin >> n;                                       // Lectura de l'entrada
    int h = n/3600;                                 // Càlcul del nombre d'hores
    int m = (n%3600)/60;                            // Càlcul del nombre de minuts
    int s = n%60;                                   // Càlcul del nombre de segons
    cout << h << " " << m << " " << s << endl;      // Escriptura de les sortides
}
```

## Correctesa

En aquest punt, és pertinent preguntar-nos com podem assegurar que
aquesta solució és realment correcta. Ho és per aquestes raons:

1. Tal com cal, `s` es troba entre 0 i 59. Això és conseqüència del fet que
   `s` és el residu d'una divisió entera entre 60.

2. Tal com cal, `m` es troba entre 0 i 59. Això és conseqüència del fet que,
   com que `n%3600` es troba entre 0 i 3599, llavors `(n%3600)/60`
   no pot ser més gran que 59.

3. Tal com cal, `n == 3600*h + 60*m + s`. En efecte, la igualtat
   `n = 3600*(n/3600) + 60*((n%3600)/60) + n%60` és certa,
   tal com us animem a comprovar.

## Demostració

La captura de terminal següent posa en marxa aquest programa. Piqueu el triangle!

TODO: asciinema("descomposicio-horaria", "Descomposició horària")

## Solució alternativa

Cal dir que aquest problema es podria resoldre d'altres maneres.
També, la manera explicada anteriorment
es pot codificar de forma encara més compacta,
sense necessitat de cap variable que no sigui `n`:

```c++
/* Descomposició horària, versió reduïda. */

#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;
    cout << n/3600 << " " << (n%3600)/60 << " " << n%60 << endl;
}
```

<Autors autors="jpetit roura"/>
