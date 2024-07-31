# Seqüències

<img src='././sequencies.png' style='height: 8em; float: right; margin: 0 0 1em 1em;'/>

Aquesta lliçó mostra com llegir i tractar un nombre variable de dades
que s'obtenen seqüencialment des de l'entrada.

## Suma d'un nombre desconegut d'enters

Suposem que volem fer un programa que, donats molts elements (enters),
ens calculi quina és la seva suma. Per exemple, donada l'entrada

```text
12 3 109

```

la sortida hauria de ser ~~124~~. I per a l'entrada

```text
3 -4
9      8
11
```

la sortida hauria de ser ~~27~~.
Fixeu-vos que els enters es dónen un rera l'altre,
i poden estar separats tant per espais en blanc
com en línies diferents.
Fixeu-vos també que el seu nombre és desconegut.

Ja sabem com llegir un enter. L'efecte de

```c++
int x;
cin >> x;
```

consisteix a llegir el següent valor de l'entrada
i desar-lo en la variable entera `x`.
Aquesta instrucció de lectura és molt convenient,
perquè ignora els espais i salts de línia
abans i després de l'element llegit.
Però, ara, no en tenim prou amb llegir un enter,
sinó que n'hem de llegir molts i, a més,
no en sabem el nombre a priori.
(Si en coneguéssim el nombre, podríem llegir-los tots amb un bucle `for`.)

La millor manera de sortir-nos-en és fer servir una nova construcció:
El bucle `while (cin >> x) ...`
llegeix repetidament valors de l'entrada desant-los en `x` d'un en un,
fins que no n'hi hagi més.
Altrament dit, `while (cin >> x) ...` en català vol dir
'_mentre puguis llegir un valor `x` fés ..._'.

Ara ja podem resoldre el problema de sumar tots els enters d'una seqüencia.
L'esquema general del programa serà així:

```c++
⋮
int x;
while (cin >> x) {
    ⋮
}
⋮
```

Encara ens cal decidir què cal posar abans del bucle, dintre del bucle,
i després del bucle.
Per poder tenir la suma de tots els enters al final del programa,
utilitzarem una variable `suma`
que guardi la suma de tots els enters llegits fins ara.
Com que en començar encara no hem llegit cap nombre,
cal inicialitzar-la amb el valor neutre de la suma:

```c++
int suma = 0;
```

Al cos del bucle, cal que actualitzem el valor de `suma` adequadament:
Si `suma` contenia la suma de tots els enters llegits fins al moment,
i ara mateix s'acaba de llegir un nou nombre `x`,
cal fer

```c++
    suma = suma + x;
```

per incrementar el valor de `suma` en `x`.

I, al final del programa,
és clar que només cal escriure el valor calculat:

```c++
cout << suma << endl;
```

Ja podem completar tot el programa:

```c++
#include <iostream>
using namespace std;

int main() {
    int suma = 0;
    int x;
    while (cin >> x) {
        suma = suma + x;
    }
    cout << suma << endl;
}
```

Fixeu-vos que en el cas que l'entrada sigui buida, el programa dirà
que la suma és zero, tal com cal.

Com a comentari final, el bucle `while` es podria fer encara més compacte:
D'una banda, el seu interior es podria escriure així:

```c++
    suma += x;
```

Aquesta instrucció vol dir '_incrementa_ `suma` _amb_ `x`'.
A més, com que dins del `while` només hi ha una instrucció,
no cal usar les claus.
És a dir, podríem senzillament escriure el `while` així:

```c++
    while (cin >> x) suma += x;
```

## Final de l'entrada

Si executem interactivament el programa anterior,
necessitem assenyalar el final de l'entrada d'alguna manera.
Altrament, el programa no pot saber que no li volem donar cap nombre més,
s'espera a rebre un nou nombre inexistent,
el bucle no acaba,
i el programa no escriu res.

La forma d'indicar la fi de l'entrada depèn del sistema operatiu:

