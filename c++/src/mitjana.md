
# Aplicació: Mitjana de nombres reals

<img src='./mitjana.png' style='height: 10em; float: right; margin: 0 0 1em 1em;'/>

En aquesta lliçó mostrem com fer un programa
que calculi la mitjana de diversos nombres reals donats.


## Enunciat

Volem un programa per calcular la mitjana
d'una seqüència (no buida) de nombres reals.
El resultat s'ha d'escriure amb dos dígits decimals de precisió.
Per exemple, donada l'entrada

```text
3.4 5.6 8.7
```

el programa ha d'escriure

```c++
5.90
```

perquè $(3'4 + 5'6 + 8'7)/3 = 5'9$.




## Solució

Aquest problema requereix tractar tots els els elements de l'entrada.
Per tant, el bucle principal ha de ser del tipus
```
double x;
while (cin >> x) {
    ...
}
```

tal i com ja hem fet a altres exemples anteriors.
Però, aquest cop, la variable `x` que conté l'element actual és tipus `double`.
Recordeu que un bucle com aquest es pot llegir, en català, com
*"mentre puguis llegir un real `x`, fés ..."*
o, el que és equivalent,
*"per a cada real `x` de l'entrada, fés ..."*.

Per poder calcular la mitjana,
al final de l'execució ens caldran dues informacions:

- la suma de tots els elements de la seqüència, i
- la llargada (és a dir, el nombre d'elements) de la seqüència.

Per tant, a cada iteració del bucle
ens cal acumular el valor de l'element actual `x`
a la suma dels elements prèviament llegits i tractats,
i sumar u a la llargada de la seqüència vista fins ara.
Utilitzarem dues variables:

- `suma` contindrà la suma dels elements ja llegits, i
- `llargada` en comptarà el nombre.

A cada iteració, caldrà actualitzar aquestes variables,
afegint `x` a la suma, i incrementant en u la llargada:

```c++
suma += x;
++llargada;
```

Evidentment, abans de començar el bucle,
ambdues variables s'han d'inicialitzar a zero.
Cal tenir en compte que `suma` ha de ser `double`,
per no perdre cap decimal.
Però el més natural és declarar la variable `llargada` com a `int`,
ja que l'usem per comptar elements.

El programa complet queda així:
```
#include <iostream>
using namespace std;

int main() {
    // per fixar el nombre de decimals que s'escriuran
    cout.setf(ios::fixed);
    cout.precision(2);

    // llegeix la seqüència, mantenint-ne la llargada i la suma actuals
    double suma = 0;
    int llargada = 0;
    double x;
    while (cin >> x) {
        suma += x;
        ++llargada;
    }

    // calcula i escriu el resultat
    cout << suma/llargada << endl;
}
```

Fixeu-nos que, com que `suma` és un real, la divisió final dóna un real,
malgrat que `llargada` sigui un enter.
Fixeu-nos també que, com que estem suposant que la seqüència no és buida,
`llargada` sempre serà estrictament positiva i,
per tant, no dividirem mai per zero.




<Autors autors="jpetit roura"/>

