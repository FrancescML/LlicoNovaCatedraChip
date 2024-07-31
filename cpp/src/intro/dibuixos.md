# Aplicació: Alguns dibuixos

<img src='././dibuixos.png' style='height: 8em; float: right; margin: 0 0 1em 1em;'/>

Aquesta lliçó mostra possibles solucions
per a un parell d'exercicis del Jutge:

-   [P29973](https://jutge.org/problems/P29973) (Triangle)
-   [P72484](https://jutge.org/problems/P72484) (Rombe)

Ambdues solucions fan servir de manera natural la instrucció `for`.

## Exercici P29973 (Triangle)

L'enunciat és senzill:
Donat un nombre `n`, cal escriure un "triangle" de mida `n` amb asteriscs.
Per exemple, si l'entrada és 4,
cal escriure

```c++text
*
**
***
****
```

Com ho podem resoldre?
L'observació fonamental és que el nombre d'asteriscs per línia creix d'un en un,
des de 1 fins a `n`.
Això suggereix usar un `for` amb una variable, diguem-ne `i`,
que contingui en tot moment el nombre d'asteriscs que cal escriure.
Així, una primera aproximació a la solució és:

```c++
int main() {
    int n;
    cin >> n;
    for (int i = 1; i <= n; ++i) {
        // codi per escriure i asteriscs en una línia
    }
}
```

Ara només ens cal pensar què posar a la part que falta.
Per començar, quin seria un possible codi per escriure `7` asteriscs en una línia?
Aquest:

```c++
for (int j = 0; j < 7; ++j) cout << "*";
cout << endl;
```

Però, com que no hem d'escriure 7 asteriscs, sinó `i`,
el que hem de fer és senzillament reemplaçar el 7 per una `i`:

```c++
for (int j = 0; j < i; ++j) cout << "*";
cout << endl;
```

Ajuntant-ho tot, obtenim la solució:

```c++
int main() {
    int n;
    cin >> n;
    for (int i = 1; i <= n; ++i) {
        for (int j = 0; j < i; ++j) cout << "*";
        cout << endl;
    }
}
```

Observem que hem d'usar noms de variables diferents, `i` i `j`, per als dos `for`,
perquè un es troba dins de l'altre.
Com ja sabem, no calen noms de variables diferents
en bucles que es troben un a continuació de l'altre.

Finalment, i per comparació, així seria el codi
si uséssim `while` en lloc de `for`:

```c++
int main() {
    int n;
    cin >> n;
    int i = 1;
    while (i <= n) {
        int j = 0;
        while (j < i) {
            cout << "*";
            ++j;
        }
        cout << endl;
        ++i;
    }
}
```

## Exercici P72484 (Rombe)

L'enunciat és similar a l'anterior:
Donat un nombre `n`, cal escriure un "rombe" de mida `n` amb asteriscs.
Per exemple, si l'entrada és 4,
cal escriure

```c++text
   *
  ***
 *****
*******
 *****
  ***
   *
```

A dalt, encara que no es vegin,
totes les línies (excepte la d'enmig) tenen espais a l'esquerra dels asteriscs.
Aquí els visualitzem explícitament fent servir el símbol ␣ per remarcar els espais:

```c++text
␣␣␣*
␣␣***
␣*****
*******
␣*****
␣␣***
␣␣␣*
```

Però el nombre d'espais depèn de la línia.
Així doncs, per començar,
fem una taula per veure quants espais i quants asteriscs calen en funció d'`i`.
De moment, conformem-nos amb les `n` primeres files:

| `i` | espais | asteriscs |
| --- | :----: | :-------: |
| 1   |   3    |     1     |
| 2   |   2    |     3     |
| 3   |   1    |     5     |
| 4   |   0    |     7     |

Les fórmules semblen clares: calen `n - i` espais
i `2*i - 1` asteriscs.
Així, aquesta és la part interessant del codi que escriu les `n` primeres línies
(ignorem el `main()` i la lectura d'`n`):

```c++
    for (int i = 1; i <= n; ++i) {
        for (int j = 0; j < n - i; ++j) cout << " ";
        for (int j = 0; j < 2*i - 1; ++j) cout << "*";
        cout << endl;
    }
```

Com que la figura és (quasi) simètrica respecte a l'eix horitzontal,
una manera senzilla de dibuixar tot el rombe consisteix a copiar el `for` tal qual,
però fer que el segon `for` s'executi des del final (`i = n`)
fins al principi (`i >= 1`), decrementant la variable (`--i`):

```c++
    for (int i = 1; i <= n; ++i) {
        for (int j = 0; j < n - i; ++j) cout << " ";
        for (int j = 0; j < 2*i - 1; ++j) cout << "*";
        cout << endl;
    }
    for (int i = n; i >= 1; --i) {
        for (int j = 0; j < n - i; ++j) cout << " ";
        for (int j = 0; j < 2*i - 1; ++j) cout << "*";
        cout << endl;
    }
```

Provem aquest programa amb un 4.
Veurem que el codi _quasi_ funciona:

```c++text
   *
  ***
 *****
*******
*******
 *****
  ***
   *
```

Veiem que sobra una línia del mig del rombe.
Per arreglar-ho, podem simplement fer que el segon bucle comenci en ` n - 1`
enlloc d'`n`:

```c++
    for (int i = 1; i <= n; ++i) {
        for (int j = 0; j < n - i; ++j) cout << " ";
        for (int j = 0; j < 2*i - 1; ++j) cout << "*";
        cout << endl;
    }
    for (int i = n - 1; i >= 1; --i) {
        for (int j = 0; j < n - i; ++j) cout << " ";
        for (int j = 0; j < 2*i - 1; ++j) cout << "*";
        cout << endl;
    }
```

Aquest codi ja és correcte,
però es podria fer una mica millor?
Per intentar-ho, mirem de trobar fórmules per al nombre d'espais
i el nombre d'asteriscs
que funcionin per a totes les línies:

| `i` | espais | asteriscs |
| --- | :----: | :-------: |
| 1   |   3    |     1     |
| 2   |   2    |     3     |
| 3   |   1    |     5     |
| 4   |   0    |     7     |
| 5   |   1    |     5     |
| 6   |   2    |     3     |
| 7   |   3    |     1     |

Sigui `e` els nombre d'espais que calen.
Podem veure la relació `e` $= \vert$ `n` $ - $ ` i` $\vert$,
és a dir, `e` és el valor absolut de la diferència entre `n` i `i`.
I quants asteriscs calen? Sigui `a` aquest nombre.
A partir de la taula, observem que
$2$ `e` $ + $ `a` $ = 2$ `n` $ - 1$.
Per tant, tenim que
`a` $ = 2$ `n` $ - 2$ `e` $ - 1$.
Com a conclusió, aquesta és una altra solució possible
(aquest cop, incloent el codi complet):

```c++c++
#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;
    for (int i = 1; i <= 2*n - 1; ++i) {
        int e = n - i;
        if (e < 0) e = -e;
        for (int j = 0; j < e; ++j) cout << " ";
        for (int j = 0; j < 2*n - 2*e - 1; ++j) cout << "*";
        cout << endl;
    }
}
```

<Autors autors="jpetit roura"/>