-   En Linux i Mac OS, cal picar alhora les tecles <kbd>Control</kbd> i <kbd>d</kbd>.
-   En Windows, cal picar alhora les tecles <kbd>Control</kbd> i <kbd>z</kbd>.

Aquestes combinacions de tecles
indiquen al programa que l'entrada s'ha acabat,
cosa que fa que la condició `(cin >> x)` del `while` sigui falsa:
ja no es poden llegir més dades perquè no n'hi ha més.

Si no executem el programa interactivament,
sinó que li passem l'entrada des d'un fitxer o des d'una _pipe_
(vegeu la lliçó sobre [el terminal](/terminal/index.html)),
no cal fer res.
Simplement, quan el fitxer s'acaba,
el programa també acaba perquè no hi ha res més a llegir.

Aprofitem per fer un comentari més: La combinació de tecles
<kbd>Control</kbd> i <kbd>c</kbd>
atura qualsevol programa.
D'això, els informàtics en diem '_matar_' el programa.
Aquesta combinació se sol usar quan un programa triga massa a acabar,
o bé quan '_s'ha penjat_',
és a dir, quan ha entrat en un bucle infinit
i no podria acabar mai per ell mateix.
Fixeu-vos que si matéssim el programa anterior
en lloc d'indicar-li que l'entrada s'ha acabat,
el programa s'aturaria immediatament sense escriure res.

## Màxim d'un nombre desconegut d'enters

Considerem ara que volem fer un programa que, donats molts elements (enters),
ens calculi quin n'és el més gran.
Com que el màxim d'una seqüència buida no està ben definit,
en aquest cas exigim que la seqüència tingui, com a mínim, un element.

Com a exemple, donada l'entrada ~~2 9 -3 73 -22 5~~, la sortida hauria de ser
~~73~~.

Podem resoldre aquest problema de forma semblant a l'anterior:

-   Usarem un bucle `while (cin >> x)` per poder llegir seqüencialment
    tots els enters de l'entrada.

-   Utilitzarem una variable `m` que representi el
    màxim de tots els enters llegits fins al moment.

-   A cada iteració, si el valor d'`x` supera el d'`m`, actualitzarem
    el valor d'`m`.

Això dona lloc a aquesta quasi-solució:

```c++
int m = ???;                // 👁
int x;
while (cin >> x) {
    if (x > m) m = x;
}
cout << m << endl;
```

Però... quin és el valor adequat per inicialitzar `m`?

Seria temptador usar un zero com a valor inicial,
fent `int m = 0;`.
I, si provéssim el codi amb l'entrada ~~2 9 -3 73 -22 5~~ mencionada anteriorment,
la sortida seria ~~73~~, com cal.
Lamentablement, el codi seria defectuós,
i podria passar fàcilment per correcte.
D'aquest tipus d'errors, que no són trivials de detectar,
els informàtics en diem _bugs_.

Així doncs, quan podria fallar el codi?
Suposeu que tots els enters de l'entrada fossin negatius,
com ara ~~-3 -9 -2 -5~~.
En aquest cas, el programa escriuria ~~0~~ en lloc de ~~-2~~!

Una millor alternativa seria adonar-nos-en
que el valor matemàticament adequat per inicialitzar `m` és -∞ (menys infinit).
Aquesta tria seria correcta des del punt de vista teòric però,
malauradament, els enters de C++ (`int`s) no poden representar ni -∞ ni +∞.

La millor solució és usar el primer element de la seqüència
(que sabem que existeix segur)
per inicialitzar `m`. Així:

```c++
int m;
cin >> m;                   // A
int x;
while (cin >> x) {          // B
    if (x > m) m = x;
}
cout << m << endl;
```

Ara la seqüencia es llegeix en dos punts diferents del programa:
en A, llegim el primer element,
i en B, la resta, fins que no n'hi ha més.

<Autors autors="jpetit roura"/>
